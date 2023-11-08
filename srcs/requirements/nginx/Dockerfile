FROM	debian:buster

RUN apt-get update -y &&\
	apt-get upgrade -y &&\
	apt-get install -y dumb-init &&\
	apt-get install -y nginx &&\
	apt install vim -y &&\
	apt install curl -y &&\ 
	mkdir -p /etc/nginx/ssl &&\
	apt-get install -y openssl &&\
	openssl req -x509 -newkey rsa:4096 -subj /C=FR -nodes -keyout /etc/ssl/wmonacho.42.fr.key -out /etc/ssl/wmonacho.42.fr.crt &&\
	mkdir -p /var/run/nginx 
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html  &&\
	chmod 755 /etc/nginx/  &&\
	chown -R www-data:www-data /var/www/html

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "nginx", "-g", "daemon off;" ]
