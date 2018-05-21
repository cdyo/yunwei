#!/bin/bash
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASE_DIR/all_env

#remote stop service

stop_QuorumPeerMain_r(){
        local host=$1
	ssh $host "source $BASE_DIR/base_function.sh;stop_QuorumPeerMain"
}

stop_NameNode_r(){
        local host=$1
	ssh $host "source $BASE_DIR/base_function.sh;stop_NameNode"
}

stop_DataNode_r(){
	local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_DataNode"
}

stop_ResourceManager_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_ResourceManager"
}

stop_NodeManager_r(){
	local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_NodeManager"
}

stop_JournalNode_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_JournalNode"
}

stop_DFSZKFailoverController_r(){
	local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_DFSZKFailoverController"
}

stop_ApplicationHistoryServer_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_ApplicationHistoryServer"
}

stop_JobHistoryServer_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_JobHistoryServer"
}

stop_HMaster_r(){
	local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_HMaster"
}

stop_HRegionServer_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_HRegionServer"
}

stop_Kafka_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_Kafka"
}

stop_redis_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_redis"
}

stop_Kafka_rest_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_Kafka_rest"
}

stop_Kafka_schema_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_Kafka_schema"
}

stop_nimbus_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_nimbus"
}


stop_supervisor_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_supervisor"
}

stop_logviewer_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_logviewer"
}

stop_ui_r(){
        local host=$1
        ssh $host "source $BASE_DIR/base_function.sh;stop_ui"
}
