# ビルド環境を構築してビルド
FROM debian:buster-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "cfg: v1.9.7.2"

RUN apt-get update && apt-get -y install \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -O https://github.com/mikoto2000/cfg-1/releases/download/1.9.7.2/cfg.tar.gz \
    && tar xf cfg.tar.gz \
    && mv cfg /usr/local/bin/cfg


# 実行環境を構築してビルド環境からバイナリをコピー
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "cfg: v1.9.7.2"

# build-env から必要なファイルをコピー
COPY --from=build-env \
    /usr/local/bin/cfg \
    /usr/local/bin/cfg

