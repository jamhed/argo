#!/bin/bash
TAG=${GITHUB_REF##*/}
docker login -u $DOCKER_USERNAME-p $DOCKER_PASSWORD
docker build .
docker tag workflow-controller jamhed/workflow-controller:$TAG
docker tag argoexec jamhed/argoexec:$TAG
docker tag argocli  jamhed/argocli:$TAG
docker push jamhed/workflow-controller:$TAG
docker push jamhed/argoexec:$TAG
docker push jamhed/argocli:$TAG
