# EXCEPTIONS

------

## 1. NoSuchFieldError

> `Caused by: java.lang.NoSuchFieldError: INSTANCE`

> hibernate3.5以后就集成annotation了，不需要引入hibernate-annotations.jar和hibernate-commons-annotations.jar，在项目中去掉这两个jar包，就可以了

> This exception has been fixed.

## 2. ClassNotFoundException

> `Caused by: java.lang.ClassNotFoundException: javax.persistence.Cacheable`

> 需要加入hibernate-distribution-3.5.0-Final/lib/jpa目录下的hibernate-jpa-2.0-api-1.0.0.Final.jar

> This exception has been fixed.

