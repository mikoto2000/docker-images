ARG NODE_VERSION=10
FROM node:$NODE_VERSION
WORKDIR /home/theia
ADD package.json ./package.json
ARG GITHUB_TOKEN

# OpenJDK12 をダウンロード・配置・環境変数設定
RUN mkdir -p /opt/java && \
    curl -L https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz -o /tmp/openjdk-12.0.1_linux-x64_bin.tar.gz && \
    tar xf /tmp/openjdk-12.0.1_linux-x64_bin.tar.gz -C /opt/java/ && \
    rm /tmp/openjdk-12.0.1_linux-x64_bin.tar.gz
ENV JAVA_HOME=/opt/java/jdk-12.0.1
ENV PATH=${JAVA_HOME}/bin:${PATH}

RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    yarn cache clean

# See : https://github.com/theia-ide/theia-apps/issues/34
RUN adduser --disabled-password --gecos '' theia && \
    chmod g+rw /home && \
    mkdir -p /home/project && \
    chown -R theia:theia /home/theia && \
    chown -R theia:theia /home/project;
USER theia

# configure Theia
ENV SHELL=/bin/bash \
    THEIA_DEFAULT_PLUGINS=local-dir:/home/theia/plugins

EXPOSE 3000
ENTRYPOINT [ "node", "/home/theia/src-gen/backend/main.js", "/home/project", "--hostname=0.0.0.0" ]

