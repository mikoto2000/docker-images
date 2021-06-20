FROM httpd:2.4.48

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v15"
LABEL description "httpd: 2.4.48 with mod_auth_openidc"

RUN apt-get update && apt-get -y install \
    libapache2-mod-auth-openidc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

