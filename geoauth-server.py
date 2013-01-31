from flask import Flask, render_template, request, abort
from flask.ext.sqlalchemy import SQLAlchemy
import geoauth.config
import datetime

SERVER_VERSION = '0.0.1'

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db.sqlite3'
db = SQLAlchemy(app)
geoauth.config.db = db

from geoauth.models import Device, LocationUpdateRecord, LocationUpdateTag

with app.test_request_context():
    #db.drop_all()
    db.create_all()

@app.context_processor
def inject_srv_version():
    return dict(SERVER_VERSION=SERVER_VERSION)

@app.route('/')
def server_ident():
    return render_template("server_ident.html")

@app.route('/api/checkin', methods=['POST'])
def check_in():
    assert request.method == 'POST'
    lat = request.form.get('lat',None)
    lon = request.form.get('lon',None)
    time = request.form.get('time',None)
    dev = request.form.get('dev',None)

    if None in [lat, lon, time, dev]:
        abort(400)
    try:
        lat = float(lat)
        lon = float(lon)
        time = float(time)
    except ValueError:
        abort(400)

    device = list(Device.query.filter_by(name=dev))
    if len(device) != 0:
        device = device[0]
    else:
        device = Device(dev)
        db.session.add(device)
        db.session.commit()

    dt = datetime.datetime.fromtimestamp(time)
    rec = LocationUpdateRecord(device, lat, lon, dt)
    db.session.add(rec)
    db.session.commit()

    return "(%f, %f) @ %f" % (lat, lon, time)

@app.route('/test/api/checkin')
def test_check_in():
    output = None
    from random import random
    import time
    with app.test_request_context(path='/api/checkin', method='POST', data={'lat':random()*10.0, 'lon':random()*10.0, 'time':time.time(), 'dev':'testclient'}):
        output = check_in()
    return output

@app.route('/test/api/checkin/<device>')
def test_check_in(device):
    output = None
    from random import random
    import time
    with app.test_request_context(path='/api/checkin', method='POST', data={'lat':random()*10.0, 'lon':random()*10.0, 'time':time.time(), 'dev':device}):
        output = check_in()
    return output

@app.route('/data')
def server_ident():
    devices = Device.query.all()
    return render_template("show_data.html", devices=devices)

if __name__ == '__main__':
    app.run(debug=True)
