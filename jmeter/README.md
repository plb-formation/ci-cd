## JMeter Docker Container

The Dockerfile builds a Jmeter docker instance .

### Usage - Pull Image from Docker Hub

```
docker pull ambient-docker/jmeter
docker run -d -p 8081:80 ambient-docker/jmeter
```

### Usage - Build manually
```
docker build -t jmeter .
docker run -d -p 8081:80 jmeter
```
