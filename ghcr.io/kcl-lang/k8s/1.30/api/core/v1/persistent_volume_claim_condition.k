"""
This is the persistent_volume_claim_condition module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema PersistentVolumeClaimCondition:
    """
    PersistentVolumeClaimCondition contains details about state of pvc

    Attributes
    ----------
    lastProbeTime : str, default is Undefined, optional
        lastProbeTime is the time we probed the condition.
    lastTransitionTime : str, default is Undefined, optional
        lastTransitionTime is the time the condition transitioned from one status to another.
    message : str, default is Undefined, optional
        message is the human-readable message indicating details about last transition.
    reason : str, default is Undefined, optional
        reason is a unique, this should be a short, machine understandable string that gives the reason for condition's last transition. If it reports "Resizing" that means the underlying persistent volume is being resized.
    status : str, default is Undefined, required
        status
    $type : str, default is Undefined, required
        type
    """


    lastProbeTime?: str

    lastTransitionTime?: str

    message?: str

    reason?: str

    status: str

    $type: str


