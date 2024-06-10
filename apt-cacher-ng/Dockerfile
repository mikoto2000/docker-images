FROM debian:bookworm-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version "20240611"
LABEL description "apt-cacher-ng: 3.7.4-1+b2, with HTTPS pass through."

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-cacher-ng \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "PassThroughPattern: ^.*:443$" >> /etc/apt-cacher-ng/acng.conf

CMD chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*

