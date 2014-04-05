#!/bin/bash
b=(`/sbin/ifconfig wlan0 | /bin/grep inet | /bin/grep -v grep`)
if [ ! "$b" ]; then
	/sbin/iwconfig wlan0 essid EEEEEESSSSIIIIIIDDDDDDDD
	/sbin/dhclient wlan0
fi
