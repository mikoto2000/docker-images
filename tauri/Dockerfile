FROM node:17

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "Node: 17, Rust: "

ENV PATH=/usr/local/cargo/bin:$PATH

USER root

RUN apt-get update && apt-get -y install \
    libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libappindicator3-0.1-cil-dev \
    librsvg2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER node
WORKDIR /home/node

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-setup.sh \
    && chmod u+x rustup-setup.sh \
    && ./rustup-setup.sh -y \
    && rm -rf rustup-setup.sh

CMD ["bash"]

