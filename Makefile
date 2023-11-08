DOCKER = docker
COMPOSE = $(DOCKER) compose -p inception -f srcs/docker-compose.yml
MARIADB_VOLUME = /home/wmonacho/data/mariadb
WORDPRESS_VOLUME = /home/wmonacho/data/wordpress
DEPENDENCIES = $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)

all:
	mkdir -pv $(MARIADB_VOLUME) &&\
	mkdir -pv $(WORDPRESS_VOLUME)&&\
	$(DOCKER) compose -f srcs/docker-compose.yml up -d

ps:
	$(COMPOSE) ps

images:
	$(COMPOSE) images

volumes:
	$(DOCKER) volume ls

networks:
	$(DOCKER) network ls

start: $(DEPENDENCIES)
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart: $(DEPENDENCIES)
	$(COMPOSE) restart

up: $(DEPENDENCIES)
	$(COMPOSE) up --detach --build

clean:
	$(DOCKER) system prune -af
	$(DOCKER) volume rm srcs_mariadb
	$(DOCKER) volume rm srcs_wordpress

fclean: clean
	$(RM) -r /home/wmonacho/data/*

re: fclean all

.PHONY: all ps images volumes networks start stop restart up down clean fclean prune re