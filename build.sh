#!/bin/sh
. ./variables.conf

docker build $@ --rm -t $DOCKER_NAME .

