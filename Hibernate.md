# Hibernate

什么是框架:

1 写程序,使用框架之后,帮我们实现一部分功能,使用框架的好处,减少写代码

什么是hibernate:

hibernate框架应用在javaee三层结构中dao层框架.

在dao层里面对数据库crud操作.hibernate底层就是jdbc,hibernate对jdbc进行封装.

不需要写复杂的jdbc代码.不需要写sql语句.

是开源的轻量级框架.

orm思想:

javabean叫实体类:

orm object relational mapping 对象关系映射:

让实体类和数据库表进行一一对应.

让实体类对应数据库表,

属性对应字段.

![1565786593302](assets/1565786593302.png)

```xml
//映射文件
<?xml version="1.0" encoding="UTF-8"?>


<!DOCTYPE hibernate-mapping PUBLIC 
    "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
    "http://www.hibernate.org/dtd/hibernate-mapping-3.0.dtd">
<hibernate-mapping>
	<!--1 配置类和表对应
	class标签
	name 属性 实体类全路径
	table属性,数据库表名称
	
	  -->
	<class name="com.day01.entity.User" table="t_user">
		<!-- 配置实体类id和表id对应.
		 hibernate要求实体类有一个属性唯一值
		 要求表有字段作为唯一值
		 
		 
		 id标签
		 name属性,实体类里面id属性名称
		 column属性,生成表字段名称
		
		
		 -->
		<id name="uid" column="uid">
		<!--设置数据库表id增长策略
			native 生成id值就是主键自动增长
		  -->
			<generator class="native"></generator>
		
		</id>
		<property name="username" column="username"></property>
		<property name="password" column="password"></property>
		<property name="address" column="address"></property>
	</class>



</hibernate-mapping>
```

生成核心文件:

```
核心文件格式为xml
1 配置数据库信息
2 配置hibrenate信息
3 配置映射信息
```

