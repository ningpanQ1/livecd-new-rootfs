#!/bin/sh
#file : adv-get-mount.sh

ROOTPOINT=`cat /cdrom/advantech/conf/rootfs.conf`
PART=$1
MOUNTPOINT=`df | awk -v PART=$PART '{if($1==PART) print $6}'`

if [ "$MOUNTPOINT" != "" ]
then
	if [ "$MOUNTPOINT" = "$ROOTPOINT" ]
	then
		echo "/"
	else
		echo ${MOUNTPOINT#${ROOTPOINT}}
	fi
else
	echo $MOUNTPOINT
fi


