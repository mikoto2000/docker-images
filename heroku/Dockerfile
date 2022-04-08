FROM debian:bullseye-slim

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="20220408"
LABEL description "Heroku CLI"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install curl git gnupg2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

CMD ["bash"]

