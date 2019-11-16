FROM mcr.microsoft.com/azure-cli:2.0.74

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "azure-cli: 2.0.74, kubectl: 1.16.3, helm: 2.16.1"

# kubectl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.16.3/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN curl -LO https://get.helm.sh/helm-v2.16.1-linux-amd64.tar.gz \
    && tar xf helm-v2.16.1-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && mv linux-amd64/tiller /usr/local/bin/tiller \
    && rm -rf linux-amd64 \
    && rm -rf helm-v2.16.1-linux-amd64.tar.gz

