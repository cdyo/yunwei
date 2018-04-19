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

