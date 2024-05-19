build:
	docker compose -f srcs/docker-compose.yml build
up:
	docker-compose -f srcs/docker-compose.yml up -d
start:
	docker-compose -f srcrs/docker-compose.yml start
down:
	docker-compose -f srcs/docker-compose.yml down
stop:
	docker-compose -f srcs/docker-compose.yml stop
restart: stop start

fclean: down
	docker image rm mynginx srcs-db
re: fclean build up
.PHONY: build up start down stop restart
