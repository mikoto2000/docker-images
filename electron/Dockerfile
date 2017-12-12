FROM ubuntu:17.10

# 必要なパッケージの取得
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y nodejs npm wine32 && apt-get -y clean

RUN npm install -g electron
RUN npm install -g electron-packager


# prebuild バイナリの取得
RUN apt -y install curl && apt-get -y clean
RUN mkdir -p /root/.cache/electron
RUN curl -L -o /root/.cache/electron/electron-v1.7.9-win32-x64.zip https://github.com/electron/electron/releases/download/v1.7.9/electron-v1.7.9-win32-x64.zip
RUN curl -L -o /root/.cache/electron/SHASUMS256.txt-1.7.9 https://github.com/electron/electron/releases/download/v1.7.9/SHASUMS256.txt

