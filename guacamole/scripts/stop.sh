#!/usr/bin/env bash

set -o allexport; source .env; set +o allexport

CLEAN_CONTAINERS=false

while getopts f flag
do
    case "${flag}" in
        # Clean containers after start
        f) CLEAN_CONTAINERS=true;;
    esac
done

echo "Clean containers: $CLEAN_CONTAINERS"

docker-compose stop

if $CLEAN_CONTAINERS ;then
    docker-compose down --volumes
fi
