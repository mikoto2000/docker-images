# qemu バイナリビルド用環境
FROM debian:stretch-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v3.0.0"
LABEL description "qemu-system-aarh64: 3.0.0"

RUN apt-get update && apt-get -y install \
    git \
    gcc-aarch64-linux-gnu \
    build-essential \
    python \
    pkg-config \
    zlib1g-dev \
    libglib2.0-dev \
    libpixman-1-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
RUN git clone git://git.qemu.org/qemu.git \
    && cd qemu \
    && git checkout -b v3.0.0-release refs/tags/v3.0.0 \
    && git submodule update --init \
    && ./configure --target-list=arm-softmmu,aarch64-softmmu \
    && make \
    && make install

# コンテナとして使う環境を作る
FROM debian:stretch-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v3.0.0"
LABEL description "qemu-system-aarh64: 3.0.0, gcc-aarch64-linux-gnu: 4:6.3.0-4"

# aarch64 用のバイナリビルドができる環境を構築
RUN apt-get update && apt-get -y install \
    gcc-aarch64-linux-gnu=4:6.3.0-4 \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# build-env から必要なファイルをコピー
# `/usr/local/bin/qemu-system-aarch64` と、
# `ldd /usr/local/bin/qemu-system-aarch64` で表示される
# ライブラリ群をコピーする
COPY --from=build-env \
    /usr/local/bin/qemu-system-aarch64 \
    /usr/local/bin/qemu-system-aarch64

COPY --from=build-env \
    /usr/lib/x86_64-linux-gnu/libpixman-1.so.0 \
    /usr/lib/x86_64-linux-gnu/libgthread-2.0.so.0 \
    /usr/lib/x86_64-linux-gnu/

COPY --from=build-env \
    /lib/x86_64-linux-gnu/libglib-2.0.so.0 \
    /lib/x86_64-linux-gnu/

COPY --from=build-env \
    /usr/local/share/qemu \
    /usr/local/share/qemu


