
# File created to increase the productivity and reduce command length on terminal

# How to exec on terminal:
# make db_construct
db_construct:
	docker-compose run --rm app bundle exec rake db:drop db:create db:migrate db:seed

# make migrate
migrate:
	docker-compose run --rm app bundle exec rake db:migrate

# make start
start:
	docker-compose up

# make bundle
bundle:
	docker-compose run --rm app bundle install

# make console
console:
	docker-compose run --rm app bundle exec rails c

# make run_tests
run_tests:
	docker-compose run --rm app bundle exec rspec spec/*