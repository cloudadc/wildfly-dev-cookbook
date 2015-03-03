## 无状态会话Bean集群

* 无数据的丢失 - 无状态会话Bean avoids holding data on behalf of its client，这使得无状态会话Bean集群变得简单，因为我们不必担心数据的丢失。
* 负载均衡 - 同一个EJB Client通过相同的client stub的一系列EJB调运会进行负载均衡，即EJB请求会在JBoss节点上切换(sequential calls made by the same client through the same stub can be load balanced across available cluster nodes)。
* 容错 - EJB client stub能够容错请求到可达的集群节点（fail over a request across the available cluster nodes）。
* 集群拓扑 - 集群拓扑可以通过集群的EJB或EJB client端的配置文件（jboss-ejb-client.properties）确定。
* EJB client stub - 通过JNDI查询无状态会话Bean返回一个EJB client stub，它包括集群的拓扑结构 and can successfully load balance or fail over a request across the available cluster nodes。每一次EJB调运都会更新stub中的集群信息，这使得stub中集群信息始终为最新。

## 实验一: WildFly 无状态会话Bean集群

* 定义无状态会话Bean集群

~~~
@Stateless
@Remote(StatelessSession.class)
@Clustered
public class StatelessSessionBean implements StatelessSession {
~~~

* 部署 [slsb](slsb) 到 WildFly 集群节点

~~~
$ cp slsb/target/cluster-demo-slsb.jar ~/server/wildfly-8.2.0.Final/node-1/deployments/
$ cp slsb/target/cluster-demo-slsb.jar ~/server/wildfly-8.2.0.Final/node-2/deployments/
~~~

* 启动集群节点

~~~
$ ./bin/standalone.sh -Djboss.server.base.dir=node-1 -c standalone-ha.xml -Djboss.node.name=node-1
$ ./bin/standalone.sh -Djboss.server.base.dir=node-2 -Djboss.socket.binding.port-offset=100 -c standalone-ha.xml -Djboss.node.name=node-2
~~~

* 运行客户端 [StatelessSessionBeanClient](slsb-client/src/main/java/org/wildfly/tutorial/cluster/client/StatelessSessionBeanClient.java)

~~~
node-2
node-1
node-1
node-2
node-1
node-2
node-1
node-1
node-2
node-2
~~~

## 有状态会话Bean集群

* 状态 - 有状态会话Bean的状态指的是每一个client stub在容器中都有一个对应的实例，通过同一个client stub的连续请求被认为是一个会话，状态在服务器端维护。
* Sticky 特性 - 不像无状态会话Bean的负载均衡策略（集群节点中切换），有状态会话Bean集群中采用Sticky机制，即client stub将请求发送到集群中同一个节点，知道节点发生异常退出。
* 容错 - EJB client stub能够容错请求到可达的集群节点，状态通过Infinispan在集群中复制同步。
* 集群拓扑 - 集群拓扑可以通过集群的EJB或EJB client端的配置文件确定。
* EJB client stub - 通过JNDI查询有状态会话Bean返回一个EJB client stub，它包括集群的拓扑结构，进行Sticky转发，容错等。另外每一次EJB调运都会更新stub中的集群信息，这使得stub中集群信息始终为最新。

## 实验二: WildFly 有状态会话Bean集群

* 定义有状态会话Bean集群

~~~
@Stateful
@Remote(StatefulSession.class)
@Clustered
public class StatefulSessionBean implements StatefulSession {
~~~

* 部署 [sfsb](sfsb) 到 WildFly 集群节点

~~~
$ cp sfsb/target/cluster-demo-sfsb.jar ~/server/wildfly-8.2.0.Final/node-1/deployments/
$ cp sfsb/target/cluster-demo-sfsb.jar ~/server/wildfly-8.2.0.Final/node-2/deployments/
~~~

* 启动集群节点

~~~
$ ./bin/standalone.sh -Djboss.server.base.dir=node-1 -c standalone-ha.xml -Djboss.node.name=node-1
$ ./bin/standalone.sh -Djboss.server.base.dir=node-2 -Djboss.socket.binding.port-offset=100 -c standalone-ha.xml -Djboss.node.name=node-2
~~~

* 运行客户端[StatefulSessionBeanClient](sfsb-client/src/main/java/org/jboss/demo/cluster/client/StatefulSessionBeanClient.java)

~~~
Sticky routes Test
node-2
node-2
node-2
node-2
node-2
node-2
node-2
node-2
node-2
node-2

Fail Over Test
node-2/null
node-2/sfsb-test-0
node-2/sfsb-test-1
node-2/sfsb-test-2
node-1/sfsb-test-3
node-1/sfsb-test-4
node-1/sfsb-test-5
node-1/sfsb-test-6
node-1/sfsb-test-7
node-1/sfsb-test-8
~~~

## Java Persistence 集群

* JPA中的一级缓存（First-level caching）涉及到持久化上下文，在JBoss中指的是Hibernate的Session，这个缓存是本地的，并认为它是短暂的，适用于单个的请求。它不会改变JPA技术的无状态特性，并不会对JPA应用的水平扩展和集群造成风险。

* JPA的二级缓存（Second-Level caching）指的是对传统数据库的缓存。它是JPA实体的一个本地数据存储，通过减少所需的往返数据库的次数来提高性能。使用了二级缓存，可以理解数据库中的数据在同一个集群中可以仅通过JPA进行修改。任何一个节点上数据的改变，对应的在其他节点上是数据的失效，这样保证的数据的连续性。尽管这样，有时候二级缓存还是会为JPA带来状态，这些问题需要注意解决。

* local-cache 和 invalidation-cache

~~~
<cache-container name="hibernate" default-cache="local-query" module="org.hibernate">
    <local-cache name="local-query">
	<transaction mode="NONE"/>
	<eviction strategy="LRU" max-entries="10000"/>
	<expiration max-idle="100000"/>
    </local-cache>
    <invalidation-cache name="entity" mode="SYNC">
	<transaction mode="NON_XA"/>
	<eviction strategy="LRU" max-entries="10000"/>
	<expiration max-idle="100000"/>
    </invalidation-cache>
</cache-container>
~~~

* 配置

~~~
<property name="hibernate.cache.use_second_level_cache" value="true"/>    
<property name="hibernate.cache.use_query_cache" value="true" />    
~~~

## 实验三: WildFly Java Persistence 集群

* 部署 [jpa](jpa) 到 WildFly 集群节点

~~~
$ cp jpa/target/cluster-demo-jpa.war ~/server/wildfly-8.2.0.Final/node-1/deployments/
$ cp jpa/target/cluster-demo-jpa.war ~/server/wildfly-8.2.0.Final/node-2/deployments/
~~~

* 启动集群节点

~~~
$ ./bin/standalone.sh -Djboss.server.base.dir=node-1 -c standalone-ha.xml -Djboss.node.name=node-1
$ ./bin/standalone.sh -Djboss.server.base.dir=node-2 -Djboss.socket.binding.port-offset=100 -c standalone-ha.xml -Djboss.node.name=node-2
~~~

* 测试

[jpa/README.md](jpa/README.md)
