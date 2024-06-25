FROM mcr.microsoft.com/devcontainers/rust:1-1-bullseye

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.79.0"
LABEL description "Rust"

# なぜか無効な rust-analyzer がインストールされる問題の対応
RUN rustup component add rust-analyzer
ENV PATH ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$PATH

CMD ["bash"]

