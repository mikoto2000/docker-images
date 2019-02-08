# ビルド環境を構築してビルド
FROM debian:buster-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v14.01"
LABEL description "Runesas V850 Toolchain v14.01(fromhttps://gcc-renesas.com/ja/v850/v850-download-toolchains/)"

RUN apt-get update \
    && apt-get -y install \
        build-essential \
        libgmp-dev \
        libmpfr-dev \
        libmpc-dev \
        texinfo \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ツールチェインのソース取得
WORKDIR /
RUN wget https://gcc-renesas.com/downloads/d.php?f=v850/binutils/14.01/binutils-2.24_v850_v14.01.tar.bz2 -O binutils-2.24_v850_v14.01.tar.bz2
RUN tar xf binutils-2.24_v850_v14.01.tar.bz2
RUN wget https://gcc-renesas.com/downloads/d.php?f=v850/gcc/14.01/gcc-4.9.2_v850_v14.01.tar.bz2 -O gcc-4.9.2_v850_v14.01.tar.bz2
RUN tar xf gcc-4.9.2_v850_v14.01.tar.bz2
RUN wget https://gcc-renesas.com/downloads/d.php?f=v850/newlib/14.01/newlib-2.1.0_v850_v14.01.tar.bz2 -O newlib-2.1.0_v850_v14.01.tar.bz2
RUN tar xf newlib-2.1.0_v850_v14.01.tar.bz2

# binutils のビルド
RUN mkdir -p /build/binutils
WORKDIR /build/binutils
RUN ../../binutils-2.24/configure --target=v850-elf --prefix=/usr/local --enable-soft-float
RUN make CFLAGS="-Wno-cast-function-type -Wno-implicit-fallthrough -Wno-shift-negative-value -Wno-unused-value -Wno-pointer-compare"
RUN make install


# gcc のビルド
RUN mkdir -p /build/gcc
WORKDIR /build/gcc
RUN ../../gcc-4.9.2/configure --target=v850-elf --prefix=/usr/local --enable-languages=c,c++ --disable-nls --disable-multilib --disable-libssp --with-newlib --with-header=/newlib/newlib/libc/include
RUN make CXXFLAGS="-std=c++03"; exit 0
RUN make install; exit 0


# newlib のビルド
RUN mkdir -p /build/newlib
WORKDIR /build/newlib
RUN ../../newlib-2.1.0/configure --target=v850-elf --prefix=/usr/local
RUN make
RUN make install


# 実行環境を構築してビルド環境からバイナリをコピー
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v14.01"
LABEL description "Runesas V850 Toolchain v14.01(fromhttps://gcc-renesas.com/ja/v850/v850-download-toolchains/)"

# build-env から必要なファイルをコピー
COPY --from=build-env \
    /usr/local \
    /usr/local
COPY --from=build-env \
    /usr/lib/x86_64-linux-gnu/libmpc.so.3 \
    /usr/lib/x86_64-linux-gnu/libmpc.so.3
COPY --from=build-env \
    /usr/lib/x86_64-linux-gnu/libmpfr.so.6 \
    /usr/lib/x86_64-linux-gnu/libmpfr.so.6

# make くらい必要でしょ？
RUN apt-get update \
    && apt-get -y install \
        make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

