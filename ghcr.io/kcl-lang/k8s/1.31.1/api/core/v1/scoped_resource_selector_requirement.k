"""
This is the scoped_resource_selector_requirement module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema ScopedResourceSelectorRequirement:
    r"""
    A scoped-resource selector requirement is a selector that contains values, a scope name, and an operator that relates the scope name and values.

    Attributes
    ----------
    operator : str, default is Undefined, required
        Represents a scope's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist.
    scopeName : str, default is Undefined, required
        The name of the scope that the selector applies to.
    values : [str], default is Undefined, optional
        An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.
    """


    operator: str

    scopeName: str

    values?: [str]


