#!/bin/sh

DockerfileTemplate=`cat Dockerfile.template`

DockerfileTemplate="${DockerfileTemplate/NGINX_CONF/nginx_dev_conf/nginx.conf}"

echo "$DockerfileTemplate" > Dockerfile

