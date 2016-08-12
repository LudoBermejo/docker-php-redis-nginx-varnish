#!/bin/bash

# Supervisord default params
SUPERVISOR_PARAMS='--nodaemon --configuration /etc/supervisord.conf'
supervisord -n $SUPERVISOR_PARAMS
