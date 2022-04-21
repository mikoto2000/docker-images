FROM debian:buster-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "Rust"

ENV PATH=/usr/local/cargo/bin:$PATH

RUN apt-get update && apt-get -y install \
    build-essential \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-setup.sh \
    && chmod u+x rustup-setup.sh \
    && ./rustup-setup.sh -y \
    && rm -rf rustup-setup.sh

CMD ["bash"]

