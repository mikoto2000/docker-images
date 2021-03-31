FROM debian:buster-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.1.0"
LABEL description "make: 4.2.1-1.2, gcc:4:8.3.0-1"

RUN apt-get update \
    && apt-get -y install make=4.2.1-1.2 gcc=4:8.3.0-1 rsync \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


