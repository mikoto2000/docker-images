FROM debian:stretch-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="2.2.1.0-2"
LABEL description "version: 2.2.1.0-2"

RUN apt-get update && apt-get install -y \
    ansible=2.2.1.0-2 \
    openssh-client=1:7.4p1-10+deb9u3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.ssh && chmod 700 /root/.ssh

CMD /bin/bash

