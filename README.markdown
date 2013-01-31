# GeoAuth Server
This is the server for GeoAuth, a research project exploring authentication using geographic location information. This server provides a data collection API that GPS-enabled smartphones can use to post location information.

# API
Currently, the API has a single endpoint. More endpoints will be added as support is required (i.e., registering new devices, data querying, etc.).

API endpoints are defined as:
    
    METHOD : URI

For multi-method support, they are defined as:
    
    METHOD1, METHOD2 : URI

Multi-method support is for future endpoints that might require a richer API.

## ``POST : /api/checkin``
Perform a device location check-in.

### Parameters

* ``lat``: the device's current latitude
* ``lon``: the device's current longitude
* ``time``: the time of the check-in
* ``dev``: the device identification string


