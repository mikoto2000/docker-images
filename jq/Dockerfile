FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v1.0.0"
LABEL description "jq: jq-1.5-1-a5b5cbe"

# aarch64 用のバイナリビルドができる環境を構築
RUN apt-get update && apt-get -y install \
        jq=1.5+dfsg-2+b1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

