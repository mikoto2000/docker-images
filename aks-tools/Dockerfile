FROM mcr.microsoft.com/azure-cli:2.38.0

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "azure-cli: 2.38.0, kubectl: 1.24.3, helm: 3.9.1, chectl: latest-stable"

# kubectl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.24.3/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN curl -LO https://get.helm.sh/helm-v3.9.1-linux-amd64.tar.gz \
    && tar xf helm-v3.9.1-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm -rf helm-v3.9.1-linux-amd64.tar.gz

# azure-cli extension
RUN az extension add --name aks-preview \
    && az extension add --name azure-firewall

# chectl
RUN apk add nodejs \
    && curl -sL  https://www.eclipse.org/che/chectl/ | bash -

# misc
RUN apk add bind-tools
