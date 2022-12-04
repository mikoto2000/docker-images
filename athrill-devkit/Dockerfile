FROM debian:bullseye-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.1.0"
LABEL description "make:4.3-4.1, gcc:4:10.2.1-1, g++:4:10.2.1-1, rsync:3.2.3-4+deb11u1"

RUN apt-get update \
    && apt-get -y install make=4.3-4.1 gcc=4:10.2.1-1 g++=4:10.2.1-1 rsync=3.2.3-4+deb11u1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

