#!/bin/sh
#file: adv-read-zone.sh

ZONEFILE="/usr/share/zoneinfo/zone.tab"

cat $ZONEFILE | \
 awk -F "\t" '!/#/ {
	gsub(/+/, "\t+", $2);
	gsub(/-/, "\t-", $2);
	printf("%s%s\t%s\n",$1,$2,$3) 
	}' > /tmp/zone.inf
