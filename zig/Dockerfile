# イメージビルド環境
FROM debian:buster-slim AS build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "zig: 0.6.0+4e63cae36"

RUN apt-get update && apt-get -y install \
    curl xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# zig 0.6.0+4e63cae36 を /opt/zig-linux-x86_64-0.6.0+4e63cae36 にインストール
RUN curl -L https://ziglang.org/builds/zig-linux-x86_64-0.6.0+4e63cae36.tar.xz -O \
    && tar xf zig-linux-x86_64-0.6.0+4e63cae36.tar.xz -C /opt \
    && rm zig-linux-x86_64-0.6.0+4e63cae36.tar.xz


# コンテナとして使う環境を作る
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "zig: 0.6.0+4e63cae36"

COPY --chown=root:root --from=build-env \
    /opt/zig-linux-x86_64-0.6.0+4e63cae36 /opt/zig-linux-x86_64-0.6.0+4e63cae36

ENV PATH=$PATH:/opt/zig-linux-x86_64-0.6.0+4e63cae36

