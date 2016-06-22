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
	mv maintenance/index.html.disabled maintenance/index.html
disable:
	mv maintenance/index.html maintenance/index.html.disabled

test:
	./test.py
