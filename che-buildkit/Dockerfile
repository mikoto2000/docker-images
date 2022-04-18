FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="20220401"
LABEL description "Eclipse Che buildkit"

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8

RUN apt-get update \
    && apt-get -y install \
        maven \
        curl \
        git \
        gnupg2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install nodejs

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg \
    | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update \
    && apt-get -y install \
        docker-ce \
        docker-ce-cli \
        containerd.io \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

