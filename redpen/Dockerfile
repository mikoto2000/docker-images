FROM openjdk:8

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v1.10.4"
LABEL description "RedPen: 1.10.4"

RUN curl -L -O https://github.com/redpen-cc/redpen/releases/download/redpen-1.10.4/redpen-1.10.4.tar.gz \
     && tar xf redpen-1.10.4.tar.gz -C /opt \
     && rm redpen-1.10.4.tar.gz

ENV PATH $PATH:/opt/redpen-distribution-1.10.4/bin/

CMD ["bash"]
