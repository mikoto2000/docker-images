FROM debian:buster-slim
LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y openssh-server sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --chown=0:0 ./entrypoint.sh /entrypoint.sh
COPY --chown=0:0 ./sshd_config /etc/ssh/sshd_config
ENTRYPOINT [ "/entrypoint.sh" ]

RUN mkdir -p /run/sshd

