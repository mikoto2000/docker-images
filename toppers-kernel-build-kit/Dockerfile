# コンテナとして使う環境を作る
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "toppers-kernel-build-kit-base. ruby: 1:2.5.1"

# aarch64 用のバイナリビルドができる環境を構築
RUN apt-get update && apt-get -y install --no-install-recommends \
    ruby=1:2.5.1 \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

