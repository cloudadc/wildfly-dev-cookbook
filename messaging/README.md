## 概述

## 发送和接收消息

* 创建Application User, 角色为guest

~~~
$ cp -a standalone jms-std-node
$ ./bin/add-user.sh -sc jms-std-node/configuration
~~~

* 启动WildFly

~~~
$ ./bin/standalone.sh -Djboss.server.base.dir=jms-std-node-2 --server-config=standalone-full.xml
~~~

* 创建testQueue

~~~
jms-queue add --queue-address=testQueue --entries=queue/test,java:jboss/exported/jms/queue/test
~~~

* 发送消息

~~~
$ cd jms-producer/
$ mvn clean compile exec:java
~~~

10条消息发送到testQueue

* 接收消息

~~~
$ cd jms-consumer/
$ mvn clean compile exec:java
~~~

## HornetQ 集群

* 集群配置

~~~
$ cp -a standalone jms-std-live
$ cp -a standalone jms-std-backup

$ cd ~
$ mkdir -p tmp/wildfly/jms-shared-store
~~~ 

配置jms-std-live

~~~
<subsystem xmlns="urn:jboss:domain:messaging:2.0">
    <hornetq-server>
        <clustered>true</clustered>
        <persistence-enabled>true</persistence-enabled>
        <cluster-user>jms-cluster-user</cluster-user>
        <cluster-password>jms-cluster-password</cluster-password>
        <backup>false</backup>
        <failover-on-shutdown>true</failover-on-shutdown>
        <check-for-live-server>true</check-for-live-server>
        <shared-store>true</shared-store>
        <journal-file-size>102400</journal-file-size>
        <paging-directory path="tmp/wildfly/jms-shared-store/paging" relative-to="user.home"/>
        <bindings-directory path="tmp/wildfly/jms-shared-store/bindings" relative-to="user.home"/>
        <journal-directory path="tmp/wildfly/jms-shared-store/journal" relative-to="user.home"/>
        <large-messages-directory path="tmp/wildfly/jms-shared-store/large-messages" relative-to="user.home"/>
        ...
		<jms-destinations>
		    <jms-queue name="ExpiryQueue">
		        <entry name="java:/jms/queue/ExpiryQueue"/>
		    </jms-queue>
		    <jms-queue name="DLQ">
			        <entry name="java:/jms/queue/DLQ"/>
		    </jms-queue>
		    <jms-queue name="WildFlyCookbookQueue">
		        <entry name="queue/test"/>
		        <entry name="java:jboss/exported/jms/queue/test"/>
		    </jms-queue>
		</jms-destinations>
    </hornetq-server>
</subsystem>
~~~

配置jms-std-backup

~~~
subsystem xmlns="urn:jboss:domain:messaging:2.0">
	<hornetq-server>
		<clustered>true</clustered>
		<persistence-enabled>true</persistence-enabled>
		<cluster-user>jms-cluster-user</cluster-user>
		<cluster-password>jms-cluster-password</cluster-password>
		<backup>true</backup>
		<failover-on-shutdown>true</failover-on-shutdown>
		<allow-failback>true</allow-failback>
		<shared-store>true</shared-store>
		<journal-file-size>102400</journal-file-size>
		<paging-directory path="tmp/wildfly/jms-shared-store/paging" relative-to="user.home"/>
		<bindings-directory path="tmp/wildfly/jms-shared-store/bindings" relative-to="user.home"/>
		<journal-directory path="tmp/wildfly/jms-shared-store/journal" relative-to="user.home"/>
		<large-messages-directory path="tmp/wildfly/jms-shared-store/large-messages" relative-to="user.home"/>
		...
		<jms-destinations>
		    <jms-queue name="ExpiryQueue">
		        <entry name="java:/jms/queue/ExpiryQueue"/>
		    </jms-queue>
		    <jms-queue name="DLQ">
		        <entry name="java:/jms/queue/DLQ"/>
		    </jms-queue>
		    <jms-queue name="WildFlyCookbookQueue">
		        <entry name="queue/test"/>
		        <entry name="java:jboss/exported/jms/queue/test"/>
		    </jms-queue>
		</jms-destinations>
	</hornetq-server>
</subsystem>
~~~

启动Server

~~~
$ ./bin/standalone.sh -Djboss.server.base.dir=jms-std-live --server-config=standalone-full-ha.xml
$ ./bin/standalone.sh -Djboss.server.base.dir=jms-std-backup -Djboss.socket.binding.port-offset=100 --server-config=standalone-full-ha.xml
~~~

* 集群测试

发送消息到jms-std-live  ->  停止jms-std-live  ->  从jms-std-backup消费消息 
