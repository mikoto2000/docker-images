FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="2.10.7"
LABEL description "ansible: 2.10.7"

RUN apt-get update && apt-get install -y \
    ansible=2.10.7+merged+base+2.10.8+dfsg-1 \
    openssh-client=1:8.4p1-5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.ssh && chmod 700 /root/.ssh

CMD /bin/bash

