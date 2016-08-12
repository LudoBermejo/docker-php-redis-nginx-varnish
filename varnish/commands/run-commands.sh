#!/bin/sh

sed -i -e "s/{BACKEND_PORT}/${BACKEND_PORT}/" -e "s/{DISTRO}/${DISTRO}/" /opt/varnish.vcl

varnishd -F -p default_ttl=3600 -p default_grace=3600 -s malloc,$VARNISH_CACHE_SIZE -f /opt/varnish.vcl