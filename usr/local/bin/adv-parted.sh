#!/bin/bash
#i=0
for PART in `mount |grep $1 |awk '{print $1}'`
do
	[ $PART ] && umount $PART 
	#partnum[$i]=$part
	#i=`expr $i + 1`
done	
PART=`blkid |grep "swap" |awk -F ":" '{print $1}'`
[ $PART ] && swapoff $PART
#parted -s $1 mklabel gpt
dd if=/dev/zero of=$1 bs=512 count=2 &> /dev/null
fdisk $1 <<End
n
p
1



w
End
