## How to use OpenJPA ReverseMappingTool generate entity

* Make sure database setup completely, and OpenJPA properties confgiured correctly.

[persistence.xml](src/main/resources/META-INF/persistence.xml), note that properties configuration like below:

~~~
<property name="openjpa.ConnectionUserName" value="test_user" />
<property name="openjpa.ConnectionPassword" value="test_pass" />
<property name="openjpa.ConnectionURL" value="jdbc:mysql://localhost:3306/test"/>
<property name="openjpa.ConnectionDriverName" value="com.mysql.jdbc.Driver"/>
~~~ 

* Execute Maven commands to generate entites

~~~
mvn exec:java
~~~

> NOTE - this will generate entites under `_generate` folder
