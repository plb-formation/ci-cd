FROM ambientdocker/docker-oracle-xe-11g

MAINTAINER Herve  <dockerlite@gmail.com>

RUN apt-get -y update && \
    apt-get -y install git vim python3

COPY ChinookDatabase /
COPY tpc-ds /

