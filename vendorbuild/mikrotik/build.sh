#!/bin/bash

set -e

version=$(git describe --tags "$(git rev-list --tags --max-count=1)" | cut -c2-)

# The docker build command is run in the directory at the root of the project, meaning the Dockerfile needs to reference files according to relative paths
docker build --output type=tar,dest=pathvector-"$version"-mikrotik-amd64.tar -t pathvector-cron:"$version"-amd64 -f ../vendorbuild/mikrotik/Dockerfile ..

# This isn't needed on my machine but it is on GitHub Actions. Not high priority to fix at the moment.
docker save pathvector-cron:"$version"-amd64 > pathvector-"$version"-mikrotik-amd64.tar
