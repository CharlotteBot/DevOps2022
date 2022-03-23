# Webserver
FROM ubuntu:18.04
RUN apt-get update && apt-get install apache2 -y
COPY /website/index.html /var/www/html/
EXPOSE 80/tcp
ENTRYPOINT [ "apache2ctl", "-D", "FOREGROUND" ]