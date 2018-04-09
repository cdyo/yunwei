#!/bin/bash
BEK_HOME=/opt/bek
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
host_dir=$BASE_DIR/../conf
schema_port=8081
rest_port=8082
source $BASE_DIR/../../conf/bek_env

zookeeper_host=`cat $host_dir/bek_service.ini|grep -w QuorumPeerMain|cut -d':' -f1`
kafka_host=`cat $host_dir/bek_service.ini|grep -w Kafka|cut -d':' -f1`
schema_host=`cat $host_dir/bek_service.ini|grep -w SchemaRegistryMain|cut -d':' -f1`
rest_host=`cat $host_dir/bek_service.ini|grep -w KafkaRestMain|cut -d':' -f1`
connect_host=`cat $host_dir/bek_service.ini|grep -w ConnectDistributed|cut -d':' -f1`

#echo zookeeper_host: $zookeeper_host
#echo kafka_host: $kafka_host
#echo schema_host: $schema_host
#echo rest_host: $rest_host
#echo connect_host: $connect_host
###############################启动本地服务##########################################
start_service() {
    local service="${1}"
    local start_command="${2}"
    local start_properties="${3}"
    local service_log_dir="$BASE_DIR/../../logs/$servic"
    echo "Starting ${service}"
    # TODO: decide whether to persist logs on stdout / stderr between runs.
    ${start_command} "${start_properties}" \
        2> "${service_log_dir}/${service}.stderr" \
        1> "${service_log_dir}/${service}.stdout" &
        sleep 5 
}

start_zookeeper() {
    commond_bin=$ZOOKEEPER_HOME/bin
    start_service "zookeeper" "${commond_bin}/zkServer.sh" "start" 
}

start_kafka() {
    local commond_bin=$KAFKA_HOME/bin
    start_service "kafka" "${commond_bin}/kafka-server-start.sh" "$KAFKA_HOME/config/server.properties"
}

start_schema_registry() {
    local commond_bin=$KAFKA_SCHEMA_HOME/bin
    start_service "kafka-schema-registry" "${commond_bin}/schema-registry-start" "$KAFKA_SCHEMA_HOME/etc/schema-registry/schema-registry.properties"
}

start_kafka_rest() {
    local commond_bin=$KAFKA_REST_HOME/bin
    start_service "kafka-rest" "${commond_bin}/kafka-rest-start" "$KAFKA_REST_HOME/etc/kafka-rest/kafka-rest.properties"
}

start_connect_distributed() {
    local commond_bin=$KAFKA_HOME/bin
    start_service "connect-distributed" "${commond_bin}/connect-distributed.sh" "$KAFKA_HOME/config/connect-distributed.properties"
}
#############################远程启动服务#################################
start_zookeeper_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;start_zookeeper
  else
      if echo $zookeeper_host|grep -qw $host ; then 
        ssh $host "source $host_dir/bek_function.sh;start_zookeeper"
      else
        echo "host:$host not include service zookeeper"
      fi
  fi
}

start_kafka_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;start_kafka
  else
      if echo $kafka_host|grep -qw $host ; then
        ssh $host "source $host_dir/bek_function.sh;start_kafka"
      else
        echo "$host not include service kafka"
      fi
  fi
}

start_schema_registry_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;start_schema_registry
  else
      if echo $schema_host|grep -qw $host ; then
        ssh $host "source $host_dir/bek_function.sh;start_schema_registry"
      else
        echo "$host not include service schema_registry"
      fi
  fi
}

start_kafka_rest_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;start_kafka_rest
  else
      if echo $rest_host|grep -qw $host ; then
        ssh $host "source $host_dir/bek_function.sh;start_kafka_rest"
      else
        echo "$host not include service kafka_rest"
      fi
  fi
}

start_connect_distributed_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;start_connect_distributed
  else
      if echo $connect_host|grep -qw $host ; then
        ssh $host "source $host_dir/bek_function.sh;start_connect_distributed"
      else
        echo "$host not include service connect_distributed"
      fi
  fi
}

#############################停止本地服务#################################
stop_zookeeper(){
  echo "Stop zookeeper loading-----------"
  zkServer.sh stop
}

stop_kafka(){
  echo "Stop kafka loading-----------"
  PID=`ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}'`
  kill -9 $PID
}

stop_kafka_rest(){
  echo "Stop kafka-rest loading-----------"
  kafka-rest-stop
}

