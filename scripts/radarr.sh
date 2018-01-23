#!/bin/bash

[ ! $WHOME ] && echo "Missing \$WHOME" && exit 1

docker run -d \
  --name radarr \
  -p 7878:7878 \
  -e PGID=0 -e PUID=0 \
  -e TZ=CET \
  -v /etc/localtime:/etc/localtime:ro \
  -v $WHOME/data/tv:/tv \
  -v $WHOME/tmp/downloads:/downloads \
  -v $WHOME/tmp/watch:/watch \
  linuxserver/radarr

