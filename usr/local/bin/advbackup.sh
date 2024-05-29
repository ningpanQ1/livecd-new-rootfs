#!/bin/bash

NEWSYS_DIR=/mnt/newsys
OTAPARTDEV=`df | awk '$6=="/otapart" {print $1}'`
RAID_DEV=`dmraid -s | grep name | awk '{print $NF}'`

if [[ $OTAPARTDEV =~ "sda" ]]
then
        bootdev="sda1"
        recoverdev="sda2"
        rootdev="sda3"
elif [[ $OTAPARTDEV =~ "sdb" ]]
then
        bootdev="sdb1"
        recoverdev="sdb2"
        rootdev="sdb3"
elif [[ $OTAPARTDEV =~ "mmc" ]]
then
        bootdev="mmcblk0p1"
        recoverdev="mmcblk0p2"
        rootdev="mmcblk0p3"
elif [[ $OTAPARTDEV =~ "nvme" ]]
then
        bootdev="nvme0n1p1"
        recoverdev="nvme0n1p2"
        rootdev="nvme0n1p3"
elif [[ $OTAPARTDEV =~ "dm" ]]
then
        bootdev="mapper/${RAID_DEV}p1"
        recoverdev="mapper/${RAID_DEV}p2"
        rootdev="mapper/${RAID_DEV}p3"
fi

echo_msg()
{
	NOW=$(date +'%Y-%m-%d %H:%M:%S')
	echo "[$NOW] $1" 2>&1
	sync
}

build_img()
{
    cp -xarf ${NEWSYS_DIR}/etc/fstab ${NEWSYS_DIR}/tmp/
    sync
    sed -i '/recovery/d' ${NEWSYS_DIR}/etc/fstab

    if [ -f "/otapart/advlinux-2.0.img" ];then
        rm -rf /otapart/advlinux-2.0.img 
    fi

	echo_msg "Backup factory image!"
	echo_msg "Please wait patiently. It may take several minutes..."	
    mksquashfs ${NEWSYS_DIR} /otapart/advlinux-2.0.img
    sync
    echo -e "\n****************************************"
    echo "The img has been put in /media/recovery."
    echo -e "****************************************\n"

    rm -rf ${NEWSYS_DIR}/etc/fstab
    mv ${NEWSYS_DIR}/tmp/fstab ${NEWSYS_DIR}/etc/
    sync
}

backup_function()
{
    mkdir ${NEWSYS_DIR} 

    BiosMode=`fdisk -l | grep gpt`

    if [ x"$BiosMode" = x ]; then
        mount /dev/${rootdev} ${NEWSYS_DIR} 

	build_img

	umount /dev/${rootdev}
    else
        mount /dev/${rootdev} ${NEWSYS_DIR} 
        mount /dev/${bootdev} ${NEWSYS_DIR}/boot/efi/

        build_img

        umount /dev/${bootdev}
        umount /dev/${rootdev}
    fi

    rm -rf ${NEWSYS_DIR} 
}

backup_function
sleep 5
reboot
