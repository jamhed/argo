#!/bin/bash -e
TAG=${GITHUB_REF##*/}
echo BUILD TAG:$TAG

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

docker build --target argo-build .

docker build --target workflow-controller -t jamhed/workflow-controller:$TAG .
docker push jamhed/workflow-controller:$TAG

docker build --target argoexec -t jamhed/argoexec:$TAG .
docker push jamhed/argoexec:$TAG

docker build --target argocli -t jamhed/argocli:$TAG .
docker push jamhed/argocli:$TAG
