FROM	debian:buster

RUN apt-get update -y
RUN	apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client
RUN	apt-get install -y curl
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
# RUN chmod +x /usr/local/bin/wp

# RUN useradd non_root_user --create-home --home-dir /home/non_root_user
# USER non_root_user

# WORKDIR /home/non_root_user
ENTRYPOINT ["bash", "./auto-config.sh"]



