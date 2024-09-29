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

// findKCLModFiles locates all kcl.mod files in the specified directory and returns their paths.
func findKCLModFiles(root string) ([]string, error) {
	var locations []string

	err := filepath.Walk(root, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err // Stop the walk on error
		}

		// Check if it's a file and the name is kcl.mod
		if !info.IsDir() && info.Name() == "kcl.mod" {
			// Get the directory containing kcl.mod
			dir := filepath.Dir(path)
			locations = append(locations, dir)
		}

		return nil // Continue walking
	})

	return locations, err
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
func hasChecksum(directory string) bool {
	kpmCli, err := client.NewKpmClient()
	if err != nil {
		fmt.Printf("Failed to create KPM client: %v\n", err)
		return false
	}

	kclPkg, err := kpmCli.LoadPkgFromPath(directory)
	if err != nil {
		fmt.Printf("Failed to load package from path %s: %v\n", directory, err)
		return false
	}

	ociUrl, err := genDefaultOciUrlForKclPkg(kclPkg, kpmCli)
	if err != nil {
		fmt.Printf("Failed to generate OCI URL for package %s: %v\n", kclPkg.GetPkgFullName(), err)
		return false
	}

	// Generate OCI options from the OCI URL and the version of the current KCL package.
	ociOpts, err := opt.ParseOciOptionFromOciUrl(ociUrl, kclPkg.GetPkgTag())
	if err != (*reporter.KpmEvent)(nil) {
		fmt.Printf("Failed to parse OCI options for package %s: %v\n", kclPkg.GetPkgFullName(), err)
		return false
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
		return false
	}
	return true
}

func main() {
	root, err := os.Getwd()
	if err != nil {
		fmt.Println("Error getting current directory:", err)
		return
	}

	locations, err := findKCLModFiles(root)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	// Create or truncate the output file to write the results
	outputFile, err := os.Create("checksum-report.md")
	if err != nil {
		fmt.Println("Error creating output file:", err)
		return
	}
	defer outputFile.Close() // Ensure the file is closed after writing

	// Write the markdown formatted report
	outputFile.WriteString("# Checksum Report\n\n")
	outputFile.WriteString("| Package Location | Checksum Status |\n")
	outputFile.WriteString("|------------------|------------------|\n")

	for _, loc := range locations {
		// Check if the package has a checksum
		checksumStatus := "❌ No"
		if hasChecksum(loc) {
			checksumStatus = "✅ Yes"
		}

		_, err := outputFile.WriteString(fmt.Sprintf("| %s | %s |\n", loc, checksumStatus))
		if err != nil {
			fmt.Println("Error writing to output file:", err)
			return
		}
	}

	fmt.Println("Markdown report generated: checksum-report.md")
}
