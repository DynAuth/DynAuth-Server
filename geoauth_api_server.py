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

from geoauth.blueprint.api import api_blueprint
app.register_blueprint(api_blueprint, url_prefix='/api')

if __name__ == "__main__":
    app.run(debug=True)
