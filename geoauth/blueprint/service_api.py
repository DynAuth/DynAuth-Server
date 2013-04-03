from flask import Blueprint, request, abort, current_app
from geoauth.forms import LocationUpdateForm, LocationRegionForm, DeviceRegistrationForm, DeviceKeyRequestForm
from geoauth.models import Device, DeviceKey, DeviceLocationUpdate, \
    DeviceLocationRegion, APIAccount, APIKey, UserAccount

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
