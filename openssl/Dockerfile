FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.1.1d-0+deb10u3"
LABEL description "version: 1.1.1d-0+deb10u3"

RUN apt-get -y update \
    && apt-get -y install openssl=1.1.1d-0+deb10u3 \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

