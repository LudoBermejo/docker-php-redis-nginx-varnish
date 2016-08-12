#!/bin/sh

DockerfileTemplate=`cat Dockerfile.template`
NodeTemplate=`cat NodeInstall.template`

DockerfileTemplate="${DockerfileTemplate/NGINX_CONF/nginx_pro_conf/nginx.conf}"
DockerfileTemplate="${DockerfileTemplate/CONDITIONAL_NODE/$NodeTemplate}"

echo "$DockerfileTemplate" > Dockerfile

