.DEFAULT_GOAL := help

include .env
export

up:
	docker-compose up -d
	docker-compose logs -f
down:
	docker-compose down
build:
	docker-compose build
bash:
	docker-compose exec web bash