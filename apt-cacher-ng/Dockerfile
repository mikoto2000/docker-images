FROM debian:stretch-slim

RUN apt -y update
RUN apt -y upgrade
RUN apt -y install apt-cacher-ng

CMD chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*

