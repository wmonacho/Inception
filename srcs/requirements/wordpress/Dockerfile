FROM	debian:buster

RUN	apt-get update -y &&\
	apt-get upgrade -y &&\
	apt-get install -y wget &&\
	apt-get install -y php7.3 && \
	apt-get install -y php-fpm && \
	apt-get install -y php-mysql && \
	apt-get install -y mariadb-client && \
	apt-get install -y curl &&\
	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html &&\
	cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz &&\
	chown -R root:root /var/www/html/wordpress &&\
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/auto-config.sh /usr/local/bin/tools/auto-config.sh

# RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
# RUN chmod +x /usr/local/bin/wp

# RUN useradd non_root_user --create-home --home-dir /home/non_root_user
# USER non_root_user

# WORKDIR /home/non_root_user
ENV PATH="/usr/bin:${PATH}"
CMD ["bash", "/usr/local/bin/tools/auto-config.sh"]



