"""
This is the node_config_source module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema NodeConfigSource:
    r"""
    NodeConfigSource specifies a source of node configuration. Exactly one subfield (excluding metadata) must be non-nil. This API is deprecated since 1.22

    Attributes
    ----------
    configMap : ConfigMapNodeConfigSource, default is Undefined, optional
        ConfigMap is a reference to a Node's ConfigMap
    """


    configMap?: ConfigMapNodeConfigSource


