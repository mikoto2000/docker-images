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

### Build

#### Docker Desktop

```sh
docker build --build-arg http_proxy=http://host.docker.internal:3142/ -t mikoto2000/apt-cacher-ng .
```

#### Linux

```sh
docker build --add-host=host.docker.internal:host-gateway --build-arg http_proxy=http://host.docker.internal:3142/ -t mikoto2000/apt-cacher-ng .
```
