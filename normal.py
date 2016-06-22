import requests

assert requests.get('http://localhost:8000/').text == 'Hi from /'
assert requests.get('http://localhost:8000/foo').text == 'Hi from /foo'
