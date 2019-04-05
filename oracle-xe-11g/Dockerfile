FROM ambientdocker/docker-oracle-xe-11g

MAINTAINER Herve  <dockerlite@gmail.com>

RUN apt-get -y update && \
    apt-get -y install git vim python3 docker.io

ADD ChinookDatabase /ChinookDatabase
ADD tpc-ds /tpc-ds

