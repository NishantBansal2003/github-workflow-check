"""
This is the azure_file_volume_source module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema AzureFileVolumeSource:
    r"""
    AzureFile represents an Azure File Service mount on the host and bind mount to the pod.

    Attributes
    ----------
    readOnly : bool, default is Undefined, optional
        readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    secretName : str, default is Undefined, required
        secretName is the  name of secret that contains Azure Storage Account Name and Key
    shareName : str, default is Undefined, required
        shareName is the azure share Name
    """


    readOnly?: bool

    secretName: str

    shareName: str


