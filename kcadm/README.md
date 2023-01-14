# kcadmin

## build

```sh
docker build -t mikoto2000/kcadm:latest .
```

## Run

```sh
docker run -it --rm mikoto2000/kcadm
```

## Example

```sh
docker run -it --rm mikoto2000/kcadm:latest

kcadm.sh config credentials \
    --server http://host.docker.internal:8080 \
    --realm master \
    --user admin  \
    --password Pa55w0rd
kcadm.sh create realms \
    -s realm='myoidc' \
    -s displayName='myoidc' \
    -s enabled=true \
    -s registrationAllowed=false \
    -s resetPasswordAllowed=true
kcadm.sh create clients \
    -r 'myoidc' \
    -s clientId=myoidc-client \
    -s id=myoidc-client \
    -s redirectUris='["*"]' \
    -s directAccessGrantsEnabled=true \
    -s secret=myoidc-secret
kcadm.sh create users \
    -r 'myoidc' \
    -s username=test \
    -s email=\"test@test.com\" \
    -s enabled=true \
    -s emailVerified=true
kcadm.sh set-password \
    -r 'myoidc' \
    --username test \
    --new-password test
```
