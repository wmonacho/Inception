FROM debian:buster

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install -y mariadb-server
# RUN mkdir -p /var/lib/mysqld
# RUN chown -R mysql:mysql /var/lib/mysqld

ARG SQL_DATABASE
ARG SQL_PASSWORD
ARG SQL_USER

# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start
RUN mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
RUN mysql -e "CREATE USER IF NOT EXISTS $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD';"
RUN mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%';"
RUN mysql -e "FLUSH PRIVILEGES;"

CMD ["mysqld", "--bind-address=0.0.0.0"]