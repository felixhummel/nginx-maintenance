default: run test stop

.PHONY: run
run:
	nginx -p $(shell pwd) -c ./nginx.conf
.PHONY: stop
stop:
	nginx -p $(shell pwd) -c ./nginx.conf -s stop

enable:
	touch maintenance
disable:
	rm -f maintenance

test:
	./test.py
