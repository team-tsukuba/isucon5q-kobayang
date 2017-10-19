system-reload:
	make nginx-reload
	make service-reload

service-reload:
	cd webapp/ruby
	(cd /home/isucon/webapp/ruby; ~/.local/ruby/bin/bundle install)
	sudo systemctl restart isuxi.ruby.service
	cd
	#make db_up

nginx-reload:
	sudo nginx -s reload

deploy:
	git pull
	make system-reload

db_up:
	/home/isucon/webapp/go/bin/goose up

db_down:
	/home/isucon/webapp/go/bin/goose down 
