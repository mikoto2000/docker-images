FROM node:22

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="2.0.0"
LABEL description "Node: 22, Rust: "

ENV PATH=/usr/local/cargo/bin:$PATH

USER root

RUN apt-get update && apt-get -y install \
    libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-0.1-cil-dev \
    librsvg2-dev \
    sudo \
    fonts-noto-cjk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# node ユーザーが sudo を使えるようにする
RUN usermod -aG sudo node \
    && echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER node
WORKDIR /home/node

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-setup.sh \
    && chmod u+x rustup-setup.sh \
    && ./rustup-setup.sh -y \
    && rm -rf rustup-setup.sh

# なぜか無効な rust-analyzer, rls がインストールされる問題の対応
RUN rm /home/node/.cargo/bin/rust-analyzer \
    /home/node/.cargo/bin/rls

CMD ["bash"]

