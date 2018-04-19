#!/bin/bash
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASE_DIR/all_env

#remote start service

start_QuorumPeerMain_r(){
        local host=$1
	ssh $host "source $BASE_DIR/base_function.sh;start_QuorumPeerMain"
}

start_NameNode_r(){
        local host=$1
	ssh $host "source $BASE_DIR/base_function.sh;start_NameNode"
}

start_DataNode_r(){
	local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_DataNode"
}

start_ResourceManager_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_ResourceManager"
}

start_NodeManager_r(){
	local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_NodeManager"
}

start_JournalNode_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_JournalNode"
}

start_DFSZKFailoverController_r(){
	local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_DFSZKFailoverController"
}

start_ApplicationHistoryServer_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_ApplicationHistoryServer"
}

start_JobHistoryServer_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_JobHistoryServer"
}

start_HMaster_r(){
	local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_HMaster"
}

start_HRegionServer_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_HRegionServer"
}
start_Kafka_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;start_Kafka"
}
#################################################################

