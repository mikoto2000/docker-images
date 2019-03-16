# qemu バイナリビルド用環境
FROM debian:buster-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v8.2-2019.01"
LABEL description "gcc-aarch64-elf: 8.2-2019.01"

RUN apt-get update \
    && apt-get -y install \
        wget \
        xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget "https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2019.01/gcc-arm-8.2-2019.01-x86_64-aarch64-elf.tar.xz?revision=77a182d4-3caf-4e45-af1e-18e5d6497232&la=en" -O gcc-arm-8.2-2019.01-x86_64-aarch64-elf.tar.xz

RUN tar xf ./gcc-arm-8.2-2019.01-x86_64-aarch64-elf.tar.xz -C /opt


# 実行環境を構築してビルド環境からバイナリをコピー
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v8.2-2019.01"
LABEL description "gcc-aarch64-elf: 8.2-2019.01"

ENV PATH ${PATH}:/opt/gcc-arm-8.2-2019.01-x86_64-aarch64-elf/bin

COPY --from=build-env \
    /opt \
    /opt

