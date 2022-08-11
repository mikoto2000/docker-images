FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="20220811"
LABEL description "clang: 11.0.1-2"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install clang \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