![1565791156122](assets/1565791156122.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE hibernate-configuration PUBLIC
	"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
	"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
<!--1 配置数据库信息 


 -->
<session-factory>
	<!-- 	<property name="hibernate.connection.driver_class">
		com.mysql.cj.jdbc.Driver
		</property> -->
	<!-- <property name="hibernate.connection.url">
		jdbc:mysql://localhost:3306/Hibernate-demo1?useSSl=false&amp;serverTimezone=UTC
		</property>
		<property name="hibernate.connection.username">root</property>
		<property name="hibernate.connection.password">root</property> -->
	<!-- 配置hibernate信息 -->
	<property name="hibernate.show_sql">true</property>
	<!--  格式化sql-->
	<property name="hibernate.format_sql">true</property>
	<!-- 自动创建表 -->
	<property name="hibernate.hbm2ddl.auto">update</property>
	<!-- 方言 -->
	<!-- <property name="hibernate.dialect">
		org.hibernate.dialect.MySQL8Dialect
		</property> -->
	<!-- 配置映射文件 -->
	<property name="myeclipse.connection.profile">mysql</property>
	<property name="connection.url">
		jdbc:mysql://localhost:3306/test?useSSL=false&amp;serverTimezone=UTC&amp;characterEncoding=utf-8
	</property>
	<property name="connection.username">root</property>
	<property name="connection.password">root</property>
	<property name="connection.driver_class">
		com.mysql.cj.jdbc.Driver
	</property>
	<property name="dialect">
		org.hibernate.dialect.MySQL5Dialect
	</property>
	<mapping resource="com/day01/entity/User.hbm.xml" />
</session-factory>



</hibernate-configuration>
```

实现操作

![1565791606461](assets/1565791606461.png)

异常信息:

```java
org.hibernate.exception.SQLGrammarException: could not execute statement
	at org.hibernate.exception.internal.SQLExceptionTypeDelegate.convert(SQLExceptionTypeDelegate.java:63)
	at org.hibernate.exception.internal.StandardSQLExceptionConverter.convert(StandardSQLExceptionConverter.java:42)
	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:111)
	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:97)
	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:178)
	at org.hibernate.dialect.identity.GetGeneratedKeysDelegate.executeAndExtract(GetGeneratedKeysDelegate.java:57)
	at org.hibernate.id.insert.AbstractReturningDelegate.performInsert(AbstractReturningDelegate.java:42)
	at org.hibernate.persister.entity.AbstractEntityPersister.insert(AbstractEntityPersister.java:2933)
	at org.hibernate.persister.entity.AbstractEntityPersister.insert(AbstractEntityPersister.java:3524)
	at org.hibernate.action.internal.EntityIdentityInsertAction.execute(EntityIdentityInsertAction.java:81)
	at org.hibernate.engine.spi.ActionQueue.execute(ActionQueue.java:637)
	at org.hibernate.engine.spi.ActionQueue.addResolvedEntityInsertAction(ActionQueue.java:282)
	at org.hibernate.engine.spi.ActionQueue.addInsertAction(ActionQueue.java:263)
	at org.hibernate.engine.spi.ActionQueue.addAction(ActionQueue.java:317)
	at org.hibernate.event.internal.AbstractSaveEventListener.addInsertAction(AbstractSaveEventListener.java:318)
	at org.hibernate.event.internal.AbstractSaveEventListener.performSaveOrReplicate(AbstractSaveEventListener.java:275)
	at org.hibernate.event.internal.AbstractSaveEventListener.performSave(AbstractSaveEventListener.java:182)
	at org.hibernate.event.internal.AbstractSaveEventListener.saveWithGeneratedId(AbstractSaveEventListener.java:113)
	at org.hibernate.event.internal.DefaultSaveOrUpdateEventListener.saveWithGeneratedOrRequestedId(DefaultSaveOrUpdateEventListener.java:192)
	at org.hibernate.event.internal.DefaultSaveEventListener.saveWithGeneratedOrRequestedId(DefaultSaveEventListener.java:38)
	at org.hibernate.event.internal.DefaultSaveOrUpdateEventListener.entityIsTransient(DefaultSaveOrUpdateEventListener.java:177)
	at org.hibernate.event.internal.DefaultSaveEventListener.performSaveOrUpdate(DefaultSaveEventListener.java:32)
	at org.hibernate.event.internal.DefaultSaveOrUpdateEventListener.onSaveOrUpdate(DefaultSaveOrUpdateEventListener.java:73)
	at org.hibernate.internal.SessionImpl.fireSave(SessionImpl.java:692)
	at org.hibernate.internal.SessionImpl.save(SessionImpl.java:684)
	at org.hibernate.internal.SessionImpl.save(SessionImpl.java:679)
	at com.day01.test.HibernateTest.addtest(HibernateTest.java:30)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.junit.runners.model.FrameworkMethod$1.runReflectiveCall(FrameworkMethod.java:50)
	at org.junit.internal.runners.model.ReflectiveCallable.run(ReflectiveCallable.java:12)
	at org.junit.runners.model.FrameworkMethod.invokeExplosively(FrameworkMethod.java:47)
	at org.junit.internal.runners.statements.InvokeMethod.evaluate(InvokeMethod.java:17)
	at org.junit.runners.ParentRunner.runLeaf(ParentRunner.java:325)
	at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:78)
	at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:57)
	at org.junit.runners.ParentRunner$3.run(ParentRunner.java:290)
	at org.junit.runners.ParentRunner$1.schedule(ParentRunner.java:71)
	at org.junit.runners.ParentRunner.runChildren(ParentRunner.java:288)
	at org.junit.runners.ParentRunner.access$000(ParentRunner.java:58)
	at org.junit.runners.ParentRunner$2.evaluate(ParentRunner.java:268)
	at org.junit.runners.ParentRunner.run(ParentRunner.java:363)
	at org.eclipse.jdt.internal.junit4.runner.JUnit4TestReference.run(JUnit4TestReference.java:86)
	at org.eclipse.jdt.internal.junit.runner.TestExecution.run(TestExecution.java:38)
	at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.runTests(RemoteTestRunner.java:459)
	at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.runTests(RemoteTestRunner.java:678)
	at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.run(RemoteTestRunner.java:382)
	at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.main(RemoteTestRunner.java:192)
