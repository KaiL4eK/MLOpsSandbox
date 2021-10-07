#!/usr/bin/env bash

set -o allexport; source .env; set +o allexport

DOCKER_OPTS=

while getopts d flag
do
    case "${flag}" in
        # Daemonize start
        d) DOCKER_OPTS=-d;;
    esac
done

echo "Docker options: $DOCKER_OPTS"
echo "CVAT compose project name: $COMPOSE_PROJECT_NAME"
echo "CLone directory: $CVAT_DIRECTORY"

## Get cvat from repository
[[ -d "cvat" ]] || git clone -b v1.6.0 https://github.com/openvinotoolkit/cvat.git $DIRECTORY && \

cp src/docker-compose.yml cvat/

mkdir -p cvat/data/cvat_{data,keys,logs,models} && \
mkdir -p cvat/cvat_shared && \
cd $CVAT_DIRECTORY && \
    docker-compose stop && \
    docker-compose up $DOCKER_OPTS

## Change CVAT_HOST to your IP

## Change volumes settings

## Create user "user" with password "1":
# docker exec -it cvat bash -ic 'python3 ~/manage.py createsuperuser'
