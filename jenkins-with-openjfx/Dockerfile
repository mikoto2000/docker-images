FROM jenkins

USER root

RUN apt -y update
RUN apt -y upgrade
RUN apt -y install openjfx
RUN apt-get clean

USER jenkins

