# イメージビルド環境
FROM debian:bookworm-slim AS build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="0.11.0+1"
LABEL description "zig: 0.11.0"

RUN apt-get update && apt-get -y install \
    curl xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# zig 0.11.0 を /opt/zig-linux-x86_64-0.11.0 にインストール
RUN curl -L https://ziglang.org/download/0.11.0/zig-linux-x86_64-0.11.0.tar.xz -O \
    && tar xf zig-linux-x86_64-0.11.0.tar.xz -C /opt \
    && rm zig-linux-x86_64-0.11.0.tar.xz


# コンテナとして使う環境を作る
FROM debian:bookworm-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="0.11.0+1"
LABEL description "zig: 0.11.0"

COPY --chown=root:root --from=build-env \
    /opt/zig-linux-x86_64-0.11.0 /opt/zig-linux-x86_64-0.11.0

ENV PATH=$PATH:/opt/zig-linux-x86_64-0.11.0

RUN apt-get update && apt-get -y install \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

