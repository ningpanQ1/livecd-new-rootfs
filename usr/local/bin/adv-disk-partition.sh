#!/bin/bash -x

XML=$1
CMD=$2
node=$3

# check the if root?
func_check_root() {
	userid=`id -u`
	if [ $userid -ne "0" ]; then
		echo "you're not root?"
		exit -1
	fi
}
sync

#function_usage() {
#	if [ $# -ne 2 ];then
#		echo "Usage: ./adv-gpt.sh [XML] [DISK_LABEL]"
#		echo "xml:"
#		echo " autoinstall.xml"
#		echo "disk_label:"
#		echo " msdos|gpt"
#		echo "Example: ./adv-gpt.sh autoinstall.xml"
#		exit -1
#	fi
#}

func_checkcommand()
{
	if [ ${CMD} != 'msdos' ] && [ ${CMD} != 'gpt' ]; then
	    echo "Error: The CMD is not MBR/GPT, please input correct CMD"
		exit -1
	fi
}

func_check_swap()
{
        swap_dev=`swapon -s | sed '/Filename/d' | awk '{print $1}'`

        if [ "$swap_dev"x = x ]; then
                echo "No swap patition!"
        else
                swapoff $swap_dev
        fi
}

func_partition()
{
	#node=`cat $XML |sed 's/ /\n/g'|grep device |sed 's/=/\n/g' |sed '1d' |sed 's/"//g'`
	if [ "`ls $node`" != "$node" ]; then
		echo "Error: There is not $node device"
		exit -1
 	fi
	line=`cat $XML |sed 's/ /\n/g'|grep part |wc -l`
	i=1
	old=1
	newsize=0
	/sbin/parted -s $node -- mklabel $CMD
	while [ $i -le $line ]
	do	
		size=`cat $XML|grep part |sed -n "$i"p|sed 's/ /\n/g'|grep size|sed 's/=/\n/g'|sed '1d'|sed 's/"//g'`
		fstype=`cat $XML|grep part|sed -n "$i"p|sed 's/ /\n/g'|grep fstype|sed 's/=/\n/g'|sed '1d'|sed 's/"//g'`
		mountpoint=`cat $XML|grep part|sed -n "$i"p|sed 's/ /\n/g'|grep mountpoint|sed 's/=/\n/g'|sed '1d'|sed 's/"//g'`
		partype=`cat $XML |grep part |sed -n "$i"p |sed 's/ /\n/g'|grep type |sed 's/=/\n/g' |sed 's/"//g'|sed 's/>//g' |sed 's/\///g' |sed '$!D'`
		
		let "newsize = $newsize + $size"
		if [ $i -eq $line ]; then
			if [ $size == 0 ]; then
				/sbin/parted -s $node -- mkpart $partype $old -1
				break
			else
				/sbin/parted -s $node -- mkpart $partype $old $newsize
				break
			fi
		fi
		/sbin/parted -s $node -- mkpart $partype $old $newsize
		let "old = $newsize + 0"
		let "i = $i + 1"
	done
}

### ---------- Main ---------- ###

func_check_root

### 1. Check the input variable
#if [ $# -ne 2 ]; then
#    function_usage
#fi

### 2. Check the input disk label command
func_checkcommand
func_check_swap
func_partition
