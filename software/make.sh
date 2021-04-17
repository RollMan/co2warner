#!/bin/sh
IMAGE_NAME=avr-gcc-docker

docker run --rm -it -v $(pwd):/work ${IMAGE_NAME} "$@"
