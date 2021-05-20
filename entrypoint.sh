#!/bin/sh

if [ "$1" = "default" ]; then
    exec nginx -g "daemon off;"
else
    nginx
fi

exec "$@"
