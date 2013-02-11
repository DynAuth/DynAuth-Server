# GeoAuth Server
This is the server for GeoAuth, a research project exploring authentication using geographic location information. This server provides a data collection API that GPS-enabled smartphones can use to post location information.

# API
Currently, the API has a single endpoint. More endpoints will be added as support is required (i.e., registering new devices, data querying, etc.).

API endpoints are defined as:
    
    METHOD : URI

For multi-method support, they are defined as:
    
    METHOD1, METHOD2 : URI

Multi-method support is for future endpoints that might require a richer API.

## ``POST`` : ``/api/checkin``
Perform a device location check-in.

### Parameters

* ``lat``: the device's current latitude
* ``lon``: the device's current longitude
* ``time``: the time of the check-in
* ``dev``: the device identification string

### To-do

* Require sending of a device key and a secret sent **ONCE** by the server. This would harden against client spoofing to some degree.
* Allow bulk submission to prevent API overload

## ``POST`` : ``/api/register``
Register a device on the server, authorizing the registration using a device key.

### Parameters

* ``dev``: the device's identifier string
* ``key``: the device's authorization key

## ``POST`` : ``/api/request-dev-key``
Request a new device key registered to a specific API key.

### Parameters

* ``api_key``: a valid API key

### To-do

* Require authentication using some kind of secret

