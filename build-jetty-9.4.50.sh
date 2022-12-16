#!/bin/bash

docker build --build-arg JETTY_BASE_VERSION=9.4.50 --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` -t scolagreco/docker-jetty:9.4.50 .

