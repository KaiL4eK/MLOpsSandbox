
build-executor-image:
	docker build \
		-t clearml-agent-executor:3.8-1.3 \
		-f docker/Dockerfile.executor \
		.

start-agent:
	docker-compose \
		-f docker-compose.agent-remote.yml \
		up --build


start-agent-daemon:
	docker-compose \
		-f docker-compose.agent-remote.yml \
		up -d --build

