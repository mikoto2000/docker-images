# che-buildkit

## Build

```sh
docker build --build-arg http_proxy=http://host.docker.internal:3142 -t mikoto2000/che-buildkit .
```

## Run

```sh
docker run -it --rm -v "$(pwd)/projects:/projects" --workdir /projects -v "$HOME/.m2:/root/.m2" -v "/var/run/docker.sock:/var/run/docker.sock" mikoto2000/che-buildkit
```

