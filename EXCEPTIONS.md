# EXCEPTIONS

------

## 1. NoSuchFieldError

> `Caused by: java.lang.NoSuchFieldError: INSTANCE`

> hibernate3.5以后就集成annotation了，不需要引入hibernate-annotations.jar和hibernate-commons-annotations.jar，在项目中去掉这两个jar包，就可以了

> This exception has been fixed.

## 2. ClassNotFoundException

### 2.1 javax.persistence.Cacheable

> `Caused by: java.lang.ClassNotFoundException: javax.persistence.Cacheable`

> 需要加入hibernate-distribution-3.5.0-Final/lib/jpa目录下的hibernate-jpa-2.0-api-1.0.0.Final.jar

> This exception has been fixed.

### 2.2 org/apache/log4j/Level

> `Caused by: java.lang.NoClassDefFoundError: org/apache/log4j/Level`

> Add log4j-over-slf4j-1.7.10.jar.

> This exception has been fixed.

### 2.3 org.hibernate.cache.ehcache.EhCacheRegionFactory

> `Caused by: java.lang.ClassNotFoundException: org.hibernate.cache.ehcache.EhCacheRegionFactory`

> You need to include hibernate-ehcache.jar.

> This exception has been fixed.

### 2.4 net.sf.ehcache.CacheException

> `Caused by: java.lang.ClassNotFoundException: net.sf.ehcache.CacheException`

> Add ehcache.jar.

> This exception has been fixed.

### 2.5 org.apache.commons.logging.LogFactory

> `Caused by: java.lang.ClassNotFoundException: org.apache.commons.logging.LogFactory`

> Add log4j.jar,dom4j.jar,commons-logging.jar to your classpath.

> This exception has been fixed.

## 3. log4j:WARN No appenders could be found for logger

> `log4j:WARN No appenders could be found for logger`

> Add log4j.properties.[log4j:WARN No appenders could be found for logger 解决方案](http://javapub.iteye.com/blog/866664)

> This exception has been fixed.
 