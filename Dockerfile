FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install apache2 -y
EXPOSE 80