Caused by: java.sql.SQLSyntaxErrorException: Table 'test.t_user' doesn't exist
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)
	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)
	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:970)
	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1109)
	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1057)
	at com.mysql.cj.jdbc.ClientPreparedStatement.executeLargeUpdate(ClientPreparedStatement.java:1377)
	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdate(ClientPreparedStatement.java:1042)
	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:175)
	... 45 more


```

原因是mysql配置文件的update配置有误,不能是自动生成表.

org.service 表示没执行,就是mysql没连接数据库.

   配置文件详解:

![1565797052499](assets/1565797052499.png)

![1565797174830](assets/1565797174830.png)

![1565797262319](assets/1565797262319.png)

![1565797406690](assets/1565797406690.png)

mysql8.0需要用5的dialect

![1565797640869](assets/1565797640869.png)

核心api

![1565797817102](assets/1565797817102.png)

第一种详解

Configuration 

![1565797996038](assets/1565797996038.png)

SessionFactory

configuration 对象创建sessionfactory

![1565798232275](assets/1565798232275.png)

抽出工具类;

```java
public class HibernateUtils {
	static Configuration configuration=null;
	static SessionFactory sessionFactory=null;
	static{
		configuration=new Configuration();
		configuration.configure();
		sessionFactory=configuration.buildSessionFactory();
		
	}
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

}
```

Session(重点)

![1565799034691](assets/1565799034691.png)

Transaction

![1565799353347](assets/1565799353347.png)

实体类的编写规则:

```
1 实体类的属性都是私有的
2 私有属性要实现公开的getset方法
3 要求实体类要有属性作为唯一值.
4 实体类属性建议不使用基本数据类型,而是使用其包装类.
int Integer
char character
其他都是首字母大写

```

主键生成策略:

```
1 要求实体类里面有一个的彗星作为唯一值,对应表的主键,主键可以不同策略生成,生成主键有很多策略:

```

![1565800433423](assets/1565800433423.png)



```
主要有两个:
	 1 native 根据使用的数据库帮助选择那个键
	 2 uuid 会自己生成uuid
	    1 使用uuid生成策略,必须使用字符串类型
```

![1565800482030](assets/1565800482030.png)

![1565800796081](assets/1565800796081.png)

![1565800844931](assets/1565800844931.png)

实体类的操作:

对实体类的crud操作:

添加操作:

![1565800993382](assets/1565800993382.png)

根据id查询:

```
调用session里边的get方法:

```

![1565801492515](assets/1565801492515.png)

修改操作:

```
1 首先查询,返回对象
2 在执行修改操作
```

![1565801816048](assets/1565801816048.png)

删除操作:

![1565802051379](assets/1565802051379.png)

![1565802115044](assets/1565802115044.png)

实体类对象状态(概念) 

```
1 瞬时态 对象里面没有id值,和sesssion没关联
2 持久态 对象里面有id.对象与session关联
3 托管态 对象有id,和session没有关系
2 演示操作实体类对象的方法
	.saveOrupdate()瞬时态时做保存,托管态时做更新,持久态做更新

```

![1565829354686](assets/1565829354686.png)

![1565829408318](assets/1565829408318.png)

![1565829516524](assets/1565829516524.png)

![1565829662569](assets/1565829662569.png)

![1565829831461](assets/1565829831461.png)

### Hibernate的一级缓存:

数据存到数据库里面,数据库本身是文件系统,

```
数据存到数据库里面,数据库本身是文件系统,
1 数据存到内存中.不需要使用流方式,可以使用读取内存中数据
2 数据在内存中,提高读取速度
```

```
hibernate缓存特点:
1 一级缓存是默认打开的
2 hibernate的一级缓存使用范围,从session创建到session关闭范围
3 hibernate 的一级缓存中,存储数据必须持久态数据


