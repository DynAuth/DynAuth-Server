from flask import Flask, current_app, request, g
from geoauth.config import db

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/geoauth-test-db.sqlite3'
app.db = db
db.init_app(app)
db.app = app

from geoauth.models import *

with app.test_request_context():
    db.create_all()

from geoauth.blueprint.device_api import device_api_blueprint
app.register_blueprint(device_api_blueprint, url_prefix='/api')

from geoauth.blueprint.service_api import service_api_blueprint
app.register_blueprint(service_api_blueprint, url_prefix='/api')

from geoauth.blueprint.data_view import data_view_blueprint
app.register_blueprint(data_view_blueprint, url_prefix='/data')

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8000)
