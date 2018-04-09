#/bin/bash
base_bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
host_dir=$base_bin/conf
service_log_dir=$base_bin/../logs
source $base_bin/../conf/bek_env
#加载环境变量
source $base_bin/conf/bek_function.sh
#加载函数

function print_usage(){
  echo "Usage: <command1> <commond2> [<command3>]"
  echo "local                   Start or stop localhost services"
  echo "cluster                 Start or stop cluster services"
  echo "schema	                Get schema related information"
  echo "topic                   Get topic related information"
}

function print_local(){
  echo "Usage: <command1> <commond2> [<command3>]"
  echo "start/stop zk       	Start or stop localhost zookeeper service"
  echo "start/stop kafka        Start or stop localhost kafka service"
  echo "start/stop rest         Start or stop localhost kafka-rest service"
  echo "start/stop schema       Start or stop localhost kafka-schema-registry service"	
  echo "start/stop connect      Start or stop localhost kafka-connect-distributed service"
}

function print_cluster(){
  echo "Usage: <command1> <commond2> [<command3>]"
  echo "start/stop zk           Start or stop cluster zookeeper service"
  echo "start/stop kafka        Start or stop cluster kafka service"
  echo "start/stop rest         Start or stop cluster kafka-rest service"
  echo "start/stop schema       Start or stop cluster kafka-schema-registry service"
  echo "start/stop connect      Start or stop cluster kafka-connect-distributed service"
  echo "start/stop all          Start or stop cluster all services"
}

function print_schema(){
  echo "Usage: <command1> <commond2> [<command3>]"
  echo "list           		List all subjects"
  echo "desc        		According to subject name get schema information"
  echo "id        	        According to ids get schema information"
  echo "conf                    Get configuration"
}

function print_topic(){
  echo "Usage: <command1> <commond2> [<command3>]"
  echo "list                    List all topics"
  echo "desc                    Get topic information"
}

if [ $# = 0 ]; then
  print_usage
  exit
fi

if [ $# = 1 ]; then
case $1 in
    local)
        print_local
	exit
        ;;
    cluster)
        print_cluster
	exit
        ;;
    schema)
        print_schema
	exit
        ;;
    topic)
        print_topic
        exit
        ;;
    *)
        echo "$1:command not found!"
	exit
        ;;
esac
fi
###########################################################################
commond1=$1
commond2=$2
commond3=$3
commond4=$4

case $commond1 in
  local)
    case $commond2 in
      start)
        case $commond3 in
          zk)
            start_zookeeper_v2 $commond4
            ;;
          kafka)
            start_kafka_v2 $commond4
            ;;
          rest)
            start_kafka_rest_v2 $commond4
            ;;
          schema)
            start_schema_registry_v2 $commond4
            ;;
          connect)
            start_connect_distributed_v2 $commond4
            ;;
          *)
            echo "$commond3:command not found!"
            ;;
        esac
        ;;
      stop)
        case $commond3 in
          zk)
            stop_zookeeper_v2 $commond4
            ;;
          kafka)
            stop_kafka_v2 $commond4
            ;;
          rest)
            stop_kafka_rest_v2 $commond4
            ;;
          schema)
            stop_schema_registry_v2 $commond4
            ;;
          connect)
            stop_connect_distributed_v2 $commond4
            ;;
          *)
            echo "$commond3:command not found!"
            ;;
        esac
        ;;
      *)  
      echo "$commond2:command not found!"
      ;;
    esac
    ;;
  cluster)
    case $commond2 in
      start)
        case $commond3 in
          zk)
            start_zookeepers
            ;;
          kafka)
            start_kafkas
            ;;
          rest)
            start_kafka_rests
            ;;
          schema)
            start_schema_registrys
            ;;
          connect)
            start_connect_distributeds
            ;;
          all)
            start_zookeepers
            start_kafkas
            start_kafka_rests
            start_schema_registrys
            start_connect_distributeds
            ;;
          *)
            echo "$commond3:command not found!"
            ;;
        esac
        ;;
      stop)
        case $commond3 in
          zk)
            stop_zookeepers
            ;;
          kafka)
            stop_kafkas
            ;;
          rest)
            stop_kafka_rests
            ;;
          schema)
            stop_schema_registrys
            ;;
          connect)
            stop_connect_distributeds
            ;;
          all)
            stop_connect_distributeds
            stop_schema_registrys
            stop_kafka_rests
            stop_kafkas
            stop_zookeepers
            ;;
          *)
            echo "$commond3:command not found!"
            ;;
        esac
        ;;
      *)
      echo "$commond2:command not found!"
      ;;
    esac
    ;;
  schema)
    case $commond2 in
      list)
        get_subjects
        ;;
      desc)
        get_schema_desc
        ;;
      id)
        get_schema_ids
        ;;
      conf)
        get_schema_conf
        ;;
      *)
        echo "$commond2:command not found!"
        ;;
    esac
    ;;
  topic)
    case $commond2 in
      list)
        get_topics
        ;;
      desc)
        get_topic_desc
        ;;
      *)
        echo "$commond2:command not found!"
        ;;
    esac
    ;;
  *)  
    echo "$1:command not found!"
    ;;
esac
