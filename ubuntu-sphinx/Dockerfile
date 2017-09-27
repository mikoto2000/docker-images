FROM ubuntu:zesty

# ベースのアップグレード
RUN apt-get -y update
RUN apt-get -y upgrade && apt-get -y clean

# sphinx 環境構築
RUN apt-get -y install make && apt-get -y clean
RUN apt-get -y install sphinx-common && apt-get -y clean

# nodejs 環境構築
RUN apt-get -y install curl && apt-get -y clean
RUN apt-get -y install gnupg1 gnupg2 && apt-get -y clean
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get -y install -y nodejs && apt-get -y clean

# textlint 環境構築
RUN npm install -g textlint
RUN npm install -g prh
RUN npm install -g textlint-rule-prh

RUN apt-get -y install -y python-pip && apt-get -y clean
RUN pip install docutils-ast-writer
RUN npm install -g textlint-plugin-rst

# textlint 結果可視化するための環境構築
RUN apt-get -y install lcov && apt-get -y clean
RUN npm install -g textlint-formatter-lcov

# PDF 出力のため
RUN apt-get -y install texlive-full

# PDF にフォントを埋め込むようにする
RUN kanji-config-updmap-sys auto

# 日本語パス対応
RUN apt-get -y install locales locales-all && apt-get -y clean
ENV LANG=ja_JP.UTF-8

