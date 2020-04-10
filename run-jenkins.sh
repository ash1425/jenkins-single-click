#!/bin/bash

set -e

JENKINS_IMAGE=docker-jenkins:local
JENKINS_CONTAINER=docker-jenkins

docker build . -t $JENKINS_IMAGE

docker rm -f $JENKINS_CONTAINER || true

docker run -d --name $JENKINS_CONTAINER -e DOCKER_HOST=tcp://host.docker.internal:2375 -p 8080:8080 docker-jenkins