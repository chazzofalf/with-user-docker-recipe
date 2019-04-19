#!/bin/bash
source docker-main/docker-helper-functions.sh
docker-build-image-with-name chazzofalf/ubuntu-base-docker-recipe
docker-smart-build-core "$@"
