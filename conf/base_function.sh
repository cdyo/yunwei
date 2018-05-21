#!/bin/bash
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASE_DIR/all_env

##############################################################################################
#function for start daemon service
start_QuorumPeerMain(){
	zkServer.sh start
}

start_NameNode(){
	hadoop-daemon.sh start namenode
}

start_DataNode(){
	hadoop-daemon.sh start datanode
}

start_ResourceManager(){
	yarn-daemon.sh start resourcemanager
}

start_NodeManager(){
	yarn-daemon.sh start nodemanager
}

start_JournalNode(){
	hadoop-daemon.sh start journalnode
}

start_DFSZKFailoverController(){
	hadoop-daemon.sh start zkfc
}

start_ApplicationHistoryServer(){
	yarn-daemon.sh start timelineserver
}

start_JobHistoryServer(){
	mr-jobhistory-daemon.sh start historyserver
}

start_HMaster(){
	hbase-daemon.sh start master
}

start_HRegionServer(){
	hbase-daemon.sh start regionserver
}

start_Kafka(){
	nohup kafka-server-start.sh $KAFKA_HOME/config/server.properties 1>$KAFKA_LOG_DIR/stdout 2>$KAFKA_LOG_DIR/stderr &
}

start_redis(){
       	redis-server  $REDIS_HOME/conf/redis.conf
}


start_Kafka_rest(){
	nohup kafka-rest-start $KAFKA_REST_HOME/etc/kafka-rest/kafka-rest.properties 1>$KAFKA_REST_LOG_DIR/stdout 2>$KAFKA_REST_LOG_DIR/stderr &
}

start_Kafka_schema(){
        nohup schema-registry-start  $KAFKA_SCHEMA_HOME/etc/schema-registry/schema-registry.properties 1>$KAFKA_SCHEMA_LOG_DIR/stdout 2>$KAFKA_SCHEMA_LOG_DIR/stderr &
}

start_nimbus(){
	nohup storm nimbus 1>$STORM_LOG_DIR/nimbus_stdout 2>$STORM_LOG_DIR/nimbus_stderr &
}

start_supervisor(){
        nohup storm supervisor 1>$STORM_LOG_DIR/supervisor_stdout 2>$STORM_LOG_DIR/supervisor_stderr &
}

start_logviewer(){
        nohup storm logviewer 1>$STORM_LOG_DIR/logviewer_stdout 2>$STORM_LOG_DIR/logviewer_stderr &
}

start_ui(){
        nohup storm ui 1>$STORM_LOG_DIR/ui_stdout 2>$STORM_LOG_DIR/ui_stderr &
}

#################################################################################
#function for stop daemon service
stop_QuorumPeerMain(){
        zkServer.sh stop
}

stop_NameNode(){
        hadoop-daemon.sh stop namenode
}

stop_DataNode(){
        hadoop-daemon.sh stop datanode
}
        
stop_ResourceManager(){
        yarn-daemon.sh stop resourcemanager
}
        
stop_NodeManager(){
        yarn-daemon.sh stop nodemanager
}
        
stop_JournalNode(){
        hadoop-daemon.sh stop journalnode
}
        
stop_DFSZKFailoverController(){
        hadoop-daemon.sh stop zkfc
}
        
stop_ApplicationHistoryServer(){
        yarn-daemon.sh stop timelineserver
}
        
stop_JobHistoryServer(){
        mr-jobhistory-daemon.sh stop historyserver
}
        
stop_HMaster(){
        hbase-daemon.sh stop master
}

stop_HRegionServer(){
        hbase-daemon.sh stop regionserver
}

stop_Kafka(){
        nohup kafka-server-stop.sh $KAFKA_HOME/config/server.properties 2> $KAFKA_LOG_DIR/stderr 1> $KAFKA_LOG_DIR/stdout &
}

stop_redis(){
        redis-cli -h `hostname` -p 6379 shutdown
}

stop_Kafka_rest(){
        nohup kafka-rest-stop $KAFKA_REST_HOME/etc/kafka-rest/kafka-rest.properties 1>$KAFKA_REST_LOG_DIR/stdout 2>$KAFKA_REST_LOG_DIR/stderr &
}

stop_Kafka_schema(){
        nohup schema-registry-stop  $KAFKA_SCHEMA_HOME/etc/schema-registry/schema-registry.properties 1>$KAFKA_SCHEMA_LOG_DIR/stdout 2>$KAFKA_SCHEMA_LOG_DIR/stderr &
}

stop_nimbus(){
        pid=`ps ax | grep -i nimbus | grep java | grep -v grep | awk '{print $1}'`
	if [ -z "$pid" ]; then 
		echo "$TEXT"" not exist"
	else
		echo $pid | xargs kill -SIGTERM
	fi
}

stop_supervisor(){
        pid=`ps ax | grep -i supervisor | grep java | grep -v grep | awk '{print $1}'`
        if [ -z "$pid" ]; then 
                echo "$TEXT"" not exist"
	else
		echo $pid | xargs kill -SIGTERM
        fi
}

stop_logviewer(){
        pid=`ps ax | grep -i logviewer | grep java | grep -v grep | awk '{print $1}'`
        if [ -z "$pid" ]; then
                echo "$TEXT"" not exist"
        else
                echo $pid | xargs kill -SIGTERM
        fi
}

stop_ui(){
         pid=`ps ax | grep -i ui | grep java | grep -v grep | awk '{print $1}'`
        if [ -z "$pid" ]; then
                echo "$TEXT"" not exist"
        else
                echo $pid | xargs kill -SIGTERM
        fi
}
