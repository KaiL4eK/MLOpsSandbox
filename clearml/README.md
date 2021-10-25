# ClearML start-up scripts

## References

- [GitHub](https://github.com/allegroai/clearml-server)
- [Official documentation](https://clear.ml/docs/latest/docs/deploying_clearml/clearml_server/)

## Pre-installation steps

- [Docker](https://docs.docker.com/engine/install/ubuntu/), [docker-compose](https://docs.docker.com/compose/install/) installation

## Installation

- Start daemonized container

```bash
./scripts/start.sh -d
```

## Post-installation

- Activate local virtualenv

```bash
. ./scripts/activate_local_venv.sh
```

- Initialize clearml client

```bash
# This creates file ~/clearml.conf
# Ref: https://clear.ml/docs/latest/docs/configs/clearml_conf
clearml-init
```

## Sample execution

- Execute script to log some metrics to server

```bash
python scripts/clearml_sample.py
```
