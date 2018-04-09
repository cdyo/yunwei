#!/bin/bash
BEK_HOME=/opt/bek
for host in kafka01 kafka02 kafka03
	do echo "-------$host service---------" ;
	ssh $host "source $BEK_HOME/conf/bek_env;jps"
done
#ÐÞ¸Ä²âÊÔgithub