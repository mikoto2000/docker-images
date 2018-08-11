googletest
==========

Usage:
------

1. ライブラリやヘッダなど、必要なディレクトリを `docker-compose.yml` に `volume` として追加する
2. コンテナを起動
3. `g++` でビルド
4. ビルド成果物をを実行


### コンテナ起動:

```sh
docker-compose run --rm googletest
```


### ビルド:

例えば、次の `test_main.cpp` をビルドしたい場合。

test_main.cpp:

```cpp
#include "gtest/gtest.h"

namespace {

TEST(Practice, First) {
    EXPECT_EQ(1, 1);
}

}
```

ビルドコマンド:

```sh
# 共有ライブラリを利用
g++ ./test_main.cpp -lgtest -lgtest_main -o test_main

# 静的ライブラリを利用
g++ ./test_main.cpp /usr/local/lib/libgtest.a /usr/local/lib/libgtest_main.a -pthread -o test_main
```

必要なライブラリやインクルードは、
`docker-compose.yml` に追記したうえで、
`-I` や `-L`, `ldconfig` やらなんやらで追加できるはず...。


