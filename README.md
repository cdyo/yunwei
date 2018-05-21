# 组件使用规范
中心开发组公用一套大数据平台，原则上开发程序和开发人员不能直接接触平台集群，通过接口机远程访问的方式进行。提交任务时，所有任务要求带有一个标识具体人的id,例如开发者的名字。
各个组件开放访问的Demo在公司的git库上，地址如下：
git上的Demo算是抛砖引玉。希望各位开发组的同事积极规范开发工作，反馈给我们。我们整理总结，以便作为模板想省份推广。

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
