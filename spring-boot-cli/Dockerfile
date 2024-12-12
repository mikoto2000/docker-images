FROM mcr.microsoft.com/devcontainers/java:21

LABEL maintainer="mikoto2000 <mikoto2000@gmail.com>"
LABEL version="20241212"
LABEL description="spring-boot-cli: 3.4.0"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/3.4.0/spring-boot-cli-3.4.0-bin.tar.gz \
    && tar zxfv spring-boot-cli-3.4.0-bin.tar.gz -C /opt \
    && rm spring-boot-cli-3.4.0-bin.tar.gz

ENV PATH=$PATH:/opt/spring-3.4.0/bin
