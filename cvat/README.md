# CVAT start-up scripts

## References

- [GitHub](https://github.com/openvinotoolkit/cvat)
- [Demo service](https://cvat.org/)

## Pre-installation steps

- Docker, docker-compose [installation](https://openvinotoolkit.github.io/cvat/docs/administration/basics/installation/)

<!-- - Build (pull) all requured images
```bash
./scripts/build.sh
``` -->

## Installation

- Start daemonized container

```bash
./scripts/start.sh -d
```

## Post-installation

- Create superuser

```bash
docker exec -it cvat bash -ic 'python3 ~/manage.py createsuperuser'
```

- Setup users on [admin page](http://localhost:8080/admin)
