"""
This is the group_version_for_discovery module in k8s.apimachinery.pkg.apis.meta.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema GroupVersionForDiscovery:
    r"""
    GroupVersion contains the "group/version" and "version" string of a version. It is made a struct to keep extensibility.

    Attributes
    ----------
    groupVersion : str, default is Undefined, required
        groupVersion specifies the API group and version in the form "group/version"
    version : str, default is Undefined, required
        version specifies the version in the form of "version". This is to save the clients the trouble of splitting the GroupVersion.
    """


    groupVersion: str

    version: str


