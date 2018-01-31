#!/bin/bash 

WHOME=/volume1/apps/samm

[ ! $WHOME ] && echo "Missing \$WHOME" && exit 1

[ ! -e $WHOME/config/deluge ] && echo "$WHOME/config/deluge to create"
[ ! -e $WHOME/tmp/downloads ] && echo "$WHOME/tmp/downloads to create"
[ ! -e $WHOME/tmp/torrent_watch ] && echo "$WHOME/tmp/torrent_watch to create"

docker run -d --name=deluge \
  -v $WHOME/config/deluge:/config \
  -v $WHOME/tmp/downloads:/downloads \
  -v $WHOME/tmp/torrent_watch:/watch \
  -e PGID=0 -e PUID=0 \
  -e TZ=CET \
  -e UMASK_SET=\<022\> \
  -p 8112:8112 \
  linuxserver/deluge

if [ $? != 0 ] ; then
	echo "Issue starting, clearing old version"
	docker ps -a | grep -v CONTAI | grep -v Up | awk '{print $1}' | xargs docker rm
else
	echo "You can now connect http://localhost:8112"
fi
