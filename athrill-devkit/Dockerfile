FROM ubuntu:20.04

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.1.0"
LABEL description "cmake:3.16.3-1ubuntu1.20.04.1, make:4.2.1-1.2, gcc:4:9.3.0-1ubuntu2, g++:4:9.3.0-1ubuntu2, rsync:3.1.3-8ubuntu0.4, libspdlog-dev=1:1.5.0-1"

RUN apt-get update \
    && apt-get -y install cmake=3.16.3-1ubuntu1.20.04.1 make=4.2.1-1.2 gcc=4:9.3.0-1ubuntu2 g++=4:9.3.0-1ubuntu2 rsync=3.1.3-8ubuntu0.4 libspdlog-dev=1:1.5.0-1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

