#!/bin/bash

[ ! $WHOME ] && echo "Missing \$WHOME" && exit 1

docker run -d \
  --name plex \
  --net host \
  -e VERSION=latest \
  -e PUID=0 -e PGID=0 \
  -e TZ=CET \
  -v /etc/localtime:/etc/localtime:ro \
  -v $WHOME/config/plex:/config \
  -v $WHOME/data/movies:/data/movies \
  -v $WHOME/data/tv:/data/tvshows \
  linuxserver/plex

