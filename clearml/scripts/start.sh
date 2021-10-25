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
echo "Compose project name: $COMPOSE_PROJECT_NAME"

docker-compose stop && \
docker-compose up $DOCKER_OPTS
