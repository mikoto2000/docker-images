FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v12.6"
LABEL description "build-essential: 12.6"

RUN apt-get update \
    && apt-get -y install \
        build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


