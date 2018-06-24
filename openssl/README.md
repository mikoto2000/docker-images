openssl
=======

Usage:
------

```sh
docker-compose run --rm openssl /bin/bash
```


### CA の初期化

```sh
cd /ca

# 各種ディレクトリ作成
mkdir cert private crl newcerts
chmod 700 private

# シリアル初期化
echo "01" | tee -a serial

# インデックス初期化
touch index.txt
```


### CA 鍵と CA 証明書作成

```sh
# CA 用秘密鍵作成
openssl genrsa -out /ca/private/cakey.pem 2048

# CA 証明書要求作成
openssl req -new -key /ca/private/cakey.pem -out /ca/ca.csr

# CA 証明書作成
openssl x509 -req -in /ca/ca.csr -signkey /ca/private/cakey.pem -out /ca/cacert.pem
```


### クライアント証明書作成

クライアントからもらった `server_01.csr` を `./client` に格納したうえでコンテナを起動し、次のコマンドを実行する。

```sh
cd /client

openssl ca -out server_01.crt -infiles server_01.csr
```

### (クライアントの鍵と証明書要求の作り方)

```sh
cd /client

# クライアント秘密鍵作成
openssl genrsa -out server_01.key 2048

# クライアント証明書要求作成
openssl req -new -key ./server_01.key -out server_01.csr
```

