#!/bin/bash
webSiteHome=/home/pi/hinst_static_website
if [ "$1" = "start" ]
then
	cd "$webSiteHome"
	nohup hugo --watch --source="$webSiteHome" >hugo.log 2>hugo.error.log &
	echo $! > hugo.pid
fi
if [ "$1" == "stop" ]
then
	cd "$webSiteHome"
	pid=$(<hugo.pid)
	kill $pid
fi


