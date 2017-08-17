#!/bin/bash
set -e

envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
