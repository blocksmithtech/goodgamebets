install:
	make update && make database

update:
	bundle install && \
	yarn install

start:
	rails s

seed:
	rake db:seed

migrate:
	rake db:migrate

rollback:
	rake db:rollback

console:
	rails console

routs:
	rake routes

test:
	bundle exec rspec

database:
	docker run -d --name ggt-db -p "5432:5432" -e POSTGRES_USER=goodgamebets -e POSTGRES_PASSWORD="" postgres:alpine && \
	sleep 5 && \
	rake db:create db:migrate

clean:
	docker stop ggt-db && docker rm ggt-db
