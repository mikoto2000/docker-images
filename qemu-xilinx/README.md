# qemu-xilinx

## Build

### amd64
```sh
docker build --build-arg http_proxy=http://host.docker.internal:3142 -t mikoto2000/qemu-xilinx:latest -f Dockerfile_2022.2 .
```

### amd64 and arm64 platform

```sh
docker buildx build --platform linux/amd64,linux/arm64 --build-arg http_proxy=http://host.docker.internal:3142 --push -t mikoto2000/qemu-xilinx:latest -f Dockerfile_2022.2 .
```

