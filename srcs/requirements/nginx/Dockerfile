FROM	debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y dumb-init
RUN apt-get install -y nginx
RUN apt install vim -y    
RUN apt install curl -y  
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl
RUN openssl req -x509 -newkey rsa:4096 -subj /C=FR -nodes -keyout /etc/ssl/wmonacho.42.fr.key -out /etc/ssl/wmonacho.42.fr.crt
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chmod 755 /etc/nginx/
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "nginx", "-g", "daemon off;" ]
