#!/bin/bash

set -e

version=$(git describe --tags "$(git rev-list --tags --max-count=1)" | cut -c2-)

# The docker build command is run in the directory at the root of the project, meaning the Dockerfile needs to reference files according to relative paths
docker build --load -t pathvector-cron:"$version"-arm64v8 --build-arg ARCH=arm64v8/ -f vendorbuild/mikrotik/Dockerfile .
docker save pathvector-cron:"$version"-arm64v8 > pathvector-"$version"-mikrotik-arm64.tar