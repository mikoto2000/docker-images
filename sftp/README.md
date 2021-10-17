# sftp

## Run

```sh
docker run -it --rm -p "22:22" --name sftp mikoto2000/sftp
```

### Environment Variables

| Variable name | Default value |
|----|----|
| `SFTP_USER` | `sftp` |
| `SFTP_PASSWORD` | `password` |
| `SFTP_ROOT_DIR` | `/var/sftp` |
| `SFTP_HOME_DIR` | `/data` |
| `SFTP_LOG_LEVEL` | `INFO` |

```sh
docker run -it --rm -p "22:22" \
    -e SFTP_USER=user \
    -e SFTP_PASSWORD=test \
    -e SFTP_ROOT_DIR=/opt/sftp \
    -e SFTP_HOME_DIR=/video \
    -e SFTP_LOG_LEVEL=DEBUG3 \
    --name sftp \
    mikoto2000/sftp
```


## Build

```sh
docker build -t mikoto2000/sftp .
```

