#!/usr/bin/env python
# encoding: utf-8
import os

import requests

try:
    os.remove('maintenance')
except FileNotFoundError:
    pass

assert requests.get('http://localhost:8000/').text == 'Hi from /'
assert requests.get('http://localhost:8000/foo').text == 'Hi from /foo'

open('maintenance', 'w').close()
assert requests.get('http://localhost:8000/').text == 'Maintenance'
assert requests.get('http://localhost:8000/foo').text == 'Maintenance'
assert requests.get('http://localhost:8000/').status_code == 503
assert requests.get('http://localhost:8000/foo').status_code == 503
