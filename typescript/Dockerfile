FROM ubuntu:17.10

# 必要なパッケージの取得
RUN dpkg --add-architecture i386
RUN apt update
RUN apt upgrade

RUN apt install -y nodejs npm wine32

RUN npm install -g typescript


