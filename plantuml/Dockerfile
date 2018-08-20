FROM debian:stretch-slim AS build-env

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.2018.9"
LABEL description "version: 1.2018.9"

RUN apt-get update && apt-get install -y \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /work && \
    http_proxy="" curl -L -s -o /work/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.1.2018.9.jar/download


FROM debian:stretch-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.2018.9"
LABEL description "version: 1.2018.9"

RUN mkdir -p /usr/share/man/man1 && \
    apt-get update && apt-get install -y \
    graphviz=2.38.0-17 \
    openjdk-8-jre-headless=8u171-b11-1~deb9u1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# jar ファイルをコピー
RUN mkdir -p ~/classpath
COPY --from=build-env /work/plantuml.jar /root/classpath

CMD /bin/bash

