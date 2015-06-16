
## Build

~~~
mvn clean install
~~~

## Run

### Configure module

Copy modules/* to JBOSS_HOME/modules

### Deploy war

Deploy `modules-loadprops.war` to JBoss

### Test

Access [http://localhost:8080/modules-loadprops/ServiceModuleLoaderLoadProps](http://localhost:8080/modules-loadprops/ServiceModuleLoaderLoadProps), check the output from JBoss Console

> NOTE: [http://blog.csdn.net/kylinsoong/article/details/12623997](http://blog.csdn.net/kylinsoong/article/details/12623997) has more details
