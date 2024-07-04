# tauri

## build

```sh
docker build -t mikoto2000/tauri2:latest .
```


## Run

### WSLg

```sh
docker run -it --rm -v "$(pwd):/work" --workdir "/work" --name node \
    -e  DISPLAY=:0 \
    -e  WAYLAND_DISPLAY=wayland-0 \
    -e  XDG_RUNTIME_DIR=/tmp/wslg/runtime-di \
    -e  PULSE_SERVER=/mnt/wslg/PulseServer \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /mnt/wslg:/mnt/wslg \
    mikoto2000/tauri:latest
```

### Linux

```sh
docker run -it --rm -v "$(pwd):/work" --workdir "/work" --name node \
    -e  DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    mikoto2000/tauri:latest
```

