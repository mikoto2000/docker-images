sphinx image ビルド方法
-----------------------

1. apt-cacher-ng を立ち上げて、 IP アドレスを確認

```ps1
docker-compose up -d apt-cacher-ng
docker ps
docker inspect CONTAINER_ID --format="{{.NetworkSettings.Networks.sphinx_default.IPAddress}}"
```

2. `docker build` で、ネットワークとホスト名、IP アドレスを指定

```ps1
docker build -t sphinx --network sphinx_default --add-host="apt-cacher-ng:IP_ADDRESS" .
```


