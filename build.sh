#!/usr/bin/env bash

GIT_COMMIT=`git rev-parse --short HEAD`

if [ ! -d "$(pwd)/build" ]; then
    mkdir $(pwd)/build
fi

docker build -t thehipbot/example-api-go-build:$GIT_COMMIT -f Dockerfile.build --build-arg PACKAGE=github.com/TheHipbot/example-api-go .
docker run --rm -v $(pwd)/build:/build thehipbot/example-api-go-build:$GIT_COMMIT
docker image rm thehipbot/example-api-go-build:$GIT_COMMIT
docker build -t thehipbot/example-api-go:$GIT_COMMIT -f Dockerfile.run .
