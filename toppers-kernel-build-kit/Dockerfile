# コンテナとして使う環境を作る
FROM mcr.microsoft.com/devcontainers/base:debian AS base

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "toppers-kernel-build-kit-base. ruby: 1:2.5.1"

RUN apt-get update && apt-get -y install --no-install-recommends \
    ruby make curl xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ビルド環境を構築してビルド
FROM base as athrill-gcc-build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "athrill-gcc: v1.0"

# athrill-gcc
RUN curl -L https://github.com/tmori/athrill-gcc/releases/download/v1.0/athrill-gcc-package.tar.gz -O \
    && tar xf athrill-gcc-package.tar.gz \
    && cd athrill-gcc-package \
    && tar xf athrill-gcc.tar.gz -C / \
    && cd / \
    && rm -rf athrill-gcc-package \
    && rm athrill-gcc-package.tar.gz

# cfg
RUN curl -L -O https://github.com/mitsut/cfg/releases/download/1.9.7/cfg-1.9.7-x86_64-unknown-linux-gnu.tar.gz \
    && tar xf cfg-1.9.7-x86_64-unknown-linux-gnu.tar.gz \
    && mv cfg /usr/local/bin/cfg \
    && rm cfg-1.9.7-x86_64-unknown-linux-gnu.tar.gz


FROM mikoto2000/toppers-kernel-build-kit:base-latest AS athrill-gcc

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "athrill-gcc: v1.0"

RUN apt-get update \
    && apt-get -y install perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=athrill-gcc-build-env \
    /usr/local/athrill-gcc \
    /usr/local/athrill-gcc

COPY --from=athrill-gcc-build-env \
    /usr/local/bin/cfg \
    /usr/local/bin/cfg

ENV PATH="/usr/local/athrill-gcc/bin/:${PATH}" \
    LD_LIBRARY_PATH="/usr/local/athrill-gcc:/usr/local/athrill-gcc/lib:${LD_LIBRARY_PATH}"

# コンテナとして使う環境を作る
FROM mikoto2000/toppers-kernel-build-kit:base-latest AS gcc-aarch64-linux-gnu

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "toppers-kernel-build-kit. gcc-aarch64-linux-gnu: 4:8.3.0-1"

# aarch64 用のバイナリビルドができる環境を構築
RUN apt-get update && apt-get -y install \
    gcc-aarch64-linux-gnu=4:8.3.0-1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ビルド環境を構築してビルド
FROM base as gcc-arm-none-eabi-build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "toppers-kernel-build-kit. gcc-arm-none-eabi: 15:7-2018-q2-6"

# cfg
RUN curl -L -O https://github.com/mitsut/cfg/releases/download/1.9.7/cfg-1.9.7-x86_64-unknown-linux-gnu.tar.gz \
    && tar xf cfg-1.9.7-x86_64-unknown-linux-gnu.tar.gz \
    && mv cfg /usr/local/bin/cfg \
    && rm cfg-1.9.7-x86_64-unknown-linux-gnu.tar.gz

# コンテナとして使う環境を作る
FROM base AS gcc-arm-none-eabi

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "toppers-kernel-build-kit. gcc-arm-none-eabi: 15:7-2018-q2-6"

RUN apt-get update && apt-get -y install \
    gcc-arm-none-eabi \
    perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=gcc-arm-none-eabi-build-env \
    /usr/local/bin/cfg \
    /usr/local/bin/cfg
# zig 0.8.0 を /opt/zig-linux-x86_64-0.8.0 にインストール
RUN curl -L "https://ziglang.org/download/0.8.0/zig-linux-$(uname -m)-0.8.0.tar.xz" -O \
    && tar xf "zig-linux-$(uname -m)-0.8.0.tar.xz" -C /opt \
    && mv "/opt/zig-linux-$(uname -m)-0.8.0" /opt/zig \
    && rm "zig-linux-$(uname -m)-0.8.0.tar.xz"

# tecsgen 1.8.0 のインストール
RUN curl -L https://www.toppers.jp/download.cgi/tecsgen-1.8.0.tgz -O \
    && tar xf tecsgen-1.8.0.tgz -C /opt \
    && rm tecsgen-1.8.0.tgz


# コンテナとして使う環境を作る
FROM mikoto2000/toppers-kernel-build-kit:gcc-arm-none-eabi-latest AS zig-with-gcc-arm-none-eabi

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "toppers-kernel-build-kit. zig: 0.8.0, gcc-arm-none-eabi"

COPY --chown=root:root --from=gcc-arm-none-eabi \
    "/opt/zig" "/opt/zig"

COPY --chown=root:root --from=gcc-arm-none-eabi \
    /opt/tecsgen-1.8.0 /opt/tecsgen-1.8.0

RUN chmod 755 /opt/tecsgen-1.8.0/tecsgen \
    && find /opt/tecsgen-1.8.0/tecsgen -type d -print0 | xargs -0 chmod 755 \
    && find /opt/tecsgen-1.8.0/tecsgen -type f -name '*.rb' -print0 | xargs -0 chmod 755

ENV PATH=$PATH:"/opt/zig"

