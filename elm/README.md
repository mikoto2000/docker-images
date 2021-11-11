# elm

Install elm packages.


## Package list

- elm@0.19.1-5 \
- elm-analyse@0.16.5 \
- elm-format@0.8.5 \

## Use

```sh
docker run -it --rm -v "$(pwd):/work" --workdir "/work" -p "8080:8080" mikoto2000/elm:latest
```

## Build

```sh
docker build -t mikoto2000/elm .
```

