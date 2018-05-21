#!/bin/bash
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASE_DIR/all_env
source $BASE_DIR/start_remote_function.sh

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
Redis=`cat $BASE_DIR/beh_service.ini|grep -w redis|cut -d':' -f1`
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

#remote start service

start_QuorumPeerMain_c(){
        for host in $QuorumPeerMain
		do start_QuorumPeerMain_r $host
	done
}

start_NameNode_c(){
        for host in $NameNode
                do start_NameNode_r $host
        done
}

start_DataNode_c(){
        for host in $DataNode
                do start_DataNode_r $host
        done
}

start_ResourceManager_c(){
        for host in $ResourceManager
                do start_ResourceManager_r $host
        done
}

start_NodeManager_c(){
        for host in $NodeManager
                do start_NodeManager_r $host
        done
}

start_JournalNode_c(){
        for host in $JournalNode
                do start_JournalNode_r $host
        done
}

start_DFSZKFailoverController_c(){
        for host in $DFSZKFailoverController
                do start_DFSZKFailoverController_r $host
        done
}

start_ApplicationHistoryServer_c(){
        for host in $ApplicationHistoryServer
                do start_ApplicationHistoryServer_r $host
        done
}

start_JobHistoryServer_c(){
        for host in $JobHistoryServer
                do start_JobHistoryServer_r $host
        done
}

start_HMaster_c(){
        for host in $HMaster
                do start_HMaster_r $host
        done
}

start_HRegionServer_c(){
        for host in $HRegionServer
                do start_HRegionServer_r $host
        done
}

start_Kafka_c(){
        for host in $Kafka
                do start_Kafka_r $host
        done
}

start_redis_c(){
        for host in $Redis
                do start_redis_r $host 
        done
}

start_Kafka_rest_c(){
        for host in $KafkaRestMain
                do start_Kafka_rest_r $host
        done
}

start_Kafka_schema_c(){
        for host in $SchemaRegistryMain
                do start_Kafka_schema_r $host
        done
}

start_nimbus_c(){
        for host in $nimbus
                do start_nimbus_r $host
        done
}

start_supervisor_c(){
        for host in $Supervisor
                do start_supervisor_r $host
        done
}


start_logviewer_c(){
        for host in $logviewer
                do start_logviewer_r $host
        done
}


start_ui_c(){
        for host in $core
                do start_ui_r $host
        done
}

start_hadoop(){
	start_QuorumPeerMain_c
	start_NameNode_c
	start_DFSZKFailoverController_c
	start_JournalNode_c
	start_DataNode_c
	start_ResourceManager_c
	start_NodeManager_c
	start_ApplicationHistoryServer_c
	start_JobHistoryServer_c
}

start_hbase(){
	start_HMaster_c
	start_HRegionServer_c	
}

start_hive(){
        nohup hive --service metastore 1>$HIVE_LOG_DIR/metastoreserver_stdout 2>$HIVE_LOG_DIR/metastoreserver2_stderr &
        nohup hive --service hiveserver2 1>$HIVE_LOG_DIR/hiveserver2_stdout 2>$HIVE_LOG_DIR/hiveserver2_stderr &
}

start_storm(){
	start_nimbus_c
	start_supervisor_c
	start_logviewer_c
	start_ui_c
}
