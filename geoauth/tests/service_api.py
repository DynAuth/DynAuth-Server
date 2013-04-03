import requests

creq = requests.post('http://localhost:8000/api/service/challenge/request',
                     {'api_key': '570915b1b5cb4db6981f463b48d09ad8',
                      'username': 'okam0013'})
cresp_good = requests.post('http://localhost:8000/api/service/challenge/response',
                           {'api_key': '570915b1b5cb4db6981f463b48d09ad8',
                            'challenge_key': creq.content,
                            'challenge_response': 'freeway-drive'})

assert cresp_good.status_code == 200


creq = requests.post('http://localhost:8000/api/service/challenge/request',
                     {'api_key': '570915b1b5cb4db6981f463b48d09ad8',
                      'username': 'okam0013'})
cresp_bad = requests.post('http://localhost:8000/api/service/challenge/response',
                           {'api_key': '570915b1b5cb4db6981f463b48d09ad8',
                            'challenge_key': creq.content,
                            'challenge_response': 'not-freeway-drive'})

assert cresp_bad.status_code == 403

print ">> SERVICE API TESTS PASSED"