FROM debian:stretch-slim
MAINTAINER mikoto2000 <mikoto2000@gmail.com>

# ベースシステムのアップデート
RUN apt-get -y update && apt-get -y clean
RUN apt-get -y upgrade && apt-get -y clean

# Linaro のインストール
ENV LINARO="gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu"
ENV LINARO_FILE="${LINARO}.tar.xz"
ENV LINARO_DOWNLOAD_URL="https://releases.linaro.org/components/toolchain/binaries/latest/aarch64-linux-gnu/"${LINARO_FILE}

RUN apt-get -y install wget tar xz-utils make && apt-get -y clean
WORKDIR /var/app
RUN wget ${LINARO_DOWNLOAD_URL}
RUN tar xfv gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu.tar.xz

ENV PATH ${PATH}:/var/app/${LINARO}/bin

# QEMU のインストール
RUN apt-get -y install git python pkg-config zlib1g-dev libglib2.0-dev libpixman-1-dev libfdt-dev && apt-get -y clean
WORKDIR /var/app
RUN git clone http://github.com/qemu/qemu
WORKDIR /var/app/qemu
RUN apt-get -y install build-essential
RUN ./configure --target-list=aarch64-softmmu
RUN make

ENV PATH ${PATH}:/var/app/qemu/aarch64-softmmu
