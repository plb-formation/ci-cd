FROM centos:7

MAINTAINER Herve Meftah <dockerlite@gmail.com>

ENV  JMETER_VERSION=5.1

RUN yum -y update && \
    yum -y install htop iotop, iftop git curl wget && \
    mkdir /jmeter   && \
    mkdir /scripts  && \
    mkdir /results

WORKDIR /tmp
RUN wget http://mirror.ibcp.fr/pub/apache//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -zxvf apache-jmeter-${JMETER_VERSION}.tgz -C /jmeter

VOLUME ["/results","/scripts"]
CMD ["/bin/bash"]
