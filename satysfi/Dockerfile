FROM debian:bullseye-slim AS build

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "SATySFi"

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH $PATH:/opt/opam/bin

RUN apt update \
    && apt install -y \
        bubblewrap \
        bzip2 \
        gcc \
        git \
        m4 \
        make \
        rsync \
        unzip \
        curl \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/opam/bin \
    && curl -L "https://github.com/ocaml/opam/releases/download/2.1.0/opam-2.1.0-$([ $(uname -m) = aarch64 ] && echo arm64 || uname -m)-linux" -o /opt/opam/bin/opam \
    && chmod +x /opt/opam/bin/opam

RUN git clone https://github.com/gfngfn/SATySFi.git \
    && cd SATySFi \
    && bash ./download-fonts.sh \
    && bash ./install-libs.sh

RUN useradd -m -s /bin/bash satysfi

USER satysfi
ENV PATH $PATH:/opt/opam/bin

RUN opam init --no-setup --disable-sandboxing --comp 4.10.0 \
    && opam repository add satysfi-external https://github.com/gfngfn/satysfi-external-repo.git \
    && opam update

RUN cd /SATySFi \
    && opam pin add -y satysfi . \
    && opam install -y satysfi


FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "SATySFi"

RUN apt-get update \
    && apt-get install -y make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash satysfi

USER satysfi

ENV PATH $PATH:/opt/opam/bin
ENV PATH $PATH:/home/satysfi/.opam/4.10.0/bin
ENV OPAM_SWITCH_PREFIX /home/satysfi/.opam/4.10.0
ENV CAML_LD_LIBRARY_PATH /home/satysfi/.opam/4.10.0/lib/stublibs:/home/satysfi/.opam/4.10.0/lib/ocaml/stublibs:/home/satysfi/.opam/4.10.0/lib/ocaml
ENV OCAML_TOPLEVEL_PATH /home/satysfi/.opam/4.10.0/lib/toplevel
ENV MANPATH ':/home/satysfi/.opam/4.10.0/man'

COPY --from=build \
    /home/satysfi \
    /home/satysfi

COPY --from=build \
    /usr/local/share/satysfi \
    /usr/local/share/satysfi

COPY --from=build \
    /opt \
    /opt

CMD ["/bin/bash"]

