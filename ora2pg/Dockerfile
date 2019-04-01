FROM centos:7

#ENV ORACLE_HOME=/usr/lib/oracle/12.1/client64
#ENV PATH=/usr/lib/oracle/12.1/client64/bin
#ENV LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


RUN yum -y update && \
    yum  -y install wget git htop iotop iftop && \
    yum -y install cpanm gcc perl perl-App-cpanminus perl-Config-Tiny && \
    yum clean all

COPY fury.repo /etc/yum.repos.d

RUN yum --disablerepo=* --enablerepo=fury list available

RUN yum -y install oracle-instantclient11.2-basic && \
    yum -y install oracle-instantclient11.2-sqlplus && \
    yum -y install oracle-instantclient11.2-devel

ENV ORACLE_HOME /usr/lib/oracle/11.2/client64
ENV PATH=${PATH}:/usr/lib/oracle/11.2/client64/bin
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/oracle/11.2/client64/lib

WORKDIR /

RUN wget https://cpan.metacpan.org/authors/id/T/TI/TIMB/DBI-1.642.tar.gz && \
    tar -zxvf DBI-1.642.tar.gz && cd DBI-1.642 && perl Makefile.PL  && make && make install

RUN wget https://cpan.metacpan.org/authors/id/Z/ZA/ZARQUON/DBD-Oracle-1.76.tar.gz && \
    tar -zxvf DBD-Oracle-1.76.tar.gz && \
    cd DBD-Oracle-1.76  && \
    perl Makefile.PL  && \
    make && make install

COPY ora_connect.pl /
RUN chmod +x /ora_connect.pl

RUN wget https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm && \
    yum -y install pgdg-centos11-11-2.noarch.rpm && \
    yum -y install postgresql11 && \
    yum -y install postgresql11-devel


ENV POSTGRESQL_HOME /usr/pgsql-11
ENV PATH=${PATH}:/usr/pgsql-11/bin
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/pgsql-11/lib

RUN wget https://cpan.metacpan.org/authors/id/T/TU/TURNSTEP/DBD-Pg-3.7.4.tar.gz && \
    tar -zxvf DBD-Pg-3.7.4.tar.gz && \
    cd DBD-Pg-3.7.4 && \
    perl Makefile.PL && \
    make && make install

# install ora2pg
RUN wget https://github.com/darold/ora2pg/archive/v19.1.tar.gz && \
    tar -zxvf v19.1.tar.gz && \
    cd ora2pg-19.1 && \
    perl Makefile.PL && \
    make && make install

COPY pg_connect.pl /
RUN chmod +x /pg_connect.pl
COPY ora2pg.conf /etc/ora2pg/
COPY chinook_convert.sql /ora2pg-19.1/scripts

