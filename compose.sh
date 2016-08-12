#!/bin/sh

echo "Creating Dockerfiles"
$(cd nginx/ ; ./build.sh)
$(cd nginx-phpfpm/ ; ./build.sh)
$(cd nodejs/ ; ./build.sh)

echo "Copying template"
cp docker-compose-prod-template.yml docker-compose.yml

echo "Composing docker"
docker-machine ssh default 'sudo ntpclient -s -h pool.ntp.org'
docker-compose up

