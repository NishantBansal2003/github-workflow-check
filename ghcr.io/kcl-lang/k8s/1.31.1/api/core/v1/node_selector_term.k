"""
This is the node_selector_term module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema NodeSelectorTerm:
    r"""
    A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm.

    Attributes
    ----------
    matchExpressions : [NodeSelectorRequirement], default is Undefined, optional
        A list of node selector requirements by node's labels.
    matchFields : [NodeSelectorRequirement], default is Undefined, optional
        A list of node selector requirements by node's fields.
    """


    matchExpressions?: [NodeSelectorRequirement]

    matchFields?: [NodeSelectorRequirement]


