"""
This is the sleep_action module in k8s.api.core.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema SleepAction:
    r"""
    SleepAction describes a "sleep" action.

    Attributes
    ----------
    seconds : int, default is Undefined, required
        Seconds is the number of seconds to sleep.
    """


    seconds: int


