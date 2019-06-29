FROM codercom/code-server

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "openjdk12+vscode-java"

# ベースのアップグレード
RUN sudo apt-get update && sudo apt-get -y upgrade \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# OpenJDK12 をダウンロード・配置・環境変数設定
RUN sudo mkdir -p /opt/java
RUN sudo curl -L https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz -o /tmp/openjdk-12.0.1_linux-x64_bin.tar.gz
RUN sudo tar xf /tmp/openjdk-12.0.1_linux-x64_bin.tar.gz -C /opt/java/
RUN sudo rm /tmp/openjdk-12.0.1_linux-x64_bin.tar.gz
ENV JAVA_HOME=/opt/java/jdk-12.0.1
ENV PATH=${JAVA_HOME}/bin:${PATH}

# redhat-developer/vscode-java をダウンロードしてインストール
RUN sudo curl -L https://github.com/redhat-developer/vscode-java/releases/download/v0.46.0/redhat.java-0.46.0.vsix -o /tmp/redhat.java-0.46.0.vsix
RUN code-server --install-extension /tmp/redhat.java-0.46.0.vsix
RUN sudo rm /tmp/redhat.java-0.46.0.vsix

