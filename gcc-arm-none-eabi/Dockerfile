# qemu バイナリビルド用環境
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v15:7-2018-q2-6"
LABEL description "gcc-arm-none-eabi: 15:7-2018-q2-6"

RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install \
        gcc-arm-none-eabi=15:7-2018-q2-6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


