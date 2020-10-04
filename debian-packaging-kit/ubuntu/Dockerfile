FROM ubuntu:18.04

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "debian package build kit."

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        dh-make \
        git-buildpackage\
        fakeroot\
        devscripts\
        pbuilder\
        cdbs \
        git \
        cowbuilder \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

