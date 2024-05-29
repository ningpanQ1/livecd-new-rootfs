#!/bin/bash

raid_size=0
raid_dev=`dmraid -s | grep name | awk '{print $NF}'`
cmdline=`lsblk -d -o name,size | sed '/NAME\|loop/d' | sed '/G$/!d'`
cmdline_cnt=`lsblk -d -o name,size | sed '/NAME\|loop/d' | sed '/G$/!d' | wc -l`

enabled_node_list=""
nudisk_cnt=0
nerrsize_cnt=0
nerrdisk_cnt=0

get_enabled_node()
{
echo "${cmdline}" | (while read -r i
do
        node=`echo "${i}" | awk '{print $1}'`
	model=`udevadm info -q symlink -n ${node} | awk 'BEGIN{FS="/|_"}{print $3}'`
	MODEL=`echo ${model} | sed 's/[a-z]/\u&/g'`
	capacity=`echo "${i}" | awk '{print $2}'`
        size_temp=`echo "${i}" | awk '{print $2}'| sed 's/G//g'`
    
        if [[ ${size_temp} =~ ^[0-9]*$ ]];then
                size=${size_temp}
        else
                size=`echo "${size_temp}" | awk -F '.' '{print $1}'`
        fi

        if (( ${size} >= 20 ));then
    
                if [[ "${node}" =~ "nvme" ]];then
                        if [ "$enabled_node_list" != "" ];then
                                enabled_node_list+=",/dev/${node} - ${capacity} ${MODEL}"
                        else
                                enabled_node_list+="/dev/${node} - ${capacity} ${MODEL}"
                        fi
                elif [[ "${node}" =~ "mmc" ]];then
                        if [ "$enabled_node_list" != "" ];then
                                enabled_node_list+=",/dev/${node} - ${capacity} ${MODEL}"
                        else
                                enabled_node_list+="/dev/${node} - ${capacity} ${MODEL}"
                        fi
                elif [[ "${node}" =~ "sd" ]];then
                        isudisktmp=`cat /sys/block/${node}/removable`
                        if [ ${isudisktmp} -eq 0 ];then
                                if [ "$enabled_node_list" != "" ];then
                                        enabled_node_list+=",/dev/${node} - ${capacity} ${MODEL}"
                                else
                                        enabled_node_list+="/dev/${node} - ${capacity} ${MODEL}"
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

	get_enabled_node

else

        get_enabled_raid_node

fi
