"""
This is the token_request_status module in k8s.api.authentication.v1 package.
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""


schema TokenRequestStatus:
    r"""
    TokenRequestStatus is the result of a token request.

    Attributes
    ----------
    expirationTimestamp : str, default is Undefined, required
        ExpirationTimestamp is the time of expiration of the returned token.
    token : str, default is Undefined, required
        Token is the opaque bearer token.
    """


    expirationTimestamp: str

    token: str


