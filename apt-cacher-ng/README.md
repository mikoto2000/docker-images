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
docker-compose up -d
```

### docker build の際に apt-cacher-ng のキャッシュを使う

```sh
docker build --build-arg http_proxy=http://host.docker.internal:3142/ [options] .
```

