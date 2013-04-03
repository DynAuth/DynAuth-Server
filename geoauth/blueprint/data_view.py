from flask import Blueprint, request, abort, current_app, render_template
from geoauth.forms import LocationUpdateForm, LocationRegionForm, DeviceRegistrationForm, DeviceKeyRequestForm
from geoauth.models import Device, DeviceKey, DeviceLocationUpdate, \
    DeviceLocationRegion, APIAccount, APIKey, UserAccount

data_view_blueprint = Blueprint("geoauth_data_view", __name__, template_folder="data_view_templates")

@data_view_blueprint.route('/api/key')
def api_key_list():
    keys = APIKey.query.all()
    return render_template("api_key_list.html", keys=keys)

@data_view_blueprint.route('/device/key')
def device_key_list():
    keys = DeviceKey.query.all()
    return render_template("device_key_list.html", keys=keys)

@data_view_blueprint.route('/device/list')
def device_list():
    devices = Device.query.all()
    return render_template("device_list.html", devices=devices)

@data_view_blueprint.route('/device/detail')
def device_detail():
    devices = Device.query.all()
    return render_template("device_detail.html", devices=devices)