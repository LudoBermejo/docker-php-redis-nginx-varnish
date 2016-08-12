#!/bin/sh

DockerfileTemplate=`cat Dockerfile.template`

DockerfileTemplate="${DockerfileTemplate/NGINX_CONF/nginx_dev_conf/nginx.conf}"
DockerfileTemplate="${DockerfileTemplate/CONDITIONAL_PHP/#}"

echo "$DockerfileTemplate" > Dockerfile

