package main

import (
	"fmt"
	"net/url"
	"os"
	"path/filepath"

	"kcl-lang.io/kpm/pkg/client"
	"kcl-lang.io/kpm/pkg/downloader"
	"kcl-lang.io/kpm/pkg/oci"
	"kcl-lang.io/kpm/pkg/opt"
	pkg "kcl-lang.io/kpm/pkg/package"
	"kcl-lang.io/kpm/pkg/reporter"
	"kcl-lang.io/kpm/pkg/utils"
)

const (
	OutputFileName = "checksum-report.md"
	KclModFile     = "kcl.mod"
)

// findKCLModFiles locates all kcl.mod files in the specified directory and returns their paths.
func findKCLModFiles(root string) ([]string, error) {
	var locations []string

	err := filepath.Walk(root, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err // Stop the walk on error
		}

		// Check if it's a file and the name is kcl.mod
		if !info.IsDir() && info.Name() == KclModFile {
			// Get the directory containing kcl.mod
			dir := filepath.Dir(path)
			locations = append(locations, dir)
		}

		return nil // Continue walking
	})
	if err != nil {
		return nil, err
	}
	return locations, nil
}

// genDefaultOciUrlForKclPkg generates the default OCI URL for the given package.
func genDefaultOciUrlForKclPkg(pkg *pkg.KclPkg, kpmcli *client.KpmClient) (string, error) {
	urlPath := utils.JoinPath(kpmcli.GetSettings().DefaultOciRepo(), pkg.GetPkgName())

	u := &url.URL{
		Scheme: oci.OCI_SCHEME,
		Host:   kpmcli.GetSettings().DefaultOciRegistry(),
		Path:   urlPath,
	}

	return u.String(), nil
}

// hasChecksum checks if the package at the given location has a checksum.
func hasChecksum(directory string) (string, bool) {
	kpmCli, err := client.NewKpmClient()
	if err != nil {
		fmt.Printf("Failed to create KPM client: %v\n", err)
		return "", false
	}

	kclPkg, err := kpmCli.LoadPkgFromPath(directory)
	if err != nil {
		fmt.Printf("Failed to load package from path %s: %v\n", directory, err)
		return "", false
	}

	ociUrl, err := genDefaultOciUrlForKclPkg(kclPkg, kpmCli)
	if err != nil {
		fmt.Printf("Failed to generate OCI URL for package %s: %v\n", kclPkg.GetPkgFullName(), err)
		return kclPkg.GetPkgFullName(), false
	}

	// Generate OCI options from the OCI URL and the version of the current KCL package.
	ociOpts, err := opt.ParseOciOptionFromOciUrl(ociUrl, kclPkg.GetPkgTag())
	if err != (*reporter.KpmEvent)(nil) {
		fmt.Printf("Failed to parse OCI options for package %s: %v\n", kclPkg.GetPkgFullName(), err)
		return kclPkg.GetPkgFullName(), false
	}

	dep := &pkg.Dependency{
		Name: kclPkg.ModFile.Pkg.Name,
		Source: downloader.Source{
			Oci: &downloader.Oci{
				Reg:  ociOpts.Reg,
				Repo: ociOpts.Repo,
				Tag:  ociOpts.Tag,
			},
		},
	}
	dep.FromKclPkg(kclPkg)

	sum, err := kpmCli.AcquireDepSum(*dep)
	if err != nil || len(sum) == 0 {
		return kclPkg.GetPkgFullName(), false
	}
	return kclPkg.GetPkgFullName(), true
}

func generateMarkdownReport(locations []string) error {
	outputFile, err := os.Create(OutputFileName)
	if err != nil {
		return fmt.Errorf("error creating output file: %w", err)
	}
	defer outputFile.Close() // Ensure the file is closed after writing

	// Write the markdown formatted report
	_, err = outputFile.WriteString("# Checksum Report\n\n")
	if err != nil {
		return fmt.Errorf("error writing header to output file: %w", err)
	}
	_, err = outputFile.WriteString("| Package Full Name | Package Location | Checksum Status|\n")
	if err != nil {
		return fmt.Errorf("error writing table header to output file: %w", err)
	}
	_, err = outputFile.WriteString("|-------------------|------------------|----------------|\n")
	if err != nil {
		return fmt.Errorf("error writing table separator to output file: %w", err)
	}

	pkgWithChecksum := 0

	for _, loc := range locations {
		checksumStatus := "❌ No"
		pkgName, hasSum := hasChecksum(loc)
		if hasSum {
			checksumStatus = "✅ Yes"
			pkgWithChecksum++
		}

		_, err = outputFile.WriteString(fmt.Sprintf("| %s | %s | %s |\n", pkgName, loc, checksumStatus))
		if err != nil {
			return fmt.Errorf("error writing package info to output file: %w", err)
		}
	}

	_, err = outputFile.WriteString("\n---\n")
	if err != nil {
		return fmt.Errorf("error writing separator to output file: %w", err)
	}
	// Write the summary in a visually appealing way
	_, err = outputFile.WriteString("## Summary\n")
	if err != nil {
		return fmt.Errorf("error writing summary header to output file: %w", err)
	}
	_, err = outputFile.WriteString("| Metric                     | Count |\n")
	if err != nil {
		return fmt.Errorf("error writing summary table header to output file: %w", err)
	}
	_, err = outputFile.WriteString("|----------------------------|-------|\n")
	if err != nil {
		return fmt.Errorf("error writing summary table separator to output file: %w", err)
	}
	_, err = outputFile.WriteString(fmt.Sprintf("| Total Packages Checked      | %d     |\n", len(locations)))
	if err != nil {
		return fmt.Errorf("error writing total packages to output file: %w", err)
	}
	_, err = outputFile.WriteString(fmt.Sprintf("| Packages with Checksum      | %d     |\n", pkgWithChecksum))
	if err != nil {
		return fmt.Errorf("error writing packages with checksum to output file: %w", err)
	}
	_, err = outputFile.WriteString("\n---\n")
	if err != nil {
		return fmt.Errorf("error writing final separator to output file: %w", err)
	}

	return nil
}

func main() {
	root, err := os.Getwd()
	if err != nil {
		fmt.Println("Error getting current directory:", err)
		return
	}

	locations, err := findKCLModFiles(root)
	if err != nil {
		fmt.Println("Error finding kcl.mod files:", err)
		return
	}

	err = generateMarkdownReport(locations)
	if err != nil {
		fmt.Println("Error generating markdown report:", err)
		return
	}

	fmt.Println("Markdown report generated:", OutputFileName)
}
