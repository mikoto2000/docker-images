FROM debian:stretch-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.1.0f-3+deb9u1"
LABEL description "version: 1.1.0f-3+deb9u1"

RUN apt-get -y update && apt-get -y clean
RUN apt-get -y upgrade && apt-get -y clean
RUN apt-get -y install openssl=1.1.0f-3+deb9u1 && apt-get -y clean

