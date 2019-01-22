FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="2.02-4+b2"
LABEL description "version: 2.02-4+b2"

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y \
    pandoc=2.2.1-3+b2 \
    pandoc-data=2.2.1-3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD /bin/bash

