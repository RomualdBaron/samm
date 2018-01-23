#!/bin/bash

[ ! $WHOME ] && echo "Missing \$WHOME" && exit 1

docker run -d --name=deluge \
  -v $WHOME/config/deluge:/config \
  -v $WHOME/tmp/downloads:/downloads \
  -v $WHOME/tmp/watch:/watch \
  -e PGID=0 -e PUID=0 \
  -e TZ=CET \
  -e UMASK_SET=\<022\> \
  -p 8112:8112 \
  linuxserver/deluge