stop_schema_registry(){
  echo "Stop kafka-schema-registry loading-----------"
  schema-registry-stop
}

stop_connect_distributed(){
  echo "Stop kafka-connect-distributed loading-----------"
  PID=`jps |grep -i ConnectDistributed|awk '{print $1}'`
  kill -9 $PID
}

#############################启动集群服务#################################
start_zookeepers() {
for host in $zookeeper_host
  do ssh $host "source $host_dir/bek_function.sh;start_zookeeper"
done
}

start_kafkas() {
for host in $kafka_host
  do ssh $host "source $host_dir/bek_function.sh;start_kafka"
done
}

start_schema_registrys() {
for host in $schema_host
  do ssh $host "source $host_dir/bek_function.sh;start_schema_registry"
done
}

start_kafka_rests() {
for host in $rest_host
  do ssh $host "source $host_dir/bek_function.sh;start_kafka_rest"
done
}

start_connect_distributeds() {
for host in $connect_host
  do ssh $host "source $host_dir/bek_function.sh;start_connect_distributed"
done
}
#############################远程关闭服务#################################
stop_zookeeper_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;stop_zookeeper
  else
      if echo $zookeeper_host|grep -qw $host ; then 
        ssh $host "source $host_dir/bek_function.sh;stop_zookeeper"
      else
        echo "host:$host not include service zookeeper"
      fi
  fi
}

stop_kafka_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;stop_kafka
  else
      if echo $kafka_host|grep -qw $host ; then
        ssh $host "source $host_dir/bek_function.sh;stop_kafka"
      else
        echo "host:$host not include service kafka"
      fi
  fi
}

stop_schema_registry_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;stop_schema_registry
  else
      if echo $schema_host|grep -qw $host ; then
        ssh $host "source $host_dir/bek_function.sh;stop_schema_registry"
      else
        echo "host:$host not include service schema_registry"
      fi
  fi
}

stop_kafka_rest_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;stop_kafka_rest
  else
      if echo $rest_host|grep -qw $host ; then
        ssh $host "source $host_dir/bek_function.sh;stop_kafka_rest"
      else
        echo "host:$host not include service kafka_rest"
      fi
  fi
}

stop_connect_distributed_v2() {
  local host=$1
  if [ -z $host ]; then
    source $host_dir/bek_function.sh;stop_connect_distributed
  else
      if echo $connect_host|grep -qw $host ; then
        ssh $host "source $host_dir/bek_function.sh;stop_connect_distributed"
      else
        echo "host:$host not include service connect_distributed"
      fi
  fi
}

#############################停止集群服务#################################
stop_zookeepers() {
for host in  $zookeeper_host
  do ssh $host "source $host_dir/bek_function.sh;stop_zookeeper"
done
}

stop_kafkas() {
for host in $kafka_host
  do ssh $host "source $host_dir/bek_function.sh;stop_kafka"
done
}

stop_schema_registrys() {
for host in  $schema_host
  do ssh $host "source $host_dir/bek_function.sh;stop_schema_registry"
done
}

stop_kafka_rests() {
for host in  $rest_host
  do ssh $host "source $host_dir/bek_function.sh;stop_kafka_rest"
done
}

stop_connect_distributeds() {
for host in $connect_host
  do ssh $host "source $host_dir/bek_function.sh;stop_connect_distributed"
done
}

#########################获取schema信息#################################
get_subjects(){
curl -X GET http://$schema_host:$schema_port/subjects
echo
}

get_schema_desc(){
read -t 60 -p "Enter schema name:" schema
read -t 60 -p "Enter version[Default latest]:" version
if [ -z $version ] ; then
  version=latest
fi
curl -X GET http://$schema_host:$schema_port/subjects/$schema/versions/$version
echo
}

get_schema_ids(){
read -t 60 -p "Enter schema ids:" ids
curl -X GET http://$schema_host:$schema_port/schemas/ids/$ids
echo
}

get_schema_conf(){
curl -X GET http://$schema_host:$schema_port/config
echo
}

#########################获取topic信息#################################
get_topics(){
curl "http://$rest_host:$rest_port/topics"
echo
}

get_topic_desc(){
read -t 60 -p "Enter topic name:" topic
read -t 60 -p "partitions(y/n):" flag
if [ x$flag == "xn" ] ;then
  curl "http://$rest_host:$rest_port/topics/$topic"
  echo
else
  curl "http://$rest_host:$rest_port/topics/$topic/partitions"
  echo
fi
}


