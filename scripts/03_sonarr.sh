#!/bin/bash

[ ! $WHOME ] && echo "Missing \$WHOME" && exit 1

docker run -d \
  --name sonarr \
  -p 8989:8989 \
  -e PUID=0 -e PGID=0 \
  -e TZ=CET \
  -v /etc/localtime:/etc/localtime:ro \
  -v $WHOME/config/sonarr:/config \
  -v $WHOME/data/tv:/tv \
  -v $WHOME/tmp/downloads:/downloads \
  -v $WHOME/tmp/watch:/watch \
  linuxserver/sonarr

