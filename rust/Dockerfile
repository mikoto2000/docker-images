FROM debian:bookworm-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.79.0"
LABEL description "Rust"

ENV RUSTUP_HOME /opt/rust
ENV CARGO_HOME /opt/rust
ENV PATH=/opt/rust/bin:$PATH

RUN apt-get update && apt-get -y install \
    build-essential \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-setup.sh \
    && chmod u+x rustup-setup.sh \
    && ./rustup-setup.sh -y \
    && rm -rf rustup-setup.sh

# なぜか無効な rust-analyzer がインストールされる問題の対応
RUN rustup component add rust-analyzer
ENV PATH ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$PATH

CMD ["bash"]

