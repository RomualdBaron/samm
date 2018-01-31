#!/bin/bash 

WHOME=/volume1/apps/samm

[ ! $WHOME ] && echo "Missing \$WHOME" && exit 1

[ ! -e $WHOME/config/nginx ] && echo "$WHOME/config/nginx to create"

docker run -d --name=nginx \
  -v $WHOME/config/nginx:/usr/share/nginx/html:ro \
  -p 8989:80 \
  nginx

if [ $? != 0 ] ; then
	echo "Issue starting, clearing old version"
	docker ps -a | grep -v CONTAI | grep -v Up | awk '{print $1}' | xargs docker rm
else
	echo "You can now connect http://localhost:8989"
fi
