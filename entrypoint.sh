#!/bin/bash

# Launch docker
sudo dind dockerd $DOCKER_EXTRA_OPTS > /dev/null 2>&1 &
while(! docker info > /dev/null 2>&1); do
	sleep 1
done

exec "$@"