第二类:二级缓存
目前不使用了,替代技术redis
二级缓存默认不是打开的,需要配置
3 二级缓存使用范围,是sessionFactory范围
验证一级缓存
	第一次查询发送sql语句
	第二次没有.

	
```

![1565830629740](assets/1565830629740.png)

![1565830953047](assets/1565830953047.png)

一级缓存特性:

持久态会自动更新

![1565831211677](assets/1565831211677.png)

![1565831761181](assets/1565831761181.png)

hibernate事务规范写法:

![1565832281261](assets/1565832281261.png)

hibernate绑定session

之前阶段学过threadlocal

3 获取与本地线程session

1 在hibernate配置.

![1565832562632](assets/1565832562632.png)

![1565833311201](assets/1565833311201.png)

![1565833387681](assets/1565833387681.png)

### 查询

query对象

不使用query对象,不需要写sql语句,但是写的是hql语句

![1565833638548](assets/1565833638548.png)

![1565833681757](assets/1565833681757.png)

![1565833969061](assets/1565833969061.png)

criteria对象

不需要写语句直接调用方法

![1565834164695](assets/1565834164695.png)

sqlquery对象

调用底层sql实现:

默认返回的是数组类型:

![1565834440011](assets/1565834440011.png)

设置实体后返回对象list

![1565834533726](assets/1565834533726.png)

表与表之间的关系回顾:

![1565835594054](assets/1565835594054.png)

![1565836646579](assets/1565836646579.png)

![1565836689003](assets/1565836689003.png)

![1565841199489](assets/1565841199489.png)

级联保存:

添加一个客户,为这个客户添加一个联系人;

级联删除:

删客户,这个客户里面的联系人也删除.

![1565841376537](assets/1565841376537.png)

一对多级联保存

![1565842365524](assets/1565842365524.png)

简化写法:

配置 customer文件

![1565842297013](assets/1565842297013.png)

只需在customer保存linkman 

![1565843349511](assets/1565843349511.png)

![1565843369343](assets/1565843369343.png)

级联删除:

配置删除:

![1565858978182](assets/1565858978182.png)

![1565859274538](assets/1565859274538.png)

执行过程:

1查出客户:

![1565859385603](assets/1565859385603.png)

2 查联系人

![1565859421205](assets/1565859421205.png)

3 将联系人的外键设置为null

![1565859476704](assets/1565859476704.png)

4 删除数据

![1565859508036](assets/1565859508036.png)

一对多修改操作:

将联系人所属修改

![1565859994712](assets/1565859994712.png)

双向维护外键: 这时修改了两次外键.造成效率的问题.

解决;让一边不维护外键.

让多的一边维护.

具体实现:

在放弃关系维护的一边配置:inverse属性>

![1565860345667](assets/1565860345667.png)

此时只更新一次:

![1565860990707](assets/1565860990707.png)

![1565861011267](assets/1565861011267.png)

多对多操作:

多对多映射配置:

第一步: 创建实体类,用户角色,

两个互相表示:

1 一个用户表示多尔衮角色 

2 一个角色表示多个用户

多对多级联保存

配置

![1565862634729](assets/1565862634729.png)

![1565862911416](assets/1565862911416.png)

级联保存

![1565863453673](assets/1565863453673.png)

![1565864265137](assets/1565864265137.png)

删除

![1565864474637](assets/1565864474637.png)

维护第三张表

让某个用户拥有某个角色

![1565864772042](assets/1565864772042.png)

让某个用户失去某个角色

![1565864849947](assets/1565864849947.png)

### 查询

对象导航查询:

查询某个客户的所有联系人:

![1565874093709](assets/1565874093709.png)

set集合遍历,增强for 和迭代器

根据od查询某个客户: 再查询这个客户里面所有的联系人.



oid查询:

![1565874172524](assets/1565874172524.png)

根据id查询某一条记录,返回对象

hql查询

普通sql操作的表和字段:

常用的hql语句:

1 查询所有:

​	查询所有的客户

查询所有的语句: **form  实体类的名称**

![1565874464598](assets/1565874464598.png)

2 条件查询

语句:  **from 实体类的名称  where 实体类属性=?  and  实体类属性名称=?**

**from  实体类名 where 实体类属性名称 like ?**

.setParameter( 参数一,参数二)

参数一指第几个问号,参数从0开始

参数二指具体的参数值.

![1565875124306](assets/1565875124306.png)

3 模糊查询

![1565875299794](assets/1565875299794.png)

4 排序查询

hql排序语句写法: **form  实体类名 order by 实体类属性名称 asc/desc** 

![1565875546708](assets/1565875546708.png)

5 分页查询:

![1565876339310](assets/1565876339310.png)

6 投影查询(查的是部分字段的值)

语句写法:  **select 实体类属性名1 ,实体类属性2  from 实体类名称**

![1565876578035](assets/1565876578035.png)



7 聚集函数的使用

hql语法: **select count(*)/sum/avg from 实体类名称**

![1565876776642](assets/1565876776642.png)

![1565876893084](assets/1565876893084.png)

QBC查询(不需要写语句,使用方法实现)

创建criteria ,调用方法实现

1查询所有

![1565877139636](assets/1565877139636.png)

2 条件查询

![1565877282675](assets/1565877282675.png)

![1565877398593](assets/1565877398593.png)

![1565877520211](assets/1565877520211.png)

3 排序查询

![1565877669051](assets/1565877669051.png)

4 分页查询(开始位置计算公式: (当前页-1)*每页记录数)

![1565877784889](assets/1565877784889.png)

5 统计查询

![1565878092374](assets/1565878092374.png)

6 离线查询

![1565878508251](assets/1565878508251.png)

HQL多表查询

1  内连接 查的是有数据连接的数据

![1565878738170](assets/1565878738170.png)

2 外(左右)连接

![1565878852387](assets/1565878852387.png)

HQL分类:

HQL内链接语法:**from   Customer c inner join  c.setLinkMan**

返回的是list list里面每部分是数组形式

![1565879460258](assets/1565879460258.png)

外(左右)连接

语法:**from   Customer c left  outer join  c.setLinkMan**

**from   Customer c right outer  join fetch  c.setLinkMan**

​	返回数组

![1565879760013](assets/1565879760013.png)

迫切内链接和内链接的区别,迫切内链接返回的每部分是对象

语法: **from   Customer c inner join fetch c.setLinkMan**

![1565879548764](assets/1565879548764.png)

![1565879814102](assets/1565879814102.png)

迫切左外连接

语法:**from   Customer c left outer  join fetch  c.setLinkMan**

返回对象

Hibernate检索策略

分类:

立即查询

数据id查询,调用get方法,一调用get马上数据库查询

延迟查询

数据id查询,调用load方法,不会马上发送语句查询数据,只有得到对象里面的值的时候才会发送语句查询数据库.

![1565880360108](assets/1565880360108.png)

延迟查询分为两类:

1 类级别延迟根据id 查询不会返回实体类对象.调用load方法不会马上发送语句.

2 关联级别延迟:查询某个客户,查询联系人是否需要延迟,这个过程称关联级别延迟

得到值时在发送数据

![1565880709802](assets/1565880709802.png)

关联级别延迟操作

在set标签上使用属性

1 fetch 值 select

2 lazy 值 true 延迟 false 不延迟 extra 极其延迟



![1565880780224](assets/1565880780224.png)

批量抓取

查询所有客户,返回list集合遍历list,得到每个客户,查其联系人

![1565881521602](assets/1565881521602.png)

上述会发送多次

在映射文件中在set标签中,配置属性batch-size="整数"数越大发送次数越少.

