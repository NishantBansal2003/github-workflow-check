"""
This is the pod_scheduling_context_status module in k8s.api.resource.v1alpha3 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema PodSchedulingContextStatus:
    r"""
    PodSchedulingContextStatus describes where resources for the Pod can be allocated.

    Attributes
    ----------
    resourceClaims : [ResourceClaimSchedulingStatus], default is Undefined, optional
        ResourceClaims describes resource availability for each pod.spec.resourceClaim entry where the corresponding ResourceClaim uses "WaitForFirstConsumer" allocation mode.
    """


    resourceClaims?: [ResourceClaimSchedulingStatus]


