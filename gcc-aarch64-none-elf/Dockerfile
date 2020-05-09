# qemu バイナリビルド用環境
FROM debian:buster-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v9.2-2019.12"
LABEL description "gcc-aarch64-none-elf: 9.2-2019.12"

RUN apt-get update \
    && apt-get -y install \
        curl \
        xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-elf.tar.xz?revision=ea238776-c7c7-43be-ba0d-40d7f594af1f&la=en&hash=2937ED76D3E6B85BA511BCBD46AE121DBA5268F3" \
    -o ./gcc-arm-9.2-2019.12-x86_64-aarch64-none-elf.tar.xz

RUN tar xf ./gcc-arm-9.2-2019.12-x86_64-aarch64-none-elf.tar.xz -C /opt


# 実行環境を構築してビルド環境からバイナリをコピー
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v9.2-2019.12"
LABEL description "gcc-aarch64-none-elf: 9.2-2019.12"

ENV PATH ${PATH}:/opt/gcc-arm-9.2-2019.12-x86_64-aarch64-none-elf/bin

RUN apt-get update \
    && apt-get -y install make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build-env \
    /opt \
    /opt


