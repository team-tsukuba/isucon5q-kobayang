system-reload:
	make nginx-reload
	make service-reload

service-reload:
	cd /home/isucon/webapp/ruby; /home/isucon/.local/ruby/bin/bundle install 1>/dev/null
	sudo systemctl restart isuxi.ruby.service

nginx-reload:
	sudo nginx -s reload

deploy:
	git pull
	make system-reload

db_up:
	/home/isucon/webapp/go/bin/goose up

db_down:
	/home/isucon/webapp/go/bin/goose down

## Logging
nginx-log:
	sudo tail -f /var/log/nginx/access.log

nginx-error-log:
	sudo tail -f /var/log/nginx/error.log

reset-nginx-log:
	sudo rm /var/log/nginx/access.log & touch /var/log/nginx/access.log

alp:
	sudo alp -f /var/log/nginx/access.log  --sum  -r --aggregates='/diary/comment/*,/diary/entry/*,/profile/*,/diary/entries/*,/friends/*'
