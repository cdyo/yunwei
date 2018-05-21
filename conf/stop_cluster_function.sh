#!/bin/bash
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASE_DIR/all_env
source $BASE_DIR/stop_remote_function.sh

QuorumPeerMain=`cat $BASE_DIR/beh_service.ini|grep -w QuorumPeerMain|cut -d':' -f1`
NameNode=`cat $BASE_DIR/beh_service.ini|grep -w NameNode|cut -d':' -f1`
DataNode=`cat $BASE_DIR/beh_service.ini|grep -w DataNode|cut -d':' -f1`
ResourceManager=`cat $BASE_DIR/beh_service.ini|grep -w ResourceManager|cut -d':' -f1`
NodeManager=`cat $BASE_DIR/beh_service.ini|grep -w NodeManager|cut -d':' -f1`
JournalNode=`cat $BASE_DIR/beh_service.ini|grep -w JournalNode|cut -d':' -f1`
DFSZKFailoverController=`cat $BASE_DIR/beh_service.ini|grep -w DFSZKFailoverController|cut -d':' -f1`
ApplicationHistoryServer=`cat $BASE_DIR/beh_service.ini|grep -w ApplicationHistoryServer|cut -d':' -f1`
JobHistoryServer=`cat $BASE_DIR/beh_service.ini|grep -w JobHistoryServer|cut -d':' -f1`
HMaster=`cat $BASE_DIR/beh_service.ini|grep -w HMaster|cut -d':' -f1`
HRegionServer=`cat $BASE_DIR/beh_service.ini|grep -w HRegionServer|cut -d':' -f1`
Kafka=`cat $BASE_DIR/beh_service.ini|grep -w Kafka|cut -d':' -f1`
KafkaRestMain=`cat $BASE_DIR/beh_service.ini|grep -w KafkaRestMain|cut -d':' -f1`
SchemaRegistryMain=`cat $BASE_DIR/beh_service.ini|grep -w SchemaRegistryMain|cut -d':' -f1`

logviewer=`cat $BASE_DIR/beh_service.ini|grep -w logviewer|cut -d':' -f1`
nimbus=`cat $BASE_DIR/beh_service.ini|grep -w nimbus|cut -d':' -f1`
core=`cat $BASE_DIR/beh_service.ini|grep -w core|cut -d':' -f1`
Supervisor=`cat $BASE_DIR/beh_service.ini|grep -w Supervisor|cut -d':' -f1`

#echo QuorumPeerMain:$QuorumPeerMain
#echo NameNode:$NameNode
#echo DataNode:$DataNode
#echo ResourceManager:$ResourceManager
#echo NodeManager:$NodeManager
#echo JournalNode:$JournalNode
#echo DFSZKFailoverController:$DFSZKFailoverController
#echo ApplicationHistoryServer:$ApplicationHistoryServer
#echo JobHistoryServer:$JobHistoryServer
#echo HMaster:$HMaster
#echo HRegionServer:$HRegionServer
#echo Kafka:$Kafka

#remote stop service

stop_QuorumPeerMain_c(){
        for host in $QuorumPeerMain
		do stop_QuorumPeerMain_r $host
	done
}

stop_NameNode_c(){
        for host in $NameNode
                do stop_NameNode_r $host
        done
}

stop_DataNode_c(){
        for host in $DataNode
                do stop_DataNode_r $host
        done
}

stop_ResourceManager_c(){
        for host in $ResourceManager
                do stop_ResourceManager_r $host
        done
}

stop_NodeManager_c(){
        for host in $NodeManager
                do stop_NodeManager_r $host
        done
}

stop_JournalNode_c(){
        for host in $JournalNode
                do stop_JournalNode_r $host
        done
}

stop_DFSZKFailoverController_c(){
        for host in $DFSZKFailoverController
                do stop_DFSZKFailoverController_r $host
        done
}

stop_ApplicationHistoryServer_c(){
        for host in $ApplicationHistoryServer
                do stop_ApplicationHistoryServer_r $host
        done
}

stop_JobHistoryServer_c(){
        for host in $JobHistoryServer
                do stop_JobHistoryServer_r $host
        done
}

stop_HMaster_c(){
        for host in $HMaster
                do stop_HMaster_r $host
        done
}

stop_HRegionServer_c(){
        for host in $HRegionServer
                do stop_HRegionServer_r $host
        done
}

stop_Kafka_c(){
        for host in $Kafka
                do stop_Kafka_r $host
        done
}

stop_redis_c(){
        for host in $Kafka
                do stop_redis_r $host
        done
}

stop_Kafka_rest_c(){
        for host in $KafkaRestMain
                do stop_Kafka_rest_r $host
        done
}

stop_Kafka_schema_c(){
        for host in $SchemaRegistryMain
                do stop_Kafka_schema_r $host
        done
}

stop_nimbus_c(){
        for host in $nimbus
                do stop_nimbus_r $host
        done
}

stop_supervisor_c(){
        for host in $Supervisor
                do stop_supervisor_r $host
        done
}


stop_logviewer_c(){
        for host in $logviewer
                do stop_logviewer_r $host
        done
}


stop_ui_c(){
        for host in $core
                do stop_ui_r $host
        done
}

stop_hadoop(){
	stop_QuorumPeerMain_c
	stop_NameNode_c
	stop_DFSZKFailoverController_c
	stop_JournalNode_c
	stop_DataNode_c
	stop_ResourceManager_c
	stop_NodeManager_c
	stop_ApplicationHistoryServer_c
	stop_JobHistoryServer_c
}

stop_hbase(){
        stop_HMaster_c
        stop_HRegionServer_c
}

stop_hive(){
	kill `ps -aux|grep -i HiveMetaStore|grep -v grep|awk '{print $2}'`
	kill `ps -aux|grep -i HiveServer2|grep -v grep|awk '{print $2}'`
}

stop_storm(){
        stop_nimbus_c
        stop_supervisor_c
        stop_logviewer_c
        stop_ui_c
}
    
