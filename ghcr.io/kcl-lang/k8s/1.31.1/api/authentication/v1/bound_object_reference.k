"""
This is the bound_object_reference module in k8s.api.authentication.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema BoundObjectReference:
    r"""
    BoundObjectReference is a reference to an object that a token is bound to.

    Attributes
    ----------
    apiVersion : str, default is Undefined, optional
        API version of the referent.
    kind : str, default is Undefined, optional
        Kind of the referent. Valid kinds are 'Pod' and 'Secret'.
    name : str, default is Undefined, optional
        Name of the referent.
    uid : str, default is Undefined, optional
        UID of the referent.
    """


    apiVersion?: str

    kind?: str

    name?: str

    uid?: str


