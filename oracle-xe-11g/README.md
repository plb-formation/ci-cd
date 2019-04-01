oracle-xe-11g
============================

Oracle Express Edition 11g Release 2 on Ubuntu 18.04 LTS

## Installation(with Ubuntu 18.04)
```
docker pull ambientdocker/docker-oracle-xe-11g
```
SSH server has been removed since 18.04, please use "docker exec" or 16.04 instead.

## Quick Start

Run with 1521 port opened:
```
docker run -d -p 11521:1521  ambientdocker/docker-oracle-xe-11g
```

Run this, if you want the database to be connected remotely:
```
docker run -d -p 11521:1521 -e ORACLE_ALLOW_REMOTE=true ambientdocker/docker-oracle-xe-11g
```

For performance concern, you may want to disable the disk asynch IO:
```
docker run -d -p 11521:1521 -e ORACLE_DISABLE_ASYNCH_IO=true  ambientdocker/docker-oracle-xe-11g
```

Enable XDB user with default password: xdb, run this:
```
docker run -d -p 11521:1521 -e ORACLE_ENABLE_XDB=true ambientdocker/docker-oracle-xe-11g
```

For APEX user:
```
docker run -d -p 11521:1521 -p 8080:8080  ambientdocker/docker-oracle-xe-11g
```

```
# Login http://localhost:8080/apex/apex_admin with following credential:
username: ADMIN
password: admin
```

By default, the password verification is disable(password never expired)<br/>
Connect database with following setting:
```
hostname: localhost
port: 11521
sid: xe
username: system
password: oracle
```

Password for SYS & SYSTEM
```
oracle
```

Support custom DB Initialization and running shell scripts
```
# Dockerfile
FROM  ambientdocker/docker-oracle-xe-11g

ADD init.sql   /docker-entrypoint-initdb.d/
ADD script.sh  /docker-entrypoint-initdb.d/
```
Running order is alphabetically. 
