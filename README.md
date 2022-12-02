# Docker Jetty - su Alpine Linux - basata su Amazon Corretto

## Table of Contents
1. [Build](#build)
2. [Run the stack](#run-the-stack)
3. [Docker Compose](#docker-compose)

## Build

### Jetty 9.4.49

	$ ./build-jetty-9.4.49.sh


## Run

### Jetty 9.4.49

Docker run senza i volumi esterni:

	$ docker run --name docker-jetty -p 80:80 -p 443:443 -p 8443:8443  -t -i -d scolagreco/docker-jetty:9.4.49


## Docker compose

