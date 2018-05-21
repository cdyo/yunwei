# 组件使用规范

## 各组件版本
组件 | 版本
---|---
Hadoop        | 2.9.1
Hive          | 2.3.3
Zookeeper     | 3.4.11
HBase         | 1.2.6
Kafka         | 2.11-0.11.0.2
Kafka-rest    | 3.3.1
Kafka-schema-registry   |3.3.1
Spark         | 2.3.0
Storm         | 1.1.2
Mariadb       | 10.0.34
OpenTSDB	  |	2.4.0
Redis         | 4.0.9
ElasticSearch | 2.6.3
Solr		  | 7.3.0
Hue	          | 3.12.0
Flume		  | 1.8.0
Oozie	      | 5.0.0

## 相关命令
### 启动操作（可启动服务kafka,hbase,hive,redis,hadoop,strom,kafka-rest）
#### 启动hadoop
    sh beh.sh start hadoop

#### 启动hbase
    sh beh.sh start hbase


### 关闭操作（可关闭服务kafka,hbase,hive,redis,hadoop,strom,kafka-rest）
#### 启动hadoop
    sh beh.sh stop hadoop

#### 启动hbase
    sh beh.sh stop hbase
