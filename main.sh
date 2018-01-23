#!/bin/bash

export WHOME=/volume1/apps/samm

[ ! $WHOME ] && echo "Missing \$WHOME" && exit 1

ls scripts | while read file
do
	./$file
done

