# toppers-kernel-build-kit

TOPPERS 第三世代カーネルをビルドするための環境。

## Build

### base

```sh
docker build -t mikoto2000/toppers-kernel-build-kit:base-latest .
```

### gcc-aarch64-linux-gnu

```sh
docker build -t mikoto2000/toppers-kernel-build-kit:gcc-aarch64-linux-gnu-latest -f Dockerfile_gcc-aarch64-linux-gnu .
```

### gcc-arm-none-eabi

```sh
docker build -t mikoto2000/toppers-kernel-build-kit:gcc-arm-none-eabi-latest -f Dockerfile_gcc-arm-none-eabi .
```

