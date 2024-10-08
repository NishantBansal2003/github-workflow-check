"""
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""
import regex
import k8s.apimachinery.pkg.apis.meta.v1
_regex_match = regex.match


schema ClusterAttach:
    """
    ClusterAttach provides cluster-wide logging configuration

    Attributes
    ----------
    apiVersion : str, default is "kwok.x-k8s.io/v1alpha1", required
        APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, default is "ClusterAttach", required
        Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : v1.ObjectMeta, default is Undefined, required
        metadata
    spec : KwokxK8sIoV1alpha1ClusterAttachSpec, default is Undefined, required
        spec
    status : KwokxK8sIoV1alpha1ClusterAttachStatus, default is Undefined, optional
        status
    """


    apiVersion: "kwok.x-k8s.io/v1alpha1" = "kwok.x-k8s.io/v1alpha1"

    kind: "ClusterAttach" = "ClusterAttach"

    metadata: v1.ObjectMeta

    spec: KwokxK8sIoV1alpha1ClusterAttachSpec

    status?: KwokxK8sIoV1alpha1ClusterAttachStatus


schema KwokxK8sIoV1alpha1ClusterAttachSpec:
    """
    Spec holds spec for cluster attach.

    Attributes
    ----------
    attaches : [KwokxK8sIoV1alpha1ClusterAttachSpecAttachesItems0], default is Undefined, required
        Attaches is a list of attach configurations.
    selector : KwokxK8sIoV1alpha1ClusterAttachSpecSelector, default is Undefined, optional
        selector
    """


    attaches: [KwokxK8sIoV1alpha1ClusterAttachSpecAttachesItems0]

    selector?: KwokxK8sIoV1alpha1ClusterAttachSpecSelector


schema KwokxK8sIoV1alpha1ClusterAttachSpecAttachesItems0:
    """
    AttachConfig holds information how to attach.

    Attributes
    ----------
    containers : [str], default is Undefined, optional
        Containers is list of container names.
    logsFile : str, default is Undefined, optional
        LogsFile is the file from which the attach starts
    """


    containers?: [str]

    logsFile?: str


schema KwokxK8sIoV1alpha1ClusterAttachSpecSelector:
    """
    Selector is a selector to filter pods to configure.

    Attributes
    ----------
    matchNames : [str], default is Undefined, optional
        MatchNames is a list of names to match.
        if not set, all names will be matched.
    matchNamespaces : [str], default is Undefined, optional
        MatchNamespaces is a list of namespaces to match.
        if not set, all namespaces will be matched.
    """


    matchNames?: [str]

    matchNamespaces?: [str]


schema KwokxK8sIoV1alpha1ClusterAttachStatus:
    """
    Status holds status for cluster attach

    Attributes
    ----------
    conditions : [KwokxK8sIoV1alpha1ClusterAttachStatusConditionsItems0], default is Undefined, optional
        Conditions holds conditions for cluster attach.
    """


    conditions?: [KwokxK8sIoV1alpha1ClusterAttachStatusConditionsItems0]


schema KwokxK8sIoV1alpha1ClusterAttachStatusConditionsItems0:
    """
    Condition contains details for one aspect of the current state of this API Resource.

    Attributes
    ----------
    lastTransitionTime : str, default is Undefined, required
        LastTransitionTime is the last time the condition transitioned from one status to another.
        This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable.
    message : str, default is Undefined, required
        Message is a human readable message indicating details about the transition.
        This may be an empty string.
    reason : str, default is Undefined, required
        Reason contains a programmatic identifier indicating the reason for the condition's last transition.
        Producers of specific condition types may define expected values and meanings for this field,
        and whether the values are considered a guaranteed API.
        The value should be a CamelCase string.
        This field may not be empty.
    status : str, default is Undefined, required
        Status of the condition
    $type : str, default is Undefined, required
        Type of condition in CamelCase or in foo.example.com/CamelCase.
        Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be
        useful (see .node.status.conditions), the ability to deconflict is important.
        The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)
    """


    lastTransitionTime: str

    message: str

    reason: str

    status: str

    $type: str


    check:
        len(message) <= 32768
        len(reason) <= 1024
        len(reason) >= 1
        _regex_match(str(reason), r"^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$")
        len($type) <= 316
        _regex_match(str($type), r"^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$")


