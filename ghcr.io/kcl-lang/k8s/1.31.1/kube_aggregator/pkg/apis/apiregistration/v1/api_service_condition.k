"""
This is the api_service_condition module in k8s.kube_aggregator.pkg.apis.apiregistration.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema APIServiceCondition:
    r"""
    APIServiceCondition describes the state of an APIService at a particular point

    Attributes
    ----------
    lastTransitionTime : str, default is Undefined, optional
        Last time the condition transitioned from one status to another.
    message : str, default is Undefined, optional
        Human-readable message indicating details about last transition.
    reason : str, default is Undefined, optional
        Unique, one-word, CamelCase reason for the condition's last transition.
    status : str, default is Undefined, required
        Status is the status of the condition. Can be True, False, Unknown.
    $type : str, default is Undefined, required
        Type is the type of the condition.
    """


    lastTransitionTime?: str

    message?: str

    reason?: str

    status: str

    $type: str


