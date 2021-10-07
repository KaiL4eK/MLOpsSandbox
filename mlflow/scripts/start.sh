#!/bin/bash

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
echo "Compose project name: $COMPOSE_PROJECT_NAME"

mkdir -p volumes/minio/data/{mlflow,dvc} && \
mkdir -p volumes/minio/config && \
mkdir -p volumes/db && \
mkdir -p volumes/mlflow
if [ ! $? = 0 ]; then
    echo "Failed to create directories"
    exit 1
fi

docker-compose stop && \
docker-compose up --build $DOCKER_OPTS
