#!/bin/sh
#file: adv-new-system-setup.sh

NEW_ROOT_FS=`cat /cdrom/advantech/conf/rootfs.conf`
DEV=`cat /tmp/boot-device.tmp`
NEXT_SHELL=adv-system-setup-inside.sh
BASH_PACH=env.file
AUTO_SETTING=/cdrom/advantech/conf/setting
ONLINE_SETTING=/cdrom/advantech/conf/online_setting

#bind proc dev tmp
mount --bind /proc ${NEW_ROOT_FS}/proc
mount --bind /dev  ${NEW_ROOT_FS}/dev
mount --bind /tmp  ${NEW_ROOT_FS}/tmp
mount --bind /sys  ${NEW_ROOT_FS}/sys

cp -r /cdrom/advantech/script/${NEXT_SHELL} ${NEW_ROOT_FS}
cp -r /cdrom/advantech/script/${BASH_PACH} ${NEW_ROOT_FS}

sync

copy_ota_system()
{
    if [ -d ${NEW_ROOT_FS}/media/recovery ]; then
	mkdir ${NEW_ROOT_FS}/media/recovery/advupdate
	mkdir ${NEW_ROOT_FS}/media/recovery/boot
	mkdir ${NEW_ROOT_FS}/media/recovery/advupdate/bin
	mkdir ${NEW_ROOT_FS}/media/recovery/advupdate/preseed
    	cp -xarf /cdrom/casper/vmlinuz ${NEW_ROOT_FS}/media/recovery/boot/
    	cp -xarf /cdrom/casper/initrd ${NEW_ROOT_FS}/media/recovery/boot/
    	cp -xarf /cdrom/casper/filesystem* ${NEW_ROOT_FS}/media/recovery/advupdate/
    	cp -xarf /cdrom/advantech/bin/advupdate.sh ${NEW_ROOT_FS}/media/recovery/
    	cp -xarf /cdrom/advantech/sbin/recovery_installer ${NEW_ROOT_FS}/media/recovery/advupdate/bin
		cp -xarf /cdrom/advantech/conf/advupdate.txt.example ${NEW_ROOT_FS}/media/recovery/
	cp -r /cdrom/advantech/script/factory_recovery.sh ${NEW_ROOT_FS}/media/recovery/advupdate/bin/
	cp -r /cdrom/advantech/script/recovery_image.sh ${NEW_ROOT_FS}/media/recovery/advupdate/bin/
	cp -r /cdrom/advantech/script/post_factory_recovery.sh ${NEW_ROOT_FS}/media/recovery/advupdate/bin/
	cp -r /cdrom/preseed/xubuntu.seed ${NEW_ROOT_FS}/media/recovery/advupdate/preseed/
	cp -xarf /cdrom/advantech/images/appupdatedemo.img ${NEW_ROOT_FS}/media/recovery/advupdate/ 
     	sync	
    fi
}

copy_grub_cfg()
{
	cp -rf /etc/grub.d/00_header ${NEW_ROOT_FS}/etc/grub.d/
	cp -rf /etc/grub.d/10_linux ${NEW_ROOT_FS}/etc/grub.d/
	cp -rf /etc/grub.d/40_custom ${NEW_ROOT_FS}/etc/grub.d/
	#cp -xarf /etc/grub.d/* ${NEW_ROOT_FS}/etc/grub.d/
	cp -xarf /etc/default/grub ${NEW_ROOT_FS}/etc/default/
	rm -rf ${NEW_ROOT_FS}/etc/grub.d/20_memtest86+
	rm -rf ${NEW_ROOT_FS}/etc/grub.d/30_uefi-firmware
	sync
	#rm -rf ${NEW_ROOT_FS}/etc/grub.d/30_os-prober
}

create_efi_partition()
{
if [ -d /sys/firmware/efi ]; then
fdisk ${DEV} <<End
t
1
1
w
End
fi
}

chmod 777 ${NEW_ROOT_FS}/${NEXT_SHELL}

copy_ota_system
copy_grub_cfg
create_efi_partition

#if [ ! -d "${ONLINE_SETTING}" ]; then
#    if [ ! -d "${AUTO_SETTING}" ]; then
#	cp /tmp/device_name.tmp ${NEW_ROOT_FS}/
#	cp /tmp/password.tmp ${NEW_ROOT_FS}/
#	cp /tmp/hostname.tmp ${NEW_ROOT_FS}/
#	cp /tmp/zone.tmp ${NEW_ROOT_FS}/
#	cp /tmp/autologin.tmp ${NEW_ROOT_FS}/
#	cp /tmp/systemMode.tmp ${NEW_ROOT_FS}/
#    fi
#fi

cp /tmp/boot-device.tmp ${NEW_ROOT_FS}/
cp /tmp/grubReq.tmp ${NEW_ROOT_FS}/
cp /tmp/screenHotPlugReq.tmp ${NEW_ROOT_FS}/
#cp /tmp/device_name.tmp ${NEW_ROOT_FS}/

#fix vga hdmi hot plug
#rm ${NEW_ROOT_FS}/usr/bin/xfsettingsd
#cp -xarf /cdrom/advantech/bin/xfsettingsd ${NEW_ROOT_FS}/usr/bin/
#cp -xarf /cdrom/advantech/conf/logo* ${NEW_ROOT_FS}/usr/share/plymouth/themes/xubuntu-logo/
#cp -xarf /cdrom/advantech/conf/xorg.conf ${NEW_ROOT_FS}/
cp -xarf /cdrom/advantech/conf/wqy-microhei.ttc ${NEW_ROOT_FS}/
cp -xarf /cdrom/advantech/conf/grub.png ${NEW_ROOT_FS}/usr/share/images/desktop-base/

sync

chroot ${NEW_ROOT_FS} /$NEXT_SHELL || exit $?

umount ${NEW_ROOT_FS}/proc
umount ${NEW_ROOT_FS}/dev
umount ${NEW_ROOT_FS}/tmp
umount ${NEW_ROOT_FS}/sys
umount ${NEW_ROOT_FS}

sync
exit 0
