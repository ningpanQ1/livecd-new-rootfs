#!/bin/sh
#file : adv-mount.sh

FILESYSTEM=$1
DEVICE=$2
MOUNTPOINT=$3

ROOT=`cat /cdrom/advantech/conf/rootfs.conf`
OLDMOUNT=`adv-get-mount.sh $DEVICE`


if [ ! -d $ROOT ]
then
	mkdir -p $ROOT	
fi

if [ ! -d ${ROOT}${MOUNTPOINT} ]
then
	mkdir -p ${ROOT}${MOUNTPOINT}
fi


if [ "$OLDMOUNT" = "" ]
then
	mount -t $FILESYSTEM $DEVICE ${ROOT}${MOUNTPOINT}
else
	adv-umount.sh $DEVICE
	#rmdir $OLDPOINT
	mkdir -p ${ROOT}${MOUNTPOINT}
	mount -t $FILESYSTEM $DEVICE ${ROOT}${MOUNTPOINT}
fi



