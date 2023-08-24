FROM debian:buster

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN apt-get install -y dumb-init
RUN	apt-get install -y mariadb-server
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

#RUN useradd non_root_user --create-home --home-dir /home/non_root_user
#RUN chown 777 /var/lib/mysql
#USER non_root_user
#WORKDIR /home/non_root_user


ENTRYPOINT [ "/usr/bin/dumb-init", "--"]

CMD [ "bash", "tools/init.sh" ]

CMD ["mysqld"]