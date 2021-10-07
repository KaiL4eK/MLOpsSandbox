# CVAT start-up scripts

## Pre-installation steps

Docker, docker-compose installation:
- https://openvinotoolkit.github.io/cvat/docs/administration/basics/installation/

## Installation

- Start daemonized container
```bash
./scripts/start_cvat.sh -d
```

## Post-installation

- Create superuser
```bash
docker exec -it cvat bash -ic 'python3 ~/manage.py createsuperuser'
```