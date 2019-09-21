# mybatis

mybatis的第一个查询

目录结构

![1566797284546](assets/1566797284546.png)

User.xml配置

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  <!-- dao接口的地址 -->
<mapper namespace="com.day01.dao.UserDao">

<!-- 查询 
#{id} 传的id
-->
  <select id="getUser" resultType="com.day01.domain.User">
    select * from test where id = #{id}
  </select>
</mapper>
```

mybatis-config.xml配置

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
  <environments default="development">
    <environment id="development">
      <transactionManager type="JDBC"/>
      <dataSource type="POOLED">
        <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://localhost:3306/test?useSSL=false&amp;serverTimezone=UTC&amp;characterEncoding=utf-8"/>
        <property name="username" value="root"/>
        <property name="password" value="root"/>
      </dataSource>
    </environment>
  </environments>
  <mappers>
    <mapper resource="com/day01/domain/UserDao.xml"/>
  </mappers>
</configuration>
```

实现查询

```java
package com.day01.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.day01.dao.UserDao;
import com.day01.domain.User;

public class MybatisTest {
	@Test
	public void test1() {
		SqlSession session=null;
		try {
			
			InputStream inputStream=Resources.getResourceAsStream("mybatis.xml");
			SqlSessionFactory sessionFactoryBuilder=new	SqlSessionFactoryBuilder().build(inputStream);
			 session=sessionFactoryBuilder.openSession();
			UserDao userDao=session.getMapper(UserDao.class);
			User user=userDao.getUser(134);
			System.out.println(user.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
	}
}

```

全局配置文件

mybatis-config.xml

全局配置文件的标签

![1566802712722](assets/1566802712722.png)

properties

![1566802917563](assets/1566802917563.png)

settings

![1566803537719](assets/1566803537719.png)

typeAliases

为javabean起别名

![1566803599508](assets/1566803599508.png)

![1566804230437](assets/1566804230437.png)

![1566804327571](assets/1566804327571.png)

typeHandlers

类型处理器

​        你可以重写类型处理器或创建你自己的类型处理器来处理不支持的或非标准的类型。 具体做法为：实现 `org.apache.ibatis.type.TypeHandler` 接口， 或继承一个很便利的类 `org.apache.ibatis.type.BaseTypeHandler`， 然后可以选择性地将它映射到一个 JDBC 类型。

plugins

![1566805210873](assets/1566805210873.png)

environment 配置具体的环境

每一个环境都需要一个事务管理器和一个数据源

![1566805402274](assets/1566805402274.png)



事务和数据源在spring中配置

数据库厂商标识（databaseIdProvider）

![1566806047313](assets/1566806047313.png)

![1566806093407](assets/1566806093407.png)

mappers  sql映射文件都需要注册

![1566806214558](assets/1566806214558.png)

class 引用接口 要求实体的配置文件与接口在同一包下,并且名字相同



resource 引用包名

批量注册

![1566807093944](assets/1566807093944.png)

sql映射文件

![1566807596573](assets/1566807596573.png)

![1566807778285](assets/1566807778285.png)

增删改标签

![1566807855448](assets/1566807855448.png)

获取自增主键

![1566808290349](assets/1566808290349.png)

获取非自增主键

在插入之前查出最大id+1然后赋值给keyProperty

![1566808599836](assets/1566808599836.png)

查询

1 传一个参数

基本类型

​	取值随便写

2 传多个参数

#{参数}无效

可用: 0,1 或param1,param2

原因; mabytis将传入色参数存在map中,取得时候需要用mabitis的吗[

的键取

解决方法: 我们在参数前面加上注解用来告诉mybatis存map的时候用我们指定的键

![1566809344030](assets/1566809344030.png)

![1566809368843](assets/1566809368843.png)



3 传javabean

#{javabean的属性}取出

4 传入map

将多个参数封装在map中,传入

![1566809498032](assets/1566809498032.png)

5 多个值和javabean

![1566809675246](assets/1566809675246.png)

![1566809990385](assets/1566809990385.png)

${} 和#{} 

#{}支持预编译  安全

${} 是字符串拼串,不安全 在不支持预编译时就使用

​		我们在进行动态传入表名时可以用${}取出

![1566812140034](assets/1566812140034.png)

![1566812167040](assets/1566812167040.png)



查询返回list

![1566816120272](assets/1566816120272.png)

![1566816147916](assets/1566816147916.png)

查询一条记录返回map

![1566816818431](assets/1566816818431.png)

![1566816839187](assets/1566816839187.png)

查询多条记录封装map

​							![1566817149896](assets/1566817149896.png)

![1566817804847](assets/1566817804847.png)

![1566817772513](assets/1566817772513.png)

自定义查询规则

![1566818642299](assets/1566818642299.png)

![1566818663785](assets/1566818663785.png)

级联查询

![1566819781041](assets/1566819781041.png)



collection

![1566821628011](assets/1566821628011.png)



分步查询

![1566822010160](assets/1566822010160.png)

按需加载

全局开启按需加载策略(延时加载)

![1566822938345](assets/1566822938345.png)

覆盖全局加载

![1566822890535](assets/1566822890535.png)

![1566823018816](assets/1566823018816.png)

推荐连接查询

动态sql

![1566824528782](assets/1566824528782.png)



![1566824662956](assets/1566824662956.png)

trim 不推荐

foeeach

![1566825214361](assets/1566825214361.png)



![1566825239152](assets/1566825239152.png)

choose

![1566825543515](assets/1566825543515.png)

set

动态更新

![1566825858725](assets/1566825858725.png)

![1566828352496](assets/1566828352496.png)

缓存机制

​		mybatis 一级缓存

![1566830794306](assets/1566830794306.png)

二级缓存

![1566831058166](assets/1566831058166.png)



二级缓存一定是一级缓存提交或关闭后生效

![1566831393196](assets/1566831393196.png)

![1566831424525](assets/1566831424525.png)



![1566834037851](assets/1566834037851.png)



缓存原理

![1566834450659](assets/1566834450659.png)

![1566834600901](assets/1566834600901.png)

![1566834565618](assets/1566834565618.png)

第三方缓存

整合redis,ehcache







1获取到的dao接口是动态代理对象,自动创建

2sqlSessionFactory和sqlsession

sqlSessionFactory只创建一次,sqlSession是每次和数据库进行一次会话,每次都应创建新的sqlSession.



