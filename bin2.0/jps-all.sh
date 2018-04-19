#!/bin/bash
base_bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

hosts=`cat $base_bin/conf/beh_service.ini|cut -d':' -f1`
for host in $hosts
	do	echo "-----$host---";ssh $host "source /opt/beh/conf/beh_env;jps"
done
