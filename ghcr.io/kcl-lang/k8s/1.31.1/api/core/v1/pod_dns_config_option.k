"""
This is the pod_dns_config_option module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema PodDNSConfigOption:
    r"""
    PodDNSConfigOption defines DNS resolver options of a pod.

    Attributes
    ----------
    name : str, default is Undefined, optional
        Required.
    value : str, default is Undefined, optional
        value
    """


    name?: str

    value?: str


