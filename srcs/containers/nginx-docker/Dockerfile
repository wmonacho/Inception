FROM	debian:buster

RUN apt-get install -y
RUN apt-get update -y
RUN apt-get install -y dumb-init
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN openssl req -x509 -newkey rsa:4096 -subj /C=FR -nodes -keyout /etc/ssl/wmonacho.42.fr.key -out /etc/ssl/wmonacho.42.fr.crt

ENV: define env variables
EXPOSE : 443
VOLUME: definition of volumes
COPY: copy elements between host and container
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD ["nginx", "-g", "daemon off;" ]
