FROM ubuntu:22.04
LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ARG RUBY_VERSION 3.0.0

# 複数の RUN で構築するのはアンチパターンだが、以下理由から複数 RUN での構築をしている
# - 開発環境であること
# - それぞれがなんのために実行されているコマンドなのかがわかりやすいように

# common
RUN apt-get update \
    && apt-get install -y \
        curl \
        tzdata \
        git \
        language-pack-ja \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Ruby on Rails
RUN apt-get update \
    && apt-get install -y \
        ruby-full \
        build-essential \
        libmysqld-dev \
    && gem install bundler rails \
    && rm -rf /var/lib/gems/${RUBY_VERSION}/cache/* \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Node.js (and Rails with Bootstrap)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn

# Java
RUN curl -fsSL https://apt.corretto.aws/corretto.key \
      | gpg --dearmor -o /etc/apt/keyrings/corretto.key \
    && echo 'deb [signed-by=/etc/apt/keyrings/corretto.key] https://apt.corretto.aws stable main' > /etc/apt/sources.list.d/corretto.list \
    && apt-get update \
    && apt-get install -y java-17-amazon-corretto-jdk

# コンテナ環境の日本語化
ENV LANG ja_JP.UTF-8

# JAVA_HOME を Amazon Corret 17 へ設定
ENV JAVA_HOME /usr/lib/jvm/java-17-amazon-corretto

