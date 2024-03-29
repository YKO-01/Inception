build:
	docker compose -f srcs/docker-compose.yml build
up:
	docker compose -f srcs/docker-compose.yml up -d
start:
	docker compose -f srcrs/docker-compose.yml start
down:
	docker compose -f srcs/docker-compose.yml down
stop:
	docker compose -f srcs/docker-compose.yml stop
restart: stop start

fclean:
	docker image rm myweb

re:
	down fclean build up

.PHONY: build up start down stop restart
