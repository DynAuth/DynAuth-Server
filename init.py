from geoauth_api_server import *
from geoauth.models import *
import sys

db.drop_all()
db.create_all()

# create "user" accounts
okam0013 = UserAccount('okam0013', 'porkchop')
fromx010 = UserAccount('fromx151', 'porkchop')
gerr0041 = UserAccount('gerr0041', 'porkchop')
carte660 = UserAccount('carte660', 'porkchop')

db.session.add_all([okam0013, fromx010, gerr0041, carte660])
db.session.commit()

# create an API account for requests etc
aa = APIAccount('okam0013', 'porkchop')
db.session.add(aa)
db.session.commit()
ak = APIKey(aa, 'testing')
db.session.add(ak)
db.session.commit()

iphone_test_dreq = DeviceKey(ak)
android_test_dreq = DeviceKey(ak)
winphone_test_dreq = DeviceKey(ak)

db.session.add_all([iphone_test_dreq, android_test_dreq, winphone_test_dreq])
db.session.commit()

iphone_test_dev = iphone_test_dreq.use_key('iphone-test', okam0013)
android_test_dev = android_test_dreq.use_key('android-test', carte660)
winphone_test_dev = winphone_test_dreq.use_key('winphone-test', fromx010)

iphone_test_dev.uuid = '852d106e102342c2911455998cf7e637'
android_test_dev.uuid = '667252485e9c43fea5912ad1f291e787'
winphone_test_dev.uuid = 'b082253c85cd4ae7ab059523ad7191a0'

db.session.add_all([iphone_test_dev, android_test_dev, winphone_test_dev])
db.session.commit()

tester = app.test_client()
test_dkey_req = tester.post('/api/service/request-device-key', data={'api_key': ak.key})
test_dkey = test_dkey_req.data

assert DeviceKey.query.filter(DeviceKey.key == test_dkey).count() == 1

test_dreg_req = tester.post('/api/device/register', data={'username': 'okam0013', 'password': 'porkchop', 'device_name': 'test-device', 'device_key': test_dkey})
test_dreg_uuid = test_dreg_req.data

assert Device.query.filter(Device.uuid == test_dreg_uuid).count() == 1

#output = """API_KEY = '%s'""" % ak.key
#f = open('geoauth/tests/__init__.py', 'w')
#f.write(output)
#f.close()