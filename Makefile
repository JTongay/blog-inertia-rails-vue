.DEFAULT_GOAL := help

include .env
export

init: clean-db build create-db migrate seed npm-install
	echo "Done! You should be able to run 'make up' now."
up:
	docker-compose up -d
	docker-compose logs -f
down:
	docker-compose down
build:
	docker-compose build
bash:
	docker-compose exec web bash
npm-install:
	docker-compose run --rm --entrypoint "bash -c" web "npm install"
create-db:
	docker-compose run -T --rm --entrypoint "bash -c" web "bundle exec rails db:create"
clean-db:
	docker-compose rm -f -s -v db
reset-db:
	docker-compose run -T --rm --entrypoint "bash -c" web "RAILS_ENV=development bundle exec rails db:drop db:create db:schema:load"
migrate:
	docker-compose run -T --rm --entrypoint "bash -c" web "bundle exec rails db:migrate"
test-migrate:
	docker-compose run -T --rm --entrypoint "bash -c" web "RAILS_ENV=test bundle exec rails db:migrate"
seed:
	docker-compose run -T --rm --entrypoint "bash -c" web "bundle exec rails db:seed"
lint:
	docker-compose run -T --rm --entrypoint "bash -c" web "bundle exec rubocop -D"
lint-autofix:
	docker-compose run -T --rm --entrypoint "bash -c" web "bundle exec rubocop -a"
logs-web:
	docker-compose logs -f web
