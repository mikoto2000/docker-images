# コンテナとして使う環境を作る
FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "gdb-multiarch"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install --no-install-recommends \
    gdb-multiarch \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

