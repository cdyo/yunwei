#!/bin/bash
BEK_HOME=/opt/bek
BASE_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASE_HOME/../conf/bek_env

for v_host in `cat $BASE_HOME/conf/bek_service.ini | awk -F ':' '{print $1}'`
do 
  echo $v_host"----------------"
  v_ping_c=`ping -i 1 -c 3 $v_host |grep -i unreach |wc -l`
  #网络检查
  if [ $v_ping_c -eq 3 ]
  then 
    echo $v_host"_network_error"
  else
    v_conf_num=`cat $BASE_HOME/conf/bek_service.ini| grep $v_host | awk -F ':' '{print $2}'|awk -F ',' '{print NF}'`
    v_conf_serv_grep_e=`cat $BASE_HOME/conf/bek_service.ini| grep $v_host | awk -F ':' '{print $2}' | sed 's/,/ -e /g'`
    v_now_serv_c=`ssh $v_host "source $BASE_HOME/../conf/bek_env;jps | grep -e $v_conf_serv_grep_e |wc -l"`

    if [ $v_now_serv_c -eq $v_conf_num ]
      then
        echo $v_host"_service_enough"
      else 
        echo $v_host"_service_miss" 
	
	v_conf_serv1=`cat $BASE_HOME/conf/bek_service.ini| grep $v_host | awk -F ':' '{print $2}'|sed 's/,/\n/g'|sort`
        v_now_serv_c1=`ssh $v_host $JAVA_HOME/bin/jps | grep -e $v_conf_serv_grep_e|awk '{print $2}'|sort`
	
	for v_service in $v_conf_serv1
        do 
          v_server_now=`echo $v_now_serv_c1|grep -w $v_service|wc -l`
          if [ $v_server_now -eq 1 ]
             then
               echo "1:${v_service} normal"
             else
               echo "0:${v_service} lost"
	       case $v_service in  
	         QuorumPeerMain)
        	 echo "Start $v_service loading-----------"  
        	 ssh $v_host "source $BEK_HOME/conf/bek_env;zkServer.sh start"
        	 ;;  
    		 Kafka)  
        	 echo "Start $v_service loading-----------" 
                 ssh $v_host "source $BEK_HOME/conf/bek_env;kafka-server-start.sh $KAFKA_HOME/config/server.properties  >/dev/null 2>&1  &" 
        	 ;; 
    		 KafkaRestMain)
        	 echo "Start $v_service loading-----------"
        	 ssh $v_host "source $BEK_HOME/conf/bek_env;kafka-rest-start $KAFKA_REST_HOME/etc/kafka-rest/kafka-rest.properties >/dev/null 2>&1 &"
        	 ;;  
    		 SchemaRegistryMain)  
        	 echo "Start $v_service loading-----------"
                 ssh $v_host "source $BEK_HOME/conf/bek_env;schema-registry-start $KAFKA_SCHEMA_HOME/etc/schema-registry/schema-registry.properties >/dev/null 2>&1  &"
        	 ;; 
		 ConnectDistributed)
                 echo "Start $v_service loading-----------"
                 ssh $v_host "source $BEK_HOME/conf/bek_env;connect-distributed.sh $KAFKA_HOME/config/connect-distributed.properties >/dev/null 2>&1  &"
                 ;; 
    		 *)  
        	 echo "$service_name:service name Error"
        	 ;;  
    	       esac
	
	  fi
	done
    fi
  fi
done



