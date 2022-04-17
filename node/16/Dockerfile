FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="20220417"
LABEL description "Node 16"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl \
        gnupg2 \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
        nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

