FROM amazon/aws-cli:2.1.34

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "eksctl: 0.43.0, aws-cli: 2.1.34, kubectl: 1.20.0, helm: 3.5.3"

RUN yum install -y tar gzip \
    && rm -rf /var/cache/yum/* \
    && yum clean all

# eksctl
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/0.43.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp \
    && mv /tmp/eksctl /usr/local/bin \
    && chmod +x /usr/local/bin/eksctl

# kubectl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# helm
RUN curl -LO https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz \
    && tar xf helm-v3.5.3-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm -rf helm-v3.5.3-linux-amd64.tar.gz

# kops
RUN curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 \
    && chmod +x kops-linux-amd64 \
    && mv kops-linux-amd64 /usr/local/bin/kops

# misc
RUN yum install -y openssh-clients bind-utils git jq \
    && rm -rf /var/cache/yum/* \
    && yum clean all

ENTRYPOINT bash

