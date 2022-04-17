# NodeJS 16

## Build

```sh
docker buildx build --build-arg http_proxy=http://host.docker.internal:3142 --platform linux/amd64,linux/arm64 --push -t mikoto2000/node:16 .
```

