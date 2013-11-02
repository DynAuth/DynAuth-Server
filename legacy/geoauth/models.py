from config import db
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, Float, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from uuid import uuid4

class Device(db.Model):
    id = Column(Integer, primary_key=True)
    name = Column(String(255), unique=True)
    updates = relationship("LocationUpdateRecord")

    device_key = relationship('DeviceKey', backref='device_object')

    def __init__(self, name):
        self.name = name

class APIKey(db.Model):
    uuid = Column(String(32), primary_key=True)
    owner = Column(String(255), nullable=False)

    def __init__(self, owner):
        self.uuid = uuid4().hex
        self.owner = owner

class DeviceKey(db.Model):
    uuid = Column(String(32), primary_key=True)
    api_key = Column(String(32), ForeignKey(APIKey.__tablename__ + '.uuid'))
    device = Column(Integer, ForeignKey(Device.__tablename__ + '.id'))

    def __init__(self, api_key):
        self.api_key = api_key
        self.uuid = uuid4().hex

class LocationUpdateRecord(db.Model):
    id = Column(Integer, primary_key=True)
    device_id = Column(Integer, ForeignKey(Device.__tablename__+".id"))
    latitude = Column(Float)
    longitude = Column(Float)
    timestamp = Column(DateTime)

    def __init__(self, dev, lat, lon, time):
        self.device_id = dev.id
        self.latitude = lat
        self.longitude = lon
        self.timestamp = time

class LocationUpdateTag(db.Model):
    id = Column(Integer, primary_key=True)
    location_update_id = Column(Integer, ForeignKey(LocationUpdateRecord.__tablename__+".id"))
    name = Column(String(255))
