#!/bin/sh
#file: adv-umount.sh

DEVICE=$1
MOUNTP=`adv-get-mount.sh $DEVICE`
ROOTPOINT=`cat /cdrom/advantech/conf/rootfs.conf`

if [ ${MOUNTP} != "" ]
then
	umount ${DEVICE}
	#sleep 2
	rmdir ${ROOTPOINT}$MOUNTP

fi



