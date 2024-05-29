#!/bin/sh -x

PRODUCT_NAME=`Adspname -p`

PROGRAM=$1
INSTALL_DIR=`cat /cdrom/advantech/conf/rootfs.conf`
PACKAGE_DIR=/cdrom/advantech/images
TAR_PACKAGE_DIR=/cdrom/advantech/packages
PROFILE_DIR=/cdrom/advantech/profile
DRIVERS_DIR=/cdrom/advantech/drivers
LOG_FILE=/var/log/advinstall.log
AUTO_SETTING=/cdrom/advantech/conf/setting
ONLINE_SETTING=/cdrom/advantech/conf/online_setting
OTA_DIR=/cdrom/casper

#if [ ! -f "${LOG_FILE}" ]; then
#	touch ${LOG_FILE}
#fi
echo "Begin to umcomprass img to $INSTALL_DIR" >> ${LOG_FILE}

unsquashfs -d ${INSTALL_DIR} -f ${PACKAGE_DIR}/advlinux-*.img
sync
sync


if [ -d "${AUTO_SETTING}" ]; then
	cp -xarf ${AUTO_SETTING}/* ${INSTALL_DIR}/
fi

#if [ -d "${ONLINE_SETTING}" ]; then
#	cp -xarf ${ONLINE_SETTING}/* ${INSTALL_DIR}/
#	mkdir ${INSTALL_DIR}/onlineFlag
#fi

#mkdir -p ${INSTALL_DIR}/var/ubuntu-deb-packages
#echo "${PRODUCT_NAME}" > /tmp/device_name.tmp

copy_adv_driver()
{
    packageReq=$(cat /tmp/packageReq)
    cd ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/
    if [ -e /tmp/rtKernel.tmp ]; then
        cd kernel_rt
        cp -xf *rt* ${INSTALL_DIR}/var/ubuntu-deb-packages/
        cd ../peripheral/rt/
        cp -xf $packageReq ${INSTALL_DIR}/var/ubuntu-deb-packages/
    else
        cd peripheral/generic 
        cp -xf $packageReq ${INSTALL_DIR}/var/ubuntu-deb-packages/

    fi

    sync
    sync
}


copy_idoor()
{
    if [ -e /tmp/rtKernel.tmp ]; then
        echo "4.4.0-20171016-rt3" > /tmp/kernel_version
        #kernel_version=`cat /tmp/kernel_version`
        #cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/idoor/rt/*.ko ${INSTALL_DIR}/lib/modules/${kernel_version}/kernel/drivers/pci/
        cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/idoor/rt/*.ko ${INSTALL_DIR}/
        cp -xarf /tmp/rtKernel.tmp ${INSTALL_DIR}
        cp -xarf /tmp/kernel_version ${INSTALL_DIR}
    else
        cd ${INSTALL_DIR}/lib/modules/
        ls > /tmp/kernel_version
        kernel_version=`cat /tmp/kernel_version`
        cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/idoor/generic/*.ko ${INSTALL_DIR}/lib/modules/${kernel_version}/kernel/drivers/pci/
    fi
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/idoor/*.deb ${INSTALL_DIR}/var/ubuntu-deb-packages/
}

copy_package()
{
    cd /

    if [ -e /tmp/package.tmp ]; then
        cp /tmp/package.tmp ${INSTALL_DIR}/
        package=`cat /tmp/package.tmp`
        if [ $(echo ${package} |grep "qt-x11") ];then
            if [ ! -e ${INSTALL_DIR}/media/qt-x11 ];then
                cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/qt-x11 ${INSTALL_DIR}/media/
            fi
        fi
        if [ $(echo ${package} |grep "qt-creator") ];then
            if [ ! -e ${INSTALL_DIR}/media/qt-x11 ];then
                cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/qt-x11 ${INSTALL_DIR}/media/
            fi
        fi
        if [ $(echo ${package} |grep "qt-fb") ];then
            cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/qt-fb ${INSTALL_DIR}/media/
            cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/tslib ${INSTALL_DIR}/media/

            #cp -xarf /cdrom/advantech/bin/pointercal ${INSTALL_DIR}/etc/
        fi
    fi
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/x11vnc ${INSTALL_DIR}/media/
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/overlayroot ${INSTALL_DIR}/media/
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/blueman ${INSTALL_DIR}/media/
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/udiskUpgrade/* ${INSTALL_DIR}/media/
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/mtools/* ${INSTALL_DIR}/media/
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/networkmanager/* ${INSTALL_DIR}/media/
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/peripheral/generic/eGalaxMonitorMapping* ${INSTALL_DIR}/media/
    cp -xarf ${PACKAGE_DIR}/ubuntu-deb-packages/x86_32/peripheral/generic/eGTouch* ${INSTALL_DIR}/media/
    sync
    sync
    
}

copy_file()
{
	Adspname -p | grep TPC-300-R

	if [ $? -eq 0 ]; then
		cp -xarf ${TAR_PACKAGE_DIR}/TPC-300-R-Series/* ${INSTALL_DIR}/usr/src/advantech/
		sync
	fi

        cp -xarf ${DRIVERS_DIR}/advec.tar.gz ${INSTALL_DIR}/usr/src/advantech/

        if [ "${PRODUCT_NAME}"x = "UNO-420"x ]; then

                cp -xarf ${TAR_PACKAGE_DIR}/advad5593r/ACPI_Table/adv_gpio_dsdt.cpio ${INSTALL_DIR}/boot/

                cp -xarf ${TAR_PACKAGE_DIR}/UNO-420/advad5593r ${INSTALL_DIR}/usr/src/advantech/
                cp -xarf ${TAR_PACKAGE_DIR}/UNO-420/advad5593r/ad5593r.service ${INSTALL_DIR}/lib/systemd/system/
                cp -xarf ${TAR_PACKAGE_DIR}/UNO-420/advad5593r/drivers/ad5592r-base.ko ${INSTALL_DIR}/lib/modules/4.15.0-43-generic/kernel/drivers/iio/dac/
                cp -xarf ${TAR_PACKAGE_DIR}/UNO-420/advad5593r/drivers/ad5593r.ko ${INSTALL_DIR}/lib/modules/4.15.0-43-generic/kernel/drivers/iio/dac/
                ln -s ${INSTALL_DIR}/lib/systemd/system/ad5593r.service ${INSTALL_DIR}/etc/systemd/system/sysinit.target.wants/
                sync

        elif [ "${PRODUCT_NAME}"x = "UNO-247"x ]; then
                cp -xarf ${TAR_PACKAGE_DIR}/UNO-247/advwdt/ ${INSTALL_DIR}/usr/src/advantech/
                rm -rf ${INSTALL_DIR}/usr/src/advantech/advec.tar.gz
                sync

        elif [ "${PRODUCT_NAME}"x = "ECU-4784"x ]; then
                cp -xarf ${TAR_PACKAGE_DIR}/ECU-4784/* ${INSTALL_DIR}/usr/src/advantech/
                cp -xarf ${PROFILE_DIR}/ECU-4784/rc.local ${INSTALL_DIR}/etc/
                sync

        elif [ "${PRODUCT_NAME}"x = "UNO-137-E1"x ]; then
                cp -xarf ${TAR_PACKAGE_DIR}/UNO-137-E1/* ${INSTALL_DIR}/usr/src/advantech/
                sync

        elif [ "${PRODUCT_NAME}"x = "TPC-2181WP-533AE"x ]; then
                cp -xarf ${TAR_PACKAGE_DIR}/TPC-2181WP-533AE/LED_F75111R.tar.gz ${INSTALL_DIR}/usr/src/advantech/
                cp -xarf ${TAR_PACKAGE_DIR}/TPC-2181WP-533AE/script.tar.gz ${INSTALL_DIR}/usr/src/advantech/
                cp -xarf ${TAR_PACKAGE_DIR}/TPC-2181WP-533AE/rtl8822b_bt/btrtl.ko ${INSTALL_DIR}/lib/modules/4.15.0-43-generic/kernel/drivers/bluetooth/
                cp -xarf ${TAR_PACKAGE_DIR}/TPC-2181WP-533AE/rtl8822b_bt/rtl8822b_* ${INSTALL_DIR}/lib/firmware/rtl_bt/
                cp -xarf ${PROFILE_DIR}/TPC-2181WP-533AE/obex-dbus.conf ${INSTALL_DIR}/etc/dbus-1/system.d/
                #echo export DBUS_SESSION_BUS_ADDRESS="unix:path=/var/run/dbus/system_bus_socket" >> ${INSTALL_DIR}/root/.bashrc
                sync

        fi
}

#copy_adv_driver
#copy_package
#copy_idoor
copy_file

cp -xf ${LOG_FILE} ${INSTALL_DIR}
sync
