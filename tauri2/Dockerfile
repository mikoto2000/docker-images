FROM node:22

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="2.0.0"
LABEL description "Node: 22, Rust: "

ENV PATH=/usr/local/cargo/bin:$PATH

USER root

RUN apt-get update && apt-get -y install \
    libsoup-3.0-dev \
    libwebkit2gtk-4.1-dev \
    build-essential \
    lld \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-0.1-cil-dev \
    librsvg2-dev \
    sudo \
    fonts-noto-cjk \
    gcc-multilib libssl-dev \
    openjdk-17-jdk-headless \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# node ユーザーが sudo を使えるようにする
RUN usermod -aG sudo node \
    && echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER node
WORKDIR /home/node

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-setup.sh \
    && chmod u+x rustup-setup.sh \
    && ./rustup-setup.sh -y \
    && rm -rf rustup-setup.sh

# なぜか無効な rust-analyzer, rls がインストールされる問題の対応
RUN rm /home/node/.cargo/bin/rust-analyzer \
    /home/node/.cargo/bin/rls

# Android
env ANDROID_HOME /home/node/Android
env NDK_HOME $ANDROID_HOME/ndk/27.0.11902837/

RUN mkdir -p $ANDROID_HOME/cmdline-tools \
    && curl -LO https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip?hl=ja \
    && unzip commandlinetools-linux-11076708_latest.zip \
    && mv cmdline-tools $ANDROID_HOME/cmdline-tools/latest \
    && rm commandlinetools-linux-11076708_latest.zip \
    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "ndk;27.0.11902837" --sdk_root=$ANDROID_HOME \
    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "emulator" --sdk_root=$ANDROID_HOME \
    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "build-tools;34.0.0" --sdk_root=$ANDROID_HOME \
    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platforms;android-34" --sdk_root=$ANDROID_HOME \
    && sudo ln -s $ANDROID_HOME/ndk/27.0.11902837/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android34-clang /usr/local/bin/aarch64-linux-android-clang \
    && sudo ln -s $ANDROID_HOME/ndk/27.0.11902837/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ranlib /usr/local/bin/aarch64-linux-android-ranlib \
    && sudo ln -s $ANDROID_HOME/ndk/27.0.11902837/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ranlib /usr/local/bin/i686-linux-android-ranlib \
    && sudo ln -s $ANDROID_HOME/ndk/27.0.11902837/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ranlib /usr/local/bin/x86_64-linux-android-ranlib \
    && sudo ln -s $ANDROID_HOME/ndk/27.0.11902837/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ranlib /usr/local/bin/arm-linux-androideabi-ranlib \
    && /home/node/.cargo/bin/rustup target add aarch64-linux-android \
    && /home/node/.cargo/bin/rustup target add armv7-linux-androideabi \
    && /home/node/.cargo/bin/rustup target add i686-linux-android \
    && /home/node/.cargo/bin/rustup target add x86_64-linux-android

CMD ["bash"]


