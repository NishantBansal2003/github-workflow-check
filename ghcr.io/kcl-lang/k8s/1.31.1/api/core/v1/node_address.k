"""
This is the node_address module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema NodeAddress:
    r"""
    NodeAddress contains information for the node's address.

    Attributes
    ----------
    address : str, default is Undefined, required
        The node address.
    $type : str, default is Undefined, required
        Node address type, one of Hostname, ExternalIP or InternalIP.
    """


    address: str

    $type: str


