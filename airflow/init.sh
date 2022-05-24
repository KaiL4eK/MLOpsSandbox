#!/usr/bin/env bash

set -a; source .env; set +a

mkdir -p ./${LOCAL_VOLUMES_ROOT}/{dags,logs,plugins}

docker-compose up airflow-init
