FROM mcr.microsoft.com/azure-cli:2.9.1

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "azure-cli: 2.9.1, kubectl: 1.20.0, helm: 2.16.1"

# kubectl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN curl -LO https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz \
    && tar xf helm-v3.5.3-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm -rf helm-v3.5.3-linux-amd64.tar.gz

