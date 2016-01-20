#!/bin/sh
SCRIPT=$(readlink -f "$0")
ABSOLUTE_PATH=$(dirname "$SCRIPT")

echo $ABSOLUTE_PATH

VARIABLE_CONF="$ABSOLUTE_PATH/variables.conf"

echo $VARIABLE_CONF
. $VARIABLE_CONF

docker build $@ --rm -t $DOCKER_NAME $ABSOLUTE_PATH

