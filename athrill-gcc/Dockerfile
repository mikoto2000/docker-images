# ビルド環境を構築してビルド
FROM debian:buster-slim as build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.1.0"
LABEL description "athrill-gcc: v1.1"

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install curl make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/tmori/athrill-gcc/releases/download/v1.1/athrill-gcc-package.tar.gz -O \
    && tar xf athrill-gcc-package.tar.gz \
    && cd athrill-gcc-package \
    && tar xf athrill-gcc.tar.gz -C / \
    && cd / \
    && rm -rf athrill-gcc-package \
    && rm athrill-gcc-package.tar.gz


FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.1.0"
LABEL description "athrill-gcc: v1.1"

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build-env \
    /usr/local/athrill-gcc \
    /usr/local/athrill-gcc

ENV PATH="/usr/local/athrill-gcc/bin/:${PATH}" \
    LD_LIBRARY_PATH="/usr/local/athrill-gcc:/usr/local/athrill-gcc/lib:${LD_LIBRARY_PATH}"

