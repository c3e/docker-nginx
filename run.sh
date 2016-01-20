#!/bin/bash
SCRIPT=$(readlink -f "$0")
ABSOLUTE_PATH=$(dirname "$SCRIPT")

echo $ABSOLUTE_PATH

VARIABLE_CONF="$ABSOLUTE_PATH/variables.conf"

echo $VARIABLE_CONF
. $VARIABLE_CONF

docker stop $DOCKER_NAME
docker rm $DOCKER_NAME

docker run -i -t -d --name $DOCKER_NAME -p $PORT_SSL:443 -p $PORT:80 --add-host $HOST:127.0.0.1 -v $ABSOLUTE_PATH/files/sites-available:/etc/nginx/sites-available -v $ABSOLUTE_PATH/files/sites-enabled/:/etc/nginx/sites-enabled -v $WWW_FOLDER:/var/www/$HOST $DOCKER_NAME

# --entrypoint 'bash'
