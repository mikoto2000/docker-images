FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="20220417"
LABEL description "OpenJDK 17"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
        openjdk-17-jdk-headless \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

