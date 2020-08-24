# コンテナとして使う環境を作る
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "qemu-system-arm: 1:3.1+dfsg-8+deb10u7"

RUN apt-get update && apt-get -y install \
    qemu-system-arm=1:3.1+dfsg-8+deb10u7 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

