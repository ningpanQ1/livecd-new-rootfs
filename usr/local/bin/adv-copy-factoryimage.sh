#!/bin/sh
NEW_ROOT_FS=`cat /cdrom/advantech/conf/rootfs.conf`
cp -xarf /cdrom/advantech/images/advlinux-*.img ${NEW_ROOT_FS}/media/recovery
sync
exit 0
