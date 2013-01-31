from config import db
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, Float, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship

class Device(db.Model):
    id = Column(Integer, primary_key=True)
    name = Column(String(255), unique=True)
    updates = relationship("LocationUpdateRecord")

    def __init__(self, name):
        self.name = name

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