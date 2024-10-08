"""
This is the cinder_persistent_volume_source module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema CinderPersistentVolumeSource:
    r"""
    Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling.

    Attributes
    ----------
    fsType : str, default is Undefined, optional
        fsType Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    readOnly : bool, default is Undefined, optional
        readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    secretRef : SecretReference, default is Undefined, optional
        secretRef is Optional: points to a secret object containing parameters used to connect to OpenStack.
    volumeID : str, default is Undefined, required
        volumeID used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    """


    fsType?: str

    readOnly?: bool

    secretRef?: SecretReference

    volumeID: str


