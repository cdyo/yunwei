#!/bin/bash
base_bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#source env
source $base_bin/conf/all_env

#source function
source $base_bin/conf/stop_cluster_function.sh
source $base_bin/conf/start_cluster_function.sh
source $base_bin/conf/start_remote_function.sh
source $base_bin/conf/stop_remote_function.sh

#usage
function print_usage(){
  echo "Usage: <command1> <commond2> [<command3>]"
  echo "start                   Start cluster services eg.hadoop hbase kafka"
  echo "stop                    stop  cluster services eg.hadoop hbase kafka"
}

if [ $# = 0 ]; then
  print_usage
  exit
fi

commond1=$1
commond2=$2

#-----------------------------------------------
case $commond1 in
    start)	
        case $commond2 in
          zk)
            start_QuorumPeerMain_c 
            ;;
          kafka)
            start_Kafka_c
            ;;
          rest)
            start_Kafka_rest_c
            ;;
          schema)
            start_Kafka_schema_c
            ;;
          storm)
            start_storm
            ;;
          hbase)
            start_hbase
            ;;
          hadoop)
            start_hadoop
            ;;
          redis)
            start_redis_c
            ;;
          hive)
            start_hive
	    ;;
          *)
            echo "$commond2:command not found!"
            ;;
	esac
	;;
    stop)
        case $commond2 in
         zk)
            stop_QuorumPeerMain_c
            ;;
          kafka)
            stop_Kafka_c
            ;;
          rest)
            stop_Kafka_rest_c
            ;;
          schema)
            stop_Kafka_schema_c
            ;;
          storm)
            stop_storm
            ;;
          hbase)
            stop_hbase
            ;;
          hadoop)
            stop_hadoop
            ;;
          hive)
            stop_hive
            ;;
          redis)
            stop_redis_c
            ;;
          *)
            echo "$commond2:command not found!"
            ;;
        esac
    ;;
    *)
    echo "$commond1:command not found!"
    ;;
esac
