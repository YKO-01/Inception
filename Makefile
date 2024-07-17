build:
	mkdir -p ~/data/db_data
	mkdir -p ~/data/wp_data
#	chown -R $(whoami):$(whoami) ~/${USER}/data
#	chmod -R 755 ~/${USER}/user/data
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

fclean: down
	docker image rm nginx mariadb wordpress
	docker volume rm srcs_db_data srcs_wp_data
	sudo rm -rf ~/data
re: fclean build up
.PHONY: build up start down stop restart
