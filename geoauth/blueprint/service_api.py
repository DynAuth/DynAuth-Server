from flask import Blueprint, request, abort, current_app
from geoauth.forms import LocationUpdateForm, LocationRegionForm, DeviceRegistrationForm, DeviceKeyRequestForm, ChallengeRequestForm, ChallengeResponseForm
from geoauth.models import Device, DeviceKey, DeviceLocationUpdate, \
    DeviceLocationRegion, APIAccount, APIKey, UserAccount, Challenge

service_api_blueprint = Blueprint("geoauth_service_api", __name__)

@service_api_blueprint.route('/service/request-device-key', methods=['POST'])
def request_device_key():
    form = DeviceKeyRequestForm(csrf_enabled=False)
    if form.validate_on_submit():
        api_key = APIKey.query.filter(APIKey.key == form.api_key.data).first()
        if api_key is None:
            abort(403)
        dkey = DeviceKey(api_key)
        current_app.db.session.add(dkey)
        current_app.db.session.commit()

        return dkey.key

@service_api_blueprint.route('/service/challenge/request', methods=['POST'])
def request_challenge():
    form = ChallengeRequestForm(csrf_enabled=False)
    if form.validate_on_submit():
        api_key = APIKey.query.filter(APIKey.key == form.api_key.data).first()
        if api_key is None:
            abort(403)

        user = UserAccount.query.filter(UserAccount.username == form.username.data).first()
        if user is None:
            abort(404)

        device = user.devices[0]
        recent_locations = list(DeviceLocationUpdate.query
            .filter(DeviceLocationUpdate.device_id == device.device_id)
            .order_by('-update_id')
            .limit(100))

        regions = device.location_regions

        challenge_region = None
        challenge_location = None
        for r in regions:
            for l in recent_locations:
                if r.location_in_region(l):
                    challenge_region = r
                    challenge_location = l
                    break

        if challenge_region is not None:
            challenge = Challenge(challenge_region, challenge_location)
            current_app.db.session.add(challenge)
            current_app.db.session.commit()
            return challenge.challenge_key + "\n" + challenge_location.time.__format__("%H:%M:%S") + "\n" + challenge_location.time.__format__("%Y-%m-%d")
        else:
            abort(500)
    abort(400)

@service_api_blueprint.route('/service/challenge/response', methods=['POST'])
def challenge_reponse():
    form = ChallengeResponseForm(csrf_enabled=False)
    if form.validate_on_submit():
        api_key = APIKey.query.filter(APIKey.key == form.api_key.data).first()
        if api_key is None:
            abort(403)

        challenge = Challenge.query.filter(Challenge.challenge_key == form.challenge_key.data).first()
        if challenge is None:
            abort(404)

        if challenge.region.name.lower() == form.challenge_response.data.lower():
            current_app.db.session.delete(challenge)
            current_app.db.session.commit()
            return "success"
        else:
            current_app.db.session.delete(challenge)
            current_app.db.session.commit()
            return "failure", 403
