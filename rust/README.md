# Rust

## Build

```sh
docker buildx build --platform linux/amd64,linux/arm64 --build-arg http_proxy=http://host.docker.internal:3142 -t mikoto2000/rust:latest .
```

