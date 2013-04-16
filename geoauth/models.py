from config import db
from sqlalchemy import Column, Integer, String, Text, ForeignKey, Boolean, Float, DateTime
from sqlalchemy.orm import relationship
from passlib.hash import pbkdf2_sha512
from uuid import uuid4

from ga_math import distance_on_unit_sphere


class APIAccount(db.Model):
    account_id = Column(Integer, primary_key=True)
    username = Column(String(64))
    password = Column(String(130))

    name = Column(String(255))

    def __init__(self, username, password):
        self.username = username
        self.password = pbkdf2_sha512.encrypt(password)

    def __unicode__(self):
        return self.name

    def authenticate(self, password):
        return pbkdf2_sha512.verify(password, self.password)


class APIKey(db.Model):
    key_id = Column(Integer, primary_key=True)
    key = Column(String(32), unique=True)

    account_id = Column(Integer, ForeignKey(APIAccount.__tablename__ + ".account_id"))
    account = relationship("APIAccount", backref="api_keys")

    name = Column(String(255))

    def __init__(self, account, name):
        self.account_id = account.account_id
        self.name = name
        self.key = uuid4().hex


class UserAccount(db.Model):
    user_id = Column(Integer, primary_key=True)
    username = Column(String(64))
    password = Column(String(130))

    name = Column(String(255))

    def __init__(self, username, password):
        self.username = username
        self.password = pbkdf2_sha512.encrypt(password)

    def authenticate(self, password):
        return pbkdf2_sha512.verify(password, self.password)


class DeviceKey(db.Model):
    key_id = Column(Integer, primary_key=True)
    key = Column(String(32), unique=True, nullable=False)

    api_key_id = Column(Integer, ForeignKey(APIKey.__tablename__ + ".key_id"), nullable=False)
    api_key = relationship("APIKey", backref="device_keys")

    activated = Column(Boolean, default=False, nullable=False)

    def __init__(self, api_key):
        self.api_key_id = api_key.key_id
        self.key = uuid4().hex
        self.activated = False

    def use_key(self, device_name, user):
        self.activated = True
        dev = Device(self, device_name)
        dev.user_id = user.user_id
        return dev


class Device(db.Model):
    device_id = Column(Integer, primary_key=True)
    uuid = Column(String(32), unique=True, nullable=False)

    name = Column(String(255))

    device_key_id = Column(Integer, ForeignKey(DeviceKey.__tablename__ + ".key_id"), nullable=False, unique=True)
    device_key = relationship("DeviceKey", backref="device")

    user_id = Column(Integer, ForeignKey(UserAccount.__tablename__ + ".user_id"), nullable=False)#, unique=True)
    user = relationship("UserAccount", backref="devices")

    def __init__(self, device_key, name):
        self.uuid = uuid4().hex
        self.device_key_id = device_key.key_id
        self.name = name


class DeviceLocationUpdate(db.Model):
    update_id = Column(Integer, primary_key=True)
    latitude = Column(Float, nullable=False)
    longitude = Column(Float, nullable=False)
    time = Column(DateTime, nullable=False)

    device_id = Column(Integer, ForeignKey(Device.__tablename__ + ".device_id"), nullable=False)
    device = relationship("Device", backref="location_updates")

    def __init__(self, device, lat, lon, time):
        self.device_id = device.device_id
        self.latitude = lat
        self.longitude = lon
        self.time = time


class DeviceLocationRegion(db.Model):
    region_id = Column(Integer, primary_key=True)

    latitude = Column(Float, nullable=False)
    longitude = Column(Float, nullable=False)
    radius = Column(Float, nullable=False)
    time = Column(DateTime, nullable=False)

    name = Column(String(255), nullable=False)

    device_id = Column(Integer, ForeignKey(Device.__tablename__ + ".device_id"), nullable=False)
    device = relationship("Device", backref="location_regions")

    def __init__(self, device, lat, lon, time, name, radius=0.5):
        self.device_id = device.device_id
        self.latitude = lat
        self.longitude = lon
        self.radius = radius
        self.time = time
        self.name = name

    def location_in_region(self, location):
        print self.radius
        if distance_on_unit_sphere(self.latitude, self.longitude,
                                   location.latitude, location.longitude) <= self.radius:
            return True
        else:
            return False


class Challenge(db.Model):
    challenge_id = Column(Integer, primary_key=True)

    challenge_key = Column(String(32), unique=True, nullable=False)

    region_id = Column(Integer, ForeignKey(DeviceLocationRegion.__tablename__ + ".region_id"), nullable=False)
    region = relationship("DeviceLocationRegion", backref="region_challenges")

    location_id = Column(Integer, ForeignKey(DeviceLocationUpdate.__tablename__ + ".update_id"), nullable=False)
    location = relationship("DeviceLocationUpdate", backref="update_challenges")

    def __init__(self, region, location):
        self.challenge_key = uuid4().hex
        self.region_id = region.region_id
        self.location_id = location.update_id
        self.region = region
        self.location = location
