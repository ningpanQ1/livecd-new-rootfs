#!/bin/bash

dev=$1
disk=`echo "$dev" | awk -F '/' '{print $NF}'`

raid_size=0
raid_dev=`dmraid -s | grep name | awk '{print $NF}'`
cmdlist=`lsblk -d -o name,size | sed '/NAME\|loop/d' | sed '/G$/!d'`
cmdline_cnt=`lsblk -d -o name,size | sed '/NAME\|loop/d' | sed '/G$/!d' | wc -l`
cmdline=`lsblk -d -o name,size | sed '/NAME\|loop/d' | sed '/G$/!d' | grep ${disk}`

enabled_node_list=""
nudisk_cnt=0
nerrsize_cnt=0
nerrdisk_cnt=0

get_enabled_node()
{
echo "${cmdlist}" | (while read -r i
do
        node=`echo "${i}" | awk '{print $1}'`
        size_temp=`echo "${i}" | awk '{print $2}'| sed 's/G//g'`
    
        if [[ ${size_temp} =~ ^[0-9]*$ ]];then
                size=${size_temp}
        else
                size=`echo "${size_temp}" | awk -F '.' '{print $1}'`
        fi

        if (( ${size} >= 20 ));then
    
                if [[ "${node}" =~ "nvme" ]];then
                        if [ "$enabled_node_list" != "" ];then
                                enabled_node_list+=" or /dev/${node}"
                        else
                                enabled_node_list+="/dev/${node}"
                        fi
                elif [[ "${node}" =~ "mmc" ]];then
                        if [ "$enabled_node_list" != "" ];then
                                enabled_node_list+=" or /dev/${node}"
                        else
                                enabled_node_list+="/dev/${node}"
                        fi
                elif [[ "${node}" =~ "sd" ]];then
                        isudisktmp=`cat /sys/block/${node}/removable`
                        if [ ${isudisktmp} -eq 0 ];then
                                if [ "$enabled_node_list" != "" ];then
                                        enabled_node_list+=" or /dev/${node}"
                                else
                                        enabled_node_list+="/dev/${node}"
                                fi
                        else
                                let nudisk_cnt+=1
                        fi
                else
                        let nerrdisk_cnt+=1
                fi
                
        else
                if [[ "${node}" =~ "nvme" ]];then
                        let nerrsize_cnt+=1
                elif [[ "${node}" =~ "mmc" ]];then
                        let nerrsize_cnt+=1
                elif [[ "${node}" =~ "sd" ]];then
            
                        isudisktemp=`cat /sys/block/${node}/removable`
                    
                        if [ ${isudisktemp} -eq 0 ];then
                                let nerrsize_cnt+=1
                        else
                                let nudisk_cnt+=1
                        fi
                else
                        let nerrdisk_cnt+=1
                fi
        fi
done

let errnode_cnt=${nerrdisk_cnt}+${nudisk_cnt}
let errsize_cnt=${nerrsize_cnt}+${nudisk_cnt}

if [[ ${errnode_cnt} -eq ${cmdline_cnt} ]];then
        echo "NODE_ERR"
elif [[ ${errsize_cnt} -eq ${cmdline_cnt} ]];then
        echo "SIZE_ERR"
else
        echo "${enabled_node_list}"
fi
)
}

get_enabled_raid_node()
{
    size_temp=`lsblk | grep ${raid_dev} | head -n 1 | awk '{print $4}' | sed 's/G//g'`
    
    if [[ ${size_temp} =~ ^[0-9]*$ ]];then
        raid_size=${size_temp}
    else
        raid_size=`echo "${size_temp}" | awk -F '.' '{print $1}'`
    fi
    
    if (( ${raid_size} >= 20 ));then
    
        echo "/dev/mapper/${raid_dev}"
    
    else

        echo "SIZE_ERR"
    
    fi
}

if [ "${raid_dev}"x = x ]; then

    if [ "${cmdline}"x = x ]; then

        if [ "`get_enabled_node`"x = "NODE_ERR"x ]; then
                echo "No disk is available!\nplease confirm whether the device has EMMC/NVME/SATA/ type disk!$"
        elif [ "`get_enabled_node`"x = "SIZE_ERR"x ]; then
                echo "Insufficient storage space, at least 20G!$"
        else
                echo -e "The device you entered is not exist!\nplease modify autoinstall.xml, and choose `get_enabled_node`$"
        fi

    else

        if [ "${disk}"x = "nvme0n1"x ] || [ "${disk}"x = "mmcblk0"x ] || [[ "${disk}" = sd[a-z] ]];then
        
                isudisk=`cat /sys/block/${disk}/removable`
                
                if [ ${isudisk} -eq 0 ];then
                
                        size_temp=`echo "${cmdline}" | awk '{print $2}'| sed 's/G//g'`
        
                        if [[ ${size_temp} =~ ^[0-9]*$ ]];then
                                size=${size_temp}
                        else
                                size=`echo "${size_temp}" | awk -F '.' '{print $1}'`
                        fi
                        
                        if (( ${size} < 20 ));then
                                echo -e "Insufficient storage space, at least 20G!$"
                        else
                                echo "OK$"
                        fi
                else
                
                        if [ "`get_enabled_node`"x = "NODE_ERR"x ]; then
                                echo "No disk is available!\nplease confirm whether the device has EMMC/NVME/SATA/ type disk!$"
                        elif [ "`get_enabled_node`"x = "SIZE_ERR"x ]; then
                                echo "Insufficient storage space, at least 20G!$"
                        else
                                echo -e "The device you entered is U-Disk!\nplease modify autoinstall.xml, and choose `get_enabled_node`$"
                        fi
                fi
    
        else
    
                if [ "`get_enabled_node`"x = "NODE_ERR"x ]; then
                        echo "No disk is available!\nplease confirm whether the device has EMMC/NVME/SATA/ type disk!$"
                elif [ "`get_enabled_node`"x = "SIZE_ERR"x ]; then
                        echo "Insufficient storage space, at least 20G!$"
                else
                        echo -e "The device you entered is not exist!\nplease modify autoinstall.xml, and choose `get_enabled_node`$"
                fi
        fi
    fi

else
        if [ "`get_enabled_raid_node`"x = "${dev}"x ]; then
            echo "OK$"
        elif [ "`get_enabled_raid_node`"x = "SIZE_ERR"x ]; then
            echo "Insufficient storage space, at least 20G!$"
        else
            echo -e "The device you entered is wrong!\nplease modify autoinstall.xml, and choose `get_enabled_raid_node`$"
        fi
fi
