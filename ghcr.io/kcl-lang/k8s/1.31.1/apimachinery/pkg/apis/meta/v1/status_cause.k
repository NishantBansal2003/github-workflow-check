"""
This is the status_cause module in k8s.apimachinery.pkg.apis.meta.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema StatusCause:
    r"""
    StatusCause provides more information about an api.Status failure, including cases when multiple errors are encountered.

    Attributes
    ----------
    field : str, default is Undefined, optional
        The field of the resource that has caused this error, as named by its JSON serialization. May include dot and postfix notation for nested attributes. Arrays are zero-indexed.  Fields may appear more than once in an array of causes due to fields having multiple errors. Optional.

        Examples:
          "name" - the field "name" on the current resource
          "items[0].name" - the field "name" on the first array entry in "items"
    message : str, default is Undefined, optional
        A human-readable description of the cause of the error.  This field may be presented as-is to a reader.
    reason : str, default is Undefined, optional
        A machine-readable description of the cause of the error. If this value is empty there is no information available.
    """


    field?: str

    message?: str

    reason?: str


