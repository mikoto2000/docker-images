openssl
=======

Usage:
------

```sh
docker-compose run --rm openssl /bin/bash
```

※ この README 内で「クライアント」と言っているのは、「CA を利用する人」という意味(サーバ証明書・クライアント証明書とかの「クライアント」ではない(この辺の表現考えないといけない...))


### CA の初期化

```sh
cd /ca

# 各種ディレクトリ作成
mkdir cert private crl newcerts
chmod 700 private

# シリアル初期化
echo "01" | tee -a serial

# crlnumber 初期化
echo "01" | tee -a crlnumber

# インデックス初期化
touch index.txt
echo "unique_subjec = yes" > index.txt.attr
```


### CA 鍵と CA 証明書作成

```sh
KEY_FILE="/ca/private/cakey.pem"
CSR_FILE="/ca/ca.csr"

# CA 用秘密鍵作成
openssl genrsa -out ${KEY_FILE} 2048

# CA 証明書要求作成
COUNTRY="JP"
STATE="Tokyo"
LOCALITY="Minato-ku"
ORGANIZATION="foo Inc."
ORGANIZATIONAL_UNIT="bar"
COMMON="server_01"
EMAIL="test@example.com"
SUBJECT="/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION}/OU=${ORGANIZATIONAL_UNIT}/CN=${COMMON}"
openssl req -new -key ${KEY_FILE} -out ${CSR_FILE} -subj "${SUBJECT}"

# CA 証明書要求確認
openssl req -noout -text -in /ca/ca.csr

# CA 証明書作成
openssl x509 -req -in /ca/ca.csr -signkey /ca/private/cakey.pem -out /ca/cacert.pem -extfile /usr/lib/ssl/v3_ca.txt
```


### クライアント証明書作成

クライアントからもらった `server_01.csr` を `./client` に格納したうえでコンテナを起動し、次のコマンドを実行する。

```sh
COMMON="server_01"
CRT_FILE="/client/${COMMON}.crt"
CSR_FILE="/client/${COMMON}.csr"

cd /client

openssl ca -out ${CRT_FILE} -infiles ${CSR_FILE}
```


### クライアント証明書の内容確認

```sh
TARGET=01.pem

openssl x509 -in /ca/newcerts/${TARGET} -text
```


### クライアント証明書の失効

```sh
TARGET=01.pem

# 証明書の失効処理
openssl ca -revoke /ca/newcerts/${TARGET}

# 証明書の失効処理
openssl ca -gencrl -out /ca/CA.crl
```


### crt -> p12 変換

※ クライアントの仕事

```sh
COMMON="server_01"
CACERT_FILE=/ca/cacert.pem
KEY_FILE=/client/${COMMON}.key
CRT_FILE=/client/${COMMON}.crt
P12_FILE=/client/${COMMON}.p12
openssl pkcs12 -export -out ${P12_FILE} -inkey ${KEY_FILE} -in ${CRT_FILE} -certfile ${CACERT_FILE}
```


### クライアントの鍵と証明書要求の作り方

※ クライアントの仕事

### SAN の設定

`usr_lib_ssl/openssl.cnf` の末尾に以下のセクション・設定項目を追加し、
`alt_names` セクションの DNS 名を修正する。

■ 設定例:

```cnf
[ req ]
req_extensions = v3_req

[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = mikoto2000.example.com
DNS.2 = *.mikoto2000.example.com
```

設定を追加したら、 openssl の Docker コンテナを起動する。

```sh
docker-compose run --rm openssl /bin/bash
```

Docker コンテナ内で鍵の生成・証明書要求作成を行う。

```sh
COMMON="server_01"
KEY_FILE="/client/${COMMON}.key"
CSR_FILE="/client/${COMMON}.csr"

# クライアント秘密鍵作成
openssl genrsa -out ${KEY_FILE} 2048

# クライアント証明書要求作成
COUNTRY="JP"
STATE="Tokyo"
LOCALITY="Minato-ku"
ORGANIZATION="foo Inc."
ORGANIZATIONAL_UNIT="bar"
EMAIL="test@example.com"
SUBJECT="/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION}/OU=${ORGANIZATIONAL_UNIT}/CN=${COMMON}"
openssl req -new -key ${KEY_FILE} -out ${CSR_FILE} -subj "${SUBJECT}"

# クライアント証明書要求確認
openssl req -noout -text -in ${CSR_FILE}
```

