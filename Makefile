start:
	sudo nginx -p . -c conf/application.conf
stop:
	sudo nginx -p . -s stop -c conf/application.conf
restart: stop start
