"""
This is the pod_failure_policy module in k8s.api.batch.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema PodFailurePolicy:
    r"""
    PodFailurePolicy describes how failed pods influence the backoffLimit.

    Attributes
    ----------
    rules : [PodFailurePolicyRule], default is Undefined, required
        A list of pod failure policy rules. The rules are evaluated in order. Once a rule matches a Pod failure, the remaining of the rules are ignored. When no rule matches the Pod failure, the default handling applies - the counter of pod failures is incremented and it is checked against the backoffLimit. At most 20 elements are allowed.
    """


    rules: [PodFailurePolicyRule]


