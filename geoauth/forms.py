from flask.ext.wtf import Form, TextField, Required, FloatField, DateTimeField


class LocationUpdateForm(Form):
    device_id = TextField("device_id", validators=[Required()])
    latitude = FloatField("latitude", validators=[Required()])
    longitude = FloatField("longitude", validators=[Required()])
    time = DateTimeField("time", validators=[Required()])


class LocationRegionForm(LocationUpdateForm):
    time = DateTimeField("time")
    radius = FloatField("radius")
    name = TextField("name", validators=[Required()])


class DeviceRegistrationForm(Form):
    device_key = TextField("device_key", validators=[Required()])
    device_name = TextField("device_name", validators=[Required()])
    username = TextField("username", validators=[Required()])
    password = TextField("password", validators=[Required()])


class DeviceKeyRequestForm(Form):
    api_key = TextField("api_key", validators=[Required()])


