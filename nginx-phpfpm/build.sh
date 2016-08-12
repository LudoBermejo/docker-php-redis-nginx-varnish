#!/bin/sh

DockerfileTemplate=`cat Dockerfile.template`
PHPTemplate=`cat PHPInstall.template`

DockerfileTemplate="${DockerfileTemplate/NGINX_CONF/nginx_pro_conf/nginx.conf}"
DockerfileTemplate="${DockerfileTemplate/CONDITIONAL_PHP/$PHPTemplate}"

echo "$DockerfileTemplate" > Dockerfile


