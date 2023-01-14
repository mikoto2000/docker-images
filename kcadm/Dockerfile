FROM quay.io/keycloak/keycloak:19.0 AS keycloak

FROM alpine:3.17 AS build-jre
LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"

RUN apk add --no-cache openjdk17-jdk binutils

COPY --from=keycloak \
        /opt/keycloak \
        /opt/keycloak

RUN jlink \
        --no-header-files \
        --no-man-pages \
        --compress=2 \
        --strip-debug \
        --add-modules java.base,java.desktop,java.naming,java.security.jgss,java.sql \
        --output /opt/keycloak-jre

FROM alpine:3.17
LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL description "kcadm for keycloak version 19."

COPY --from=build-jre \
        /opt/keycloak-jre \
        /opt/keycloak-jre

COPY --from=keycloak \
        /opt/keycloak/bin/kcadm.sh \
        /opt/keycloak/bin/kcadm.sh

COPY --from=keycloak \
        /opt/keycloak/bin/client/keycloak-admin-cli-19.0.1.jar \
        /opt/keycloak/bin/client/keycloak-admin-cli-19.0.1.jar

ENV JAVA_HOME /opt/keycloak-jre
ENV PATH $PATH:/opt/keycloak/bin:$JAVA_HOME/bin

