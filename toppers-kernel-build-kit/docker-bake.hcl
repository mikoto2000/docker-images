target "default" {
    matrix = {
        img = [
            "athrill-gcc",
            "gcc-aarch64-linux-gnu",
            "gcc-arm-none-eabi",
            "zig-with-gcc-arm-none-eabi",
        ]
    }

    name = img
    tags = ["${img}:latest"]
    target = img
}
