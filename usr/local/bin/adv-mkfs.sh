#!/bin/sh 
#file: adv-mkfs.sh

FILESYSTEM=$1
DEVICE=$2

result=`echo $DEVICE | grep -v nvme`

if [ "$result" != "" ]
then
	partprobe
fi

MOUNTPOINT=`adv-get-mount.sh $DEVICE`

echo "$DEVICE was mounted at $MOUNTPOINT"

if [ "$MOUNTPOINT" != "" ]
then
	echo "umount the $DEVICE"
	umount $DEVICE
fi

if [ $FILESYSTEM = swap ]
then
	mk$FILESYSTEM $DEVICE
else
	yes | mkfs.$FILESYSTEM $DEVICE
fi
