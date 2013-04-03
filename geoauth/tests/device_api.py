from datetime import datetime
from random import random, randint
import requests as rq
from geoauth.tests import API_KEY


def register_device():
    """
    Register a test device
    """
    dkey_req = rq.post('http://localhost:8000/api/service/request-device-key', {'api_key': API_KEY})
    dkey = dkey_req.content
    if len(dkey) != 32:
        raise ValueError(dkey)

    dreg_req = rq.post('http://localhost:8000/api/device/register', {'username': 'okam0013', 'password': 'porkchop', 'device_key': dkey, 'device_name': 'test-system-%s'%dkey})
    duuid = dreg_req.content
    if len(duuid) != 32:
        raise ValueError(duuid)
    return duuid


def random_msp_location():
    lat = float(randint(43, 45))
    lon = float(randint(92, 94))
    lat += random()
    lon += random()
    return lat, lon


def test_device(iters=10):
    uuid = register_device()
    print uuid
    for i in range(iters):
        lat, lon = random_msp_location()
        post = rq.post('http://localhost:8000/api/device/check-in', {'device_id': uuid, 'latitude': lat, 'longitude': lon, 'time': str(datetime.utcnow())})
        assert post.status_code == 200

test_device()

print ">> DEVICE API TESTS COMPLETE"