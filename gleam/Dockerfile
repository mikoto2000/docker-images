FROM debian:bookworm-slim

LABEL maintainer="mikoto2000 <mikoto2000@gmail.com>"
LABEL version="20241007"
LABEL description="gleam: v1.5.1, erlang: "

RUN apt update && apt install -y \
    curl \
    gnupg2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# gleam を /opt/gleam/bin にインストール
ARG GLEAM_VERSION="v1.5.1"
ENV PATH=$PATH:/opt/gleam/bin

RUN curl -LO https://github.com/gleam-lang/gleam/releases/download/${GLEAM_VERSION}/gleam-${GLEAM_VERSION}-x86_64-unknown-linux-musl.tar.gz \
    && mkdir -p /opt/gleam/bin \
    && tar xfv gleam-${GLEAM_VERSION}-x86_64-unknown-linux-musl.tar.gz -C /opt/gleam/bin \
    && rm gleam-${GLEAM_VERSION}-x86_64-unknown-linux-musl.tar.gz

COPY ./erlang.sources /etc/apt/sources.list.d/erlang.sources

RUN curl https://binaries2.erlang-solutions.com/GPG-KEY-pmanager.asc -o /usr/share/keyrings/pmanager.gpg \
    && apt-key add /usr/share/keyrings/pmanager.gpg \
    && apt update \
    && apt install -y esl-erlang


