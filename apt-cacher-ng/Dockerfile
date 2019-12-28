FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version "3.2-2"
LABEL description "apt-cacher-ng: 3.2-2, with HTTPS pass through."

RUN apt -y update
RUN apt -y upgrade
RUN apt -y install apt-cacher-ng=3.2-2
RUN echo "PassThroughPattern: ^.*:443$" >> /etc/apt-cacher-ng/acng.conf

CMD chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*

