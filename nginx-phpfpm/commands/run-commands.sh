#!/bin/bash

# Supervisord default params
SUPERVISOR_PARAMS='-c /etc/supervisord.conf'
supervisord -n $SUPERVISOR_PARAMS
