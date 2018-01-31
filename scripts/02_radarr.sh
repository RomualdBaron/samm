#!/bin/bash

WHOME=/volume1/apps/samm

TV=$WHOME/data/tv
DOWNLOADS=$WHOME/tmp/downloads
WATCH=$WHOME/tmp/torrent_watch

[ ! $WHOME ] && echo "Missing \$WHOME" && exit 1

[ ! -e $TV ] && echo "$TV to be created" && exit 1
[ ! -e $DOWNLOADS ] && echo "$DOWNLOADS to be created" && exit 1
[ ! -e $WATCH ] && echo "$WATCH to be created" && exit 1

docker run -d \
  --name radarr \
  -p 7878:7878 \
  -e PGID=0 -e PUID=0 \
  -e TZ=CET \
  -v /etc/localtime:/etc/localtime:ro \
  -v $TV:/tv \
  -v $DOWNLOADS:/downloads \
  -v $WATCH:/watch \
  linuxserver/radarr

if [ $? != 0 ] ; then
	echo "Issue starting, clearing old version"
	docker ps -a | grep -v CONTAI | grep -v Up | awk '{print $1}' | xargs docker rm
else
	echo "You can now connect http://localhost:7878"
fi

