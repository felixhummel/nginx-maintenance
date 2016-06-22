default: run test stop

.PHONY: run
run:
	nginx -p $(shell pwd) -c ./nginx.conf
.PHONY: reload
reload:
	nginx -p $(shell pwd) -c ./nginx.conf -s reload
.PHONY: stop
stop:
	nginx -p $(shell pwd) -c ./nginx.conf -s stop

enable:
	test -f maintenance.html || mv maintenance.html.disabled maintenance.html
disable:
	test -f maintenance.html.disabled || mv maintenance.html.disabled maintenance.html

test:
	./test.py
