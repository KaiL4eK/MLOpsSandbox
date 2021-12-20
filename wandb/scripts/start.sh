#!/bin/bash

set -o allexport; source .env; set +o allexport

docker run \
    --rm -v wandb:/vol \
    -p $EXTERNAL_PORT:8080 \
    --name wandb-local wandb/local:0.9.46
