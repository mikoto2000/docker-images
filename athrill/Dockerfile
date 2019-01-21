# ビルド環境を構築してビルド
FROM debian:buster-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="d7db0e00cc67932a8385c56bebbfcf07a9f87b75"
LABEL description "athrill: d7db0e00cc67932a8385c56bebbfcf07a9f87b75"

RUN apt-get update && apt-get -y install \
    make \
    gcc \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/tmori/athrill.git /athrill \
    && cd /athrill \
    && git checkout d7db0e00cc67932a8385c56bebbfcf07a9f87b75 \
    && cd /athrill/trunk/src/build/target/linux_v850e2m/ \
    && make \
    && cd /athrill/trunk/src/build/target/linux_v850esfk3/ \
    && make \
    && cd /athrill/trunk/src/remote/remote_cui_client/ \
    && make -f Makefile.linux

# 実行環境を構築してビルド環境からバイナリをコピー
FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="d7db0e00cc67932a8385c56bebbfcf07a9f87b75"
LABEL description "athrill: d7db0e00cc67932a8385c56bebbfcf07a9f87b75"

# build-env から必要なファイルをコピー
COPY --from=build-env \
    /athrill/bin/linux/athrill \
    /usr/local/bin
COPY --from=build-env \
    /athrill/bin/linux/athrill2 \
    /usr/local/bin
COPY --from=build-env \
    /athrill/bin/linux/athrill_remote \
    /usr/local/bin

