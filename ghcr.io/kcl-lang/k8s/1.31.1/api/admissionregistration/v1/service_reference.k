"""
This is the service_reference module in k8s.api.admissionregistration.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema ServiceReference:
    r"""
    ServiceReference holds a reference to Service.legacy.k8s.io

    Attributes
    ----------
    name : str, default is Undefined, required
        `name` is the name of the service. Required
    namespace : str, default is Undefined, required
        `namespace` is the namespace of the service. Required
    path : str, default is Undefined, optional
        `path` is an optional URL path which will be sent in any request to this service.
    port : int, default is Undefined, optional
        If specified, the port on the service that hosting webhook. Default to 443 for backward compatibility. `port` should be a valid port number (1-65535, inclusive).
    """


    name: str

    namespace: str

    path?: str

    port?: int


