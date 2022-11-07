#!/usr/bin/env bash

set -o allexport; source .env; set +o allexport

DOCKER_OPTS=

if [ -z $CVAT_HOST ]; then
    echo "CVAT_HOST should be set with your IP"
    exit 1
fi

while getopts d flag
do
    case "${flag}" in
        # Daemonize start
        d) DOCKER_OPTS=-d;;
    esac
done

echo "Docker options: $DOCKER_OPTS"
echo "Compose project name: $COMPOSE_PROJECT_NAME"
echo "Clone directory: $CVAT_DIRECTORY"

[[ -d $CVAT_DIRECTORY ]] \
    || git clone -b $CVAT_VERSION https://github.com/openvinotoolkit/cvat.git $CVAT_DIRECTORY

#  https://opencv.github.io/cvat/v2.2.0/docs/administration/basics/installation/

cd $CVAT_DIRECTORY \
    && docker-compose stop \
    && docker-compose up $DOCKER_OPTS

## Create user "user" with password "1":
# docker exec -it cvat_server bash -ic 'python3 ~/manage.py createsuperuser'
