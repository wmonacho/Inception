FROM	debian:buster

ARG	DB_DATABASE
ARG DB_USER_NAME
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN apt-get install -y dumb-init
RUN	apt-get install -y mariadb-server
RUN	apt-get	clean -y
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN mysql_secure_installation
RUN service mysql start \ ...

COPY ./mariadb.conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE :	3306

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["mysqld", "--bind-address=0.0.0.0" ]
