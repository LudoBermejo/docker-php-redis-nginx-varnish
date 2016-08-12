#!/bin/sh
echo "Reading config"
source config/dev.conf

if [ "$php_source" == "none" ]; then
    echo "You need to configure the folders of the PHP source code."
    echo "Please check config/dev.conf."
    exit 0
fi

if [ "$nodejs_source" == "none" ]; then
    echo "You need to configure the folders of the NODEJS source code."
    echo "Please check config/dev.conf."
    exit 0
fi

if [ ! -d "$php_source"  ]; then
    echo "$php_source is not a valid directory for PHP source code."
    echo "Please check config/dev.conf."
    exit 0
fi

if [ ! -d "$nodejs_source"  ]; then
    echo "$nodejs_source is not a valid directory for NODEJS source code."
    echo "Please check config/dev.conf."
    exit 0
fi

echo "Copying template"
cp docker-compose-dev-template.yml docker-compose.yml

chmod -R 777 $php_source/logs
chmod -R 777 $php_source/temp

sed -i "" "s?#PHP_FOLDER?$php_source?g" docker-compose.yml
sed -i "" "s?#NODEJS_FOLDER?$nodejs_source?g" docker-compose.yml

echo "Creating Dockerfiles"
$(cd nginx/ ; ./build_dev.sh)
$(cd nginx-phpfpm/ ; ./build_dev.sh)
$(cd nodejs/ ; ./build_dev.sh)

echo "Composing docker"
docker-machine ssh default 'sudo ntpclient -s -h pool.ntp.org'
docker-compose up