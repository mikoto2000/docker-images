FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="20220417"
LABEL description "OpenJDK 17"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# oci
RUN curl -LO https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh \
    && bash install.sh --accept-all-defaults

# kubectl
RUN apt-get update \
    && apt-get install -y apt-transport-https gnupg2 \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# helm
RUN curl -LO https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz \
    && tar xf helm-v3.8.2-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm -rf helm-v3.8.2-linux-amd64.tar.gz

CMD /bin/bash

