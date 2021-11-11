FROM node:buster

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="1.0.0"
LABEL description "elm: v0.19.1"

RUN npm install -g \
    elm@0.19.1-5 \
    elm-analyse@0.16.5 \
    elm-format@0.8.5 \
    --unsafe-perm=true --allow-root

CMD [ "bash" ]
