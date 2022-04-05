ansible
=======

Usage:
------

1. `.env.sample` を `.env` にコピーし、`SSH_DIR`, `WORK_DIR` を設定
    - `SSH_DIR`: SSH 秘密鍵と `known_hosts` が格納されたディレクトリ(`.ssh` 相当のディレクトリ)
    - `WORK_DIR`: playbook など、 ansible 実行に必要なファイル群を格納したディレクトリ
2. コンテナを起動

```sh
docker-compose run --rm ansible
```

build:
------

```sh
docker build -t mikoto2000/ansible .
```

