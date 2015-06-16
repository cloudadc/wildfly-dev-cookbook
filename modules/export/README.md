
## Run

~~~
$ mvn clean install -P release
$ unzip dist/target/modules-export-dist.zip
$ cd modules-export

$ ./bin/export.sh

//edit 'modules/system/layers/base/B/main/module.xml', change export value to false
$ ./bin/export.sh
~~~

> NOTE: [http://blog.csdn.net/kylinsoong/article/details/18260657](http://blog.csdn.net/kylinsoong/article/details/18260657) has more details
