apt-cacher-ng
=============

Usage:
------

docker-compose で起動して、 docker build やその他ホストから接続してもらうかたち。

### apt-cacher-ng 用の volume の作成

```sh
docker volume create apt-cacher-ng
```

### apt-cacher-ng の起動

```sh
docker-compose up -d apt-cacher-ng
```

### docker build の際に apt-cacher-ng のキャッシュを使う

debian の場合

```sh
docker build --build-arg http_proxy=`http://ホストマシンの IP アドレス[※1]:3142/` [options] .
```

※1 : Docker for Windows の場合は、コマンドプロンプトで `ipconfig` した結果の、 `DockerNAT` の IPv4 アドレスを入れる

