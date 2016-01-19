#!/bin/bash
ABSOLUTE_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
ABSOLUTE_PATH=$(dirname $ABSOLUTE_PATH)

echo $ABSOLUTE_PATH;

source variables.conf

docker stop $DOCKER_NAME
docker rm $DOCKER_NAME

docker run -i -t -d --name $DOCKER_NAME -p $PORT_SSL:443 -p $PORT:80 --add-host $HOST:127.0.0.1 -v $ABSOLUTE_PATH/files/sites-available:/etc/nginx/sites-available -v $ABSOLUTE_PATH/files/sites-enabled/:/etc/nginx/sites-enabled -v $WWW_FOLDER:/var/www/$HOST $DOCKER_NAME

# --entrypoint 'bash'
