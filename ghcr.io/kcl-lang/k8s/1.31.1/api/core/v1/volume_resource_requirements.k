"""
This is the volume_resource_requirements module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema VolumeResourceRequirements:
    r"""
    VolumeResourceRequirements describes the storage resource requirements for a volume.

    Attributes
    ----------
    limits : {str:str}, default is Undefined, optional
        Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
    requests : {str:str}, default is Undefined, optional
        Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. Requests cannot exceed Limits. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
    """


    limits?: {str:str}

    requests?: {str:str}


