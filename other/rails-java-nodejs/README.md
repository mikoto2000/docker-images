# Rails Java Node.js

## Build

普通の用途(ベースイメージに Ubuntu 22.04 イメージを利用)

```sh
docker build -t mikoto2000/rails-java-nodejs:latest .
```

VSCode DevContainer 向け(ベースイメージに VSCode + Dev Container 向けの Ubuntu 22.04 イメージを利用)

```sh
docker build --build-arg BASE=mcr.microsoft.com/vscode/devcontainers/base:1.0.9-ubuntu22.04 -t mikoto2000/vscode-rails-java-nodejs:latest .
```

