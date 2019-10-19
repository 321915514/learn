# springboot

springboot微服务的概念

helloworld程序

导入依赖

![1567235003035](assets/1567235003035.png)

编写主程序

![1567236042919](assets/1567236042919.png)

编写controller

![1567236100282](assets/1567236100282.png)

![1567236859007](assets/1567236859007.png)

简化部署

导入插件

![1567237584262](assets/1567237584262.png)

父项目

![1567237784338](assets/1567237784338.png)

spring-boot-starter

springboot场景启动器帮我们导入了web模块正常运行所依赖的组件

springboot将所有的功能场景抽取出start

2 主程序类

@springbootApplication springboot应用标注在某各类上其是注解的组合

![1567238134243](assets/1567238134243.png)

![1567238549415](assets/1567238549415.png)

![1567238575947](assets/1567238575947.png)

![1567238913092](assets/1567238913092.png)

![1567239221269](assets/1567239221269.png)

快速创建springboot

![1567239709823](assets/1567239709823.png)

配置文件

springboot使用一个全局的配置文件,配置文件是固定的



application.properties

application.yml

![1567240252780](assets/1567240252780.png)

yml语法

基本语法:

k:(空格)v : 表示一对键值对(空格必须有)

以空格的缩进来表示层级关系,只要是左对齐的一列数据都是同一级别的

属性和值是大小写敏感

![1567240629589](assets/1567240629589.png)

![1567240698826](assets/1567240698826.png)

![1567240738359](assets/1567240738359.png)

![1567240803859](assets/1567240803859.png)



将配置文件与bean对象一一对映

![1567241166502](assets/1567241166502.png)

编写yaml文件

在bean上注解

![1567241336024](assets/1567241336024.png)

配置文件注入

![1567241435147](assets/1567241435147.png)

用properties编写

![1567241527101](assets/1567241527101.png)

configurationproperties和@value对比

![1567242089167](assets/1567242089167.png)

![1567242278840](assets/1567242278840.png)

@importResource导入spring的配置文件,让配置文件里面的内容生效

springboot里面没有spring的配置文件,我们自己编写的配置文件,也不能识别

想让springboot配置文件生效,加载进来@ImportResource.让其生效

![1567245034308](assets/1567245034308.png)



springboot推荐的方式给容器添加组件的方式

1 配置类: @Configuration标注给容器中添加组件

![1567245269755](assets/1567245269755.png)

配置文件占位符(yml和properties都支持)

![1567245322894](assets/1567245322894.png)

​		1 以写随机数

​		2 占位符可以获取之前配置的值,如果没有可以用:指定默认值

![1567245578231](assets/1567245578231.png)

Profile

1 多profile文件

我们在编写文件的时候,文件名可以以 application-(profile).properties/yml

默认使用application.properties.

![1567245620236](assets/1567245620236.png)

激活profile

1 我们用spring.properties.active=dev

yml文档块模式

​		![1567246326316](assets/1567246326316.png)

1 激活使用 spring.profile.active=dev

2  命令行方式激活

​		--spring-profile.active=dev

![1567246476478](assets/1567246476478.png)

![1567246559797](assets/1567246559797.png)

![1567246801940](assets/1567246801940.png)

配置文件加载位置

![1567246888094](assets/1567246888094.png)

springboot会从这四个位置全部加载配置文件,互补配置

![1567247221475](assets/1567247221475.png)

![1567247265504](assets/1567247265504.png)

外部配置

![1567254616593](assets/1567254616593.png)

![1567254669168](assets/1567254669168.png)

优先加载带profile无论是jar包外还是内,再来加载不带profile的



由jar包外向jar包内加载配置.

 ![1567255024731](assets/1567255024731.png)

自动配置原理

springboot启动的时候就会架子啊主配置类 开启了自动配置功能

2 @EableAutoConfiguration作用

![1567255854492](assets/1567255854492.png)

:smile:

![1567257231947](assets/1567257231947.png)

##### 自动配置添加组件

![1567257648023](assets/1567257648023.png)

细节

1 @Conditional扩展

![1567257772620](assets/1567257772620.png)

自动配置类在一定条件下才能生效



![1567257948609](assets/1567257948609.png)

我们可以通过dubug=true属性,来让控制台打印自动配置报告,这样我们就可以很方便的知道那些自动配置类生效

### springboot与日志

![1567258693363](assets/1567258693363.png)

以后开发的时候日志记录方法的调用,不应该来直接调用实现方法.

![1567258764904](assets/1567258764904.png)

![1567258986936](assets/1567258986936.png)

每一个日志的实现框架都有自己的框架配置文件,,使用都slf4j以后,配置文件还是做成日志实现框架的配置文件.

遗留问题.统一日志记录.

1 将系统中其他日志框架排除出去.

2 用中间包来替换原有的日志框架

3 我们导入slf4j其他的实现

springboot日志依赖关系

![1567259775260](assets/1567259775260.png)

中间包

![1567260470806](assets/1567260470806.png)

如果我们要引入其他框架,一定要把这个框架的默认日志包依赖除掉

![1567260887715](assets/1567260887715.png)

![1567262276963](assets/1567262276963.png)

logging指定配置

![1567264173446](assets/1567264173446.png)

![1567264205295](assets/1567264205295.png)

切换日志框架(不推荐)

![1567264574988](assets/1567264574988.png)

web开发

使用springboot

1 创建springboot应用,选中我们需要的模块

2 springboot已经默认将这些场景配置好了,只需要在配置文件中配置少量配置就可以运行了

3 自己编写业务代码

自动配置原理

 这个场景,springboot帮我们实现了什么,能修改什么配置,能不能扩展

```
xxxAutoConfiguration 帮我们给容器中自动配置组件
xxxProperties: 配置类中封装配置文件的内容

```

springboot对静态资源映射的规则

![1567265636738](assets/1567265636738.png)

通过webjars导入依赖

第二种导入自己的静态文件

2  "/**"访问当前项目的静态资源(静态资源路径)

```
"classPath:MATA-INF/resources",
"classpath :/resources/"
"classpath:/public/"
"/"当前项目根路径
```

localhost:8080/abc====去静态资源文件夹找abc

**欢迎页映射. 静态资源文件夹下所有的index.html页面,被"/**"映射**

**localhost:8080/     找index页面**

**4 所有的**/favicon.ico都是在静态资源文件下找**

###### 3 模板引擎

![1567266762946](assets/1567266762946.png)

springboot推荐的Thymeleaf

语法更简单,功能更强大

1 引入thymeleaf

![1567267140166](assets/1567267140166.png)

thymeleaf3适配layout2以上版本

Thymeleaf

![1567267347090](assets/1567267347090.png)

Thymeleaf

导入thymeleaf的名称空间

```
<html lang="en" xmlns:th="http://www.thymeleaf.org">
```

语法

![1567267958279](assets/1567267958279.png)

语法规则:

1 th:text 改变当前元素里面的文本内容

   1th:任意html属性; 来替换原来属性

属性优先级

![1567268153852](assets/1567268153852.png)

表达式

${}   获取变量值

![1567269316156](assets/1567269316156.png)

2 内置的工具对象

![1567269375464](assets/1567269375464.png)

*{} 选择表达式 和${}功能一样,另外还有在${}获得对象后,获取属性名,配合th:object shiyong

#{}   取国际化内容,

@{} 定义url连接

![1567269618983](assets/1567269618983.png)

![1567269682691](assets/1567269682691.png)

![1567269726257](assets/1567269726257.png)

![1567269738226](assets/1567269738226.png)

![1567269751944](assets/1567269751944.png)

springboot 对springmvc的自动配置

组件的自动配置

5 如何修改springboot的默认配置

 模式:

1 springboot在自动配置很多组建的时候,先看容器中有没有用户自己配置的.

如果有用户配置的就先用用户的,如果没有就自己创建组件.

![1567271463708](assets/1567271463708.png)

在类上添加@EnableWebMvc 表示springboot对springmvc的自动配置不需要了,所有都需要自己配置.

原理: 

4将WebMvcConfigurationSupport组件导入进来

5 导入的webMvcConfigurationSupport只是springmvc最基本的功能

2 在spingboot中有非常多的xxxconfiguration都是扩展的

crud

默认访问首页

默认访问首页的设置,需要导入thymeleaf和设置其版本号

首页静态资源需要放在trmplete模板下

![1567333821660](assets/1567333821660.png)

![1567333863566](assets/1567333863566.png)

![1567333889202](assets/1567333889202.png)

![1567333903296](assets/1567333903296.png)

国际化,配置国际化资源文件

![1567334326235](assets/1567334326235.png)

2 springboot 自动配置号了管理国际化资源文件的组件

配置资源文件的位置

![1567335209719](assets/1567335209719.png)

页面用th:text="#{}"取值

国际化定义一个按钮改变语言 实现localeresolver

![1567340733760](assets/1567340733760.png)

![1567341565764](assets/1567341565764.png)

登录与拦截器

登录拦截器

![1567393813631](assets/1567393813631.png)

restful实现增删该查

![1567407372464](assets/1567407372464.png)

thymeleaf 抽取公共片段

![1567409974835](assets/1567409974835.png)

![1567410006683](assets/1567410006683.png)

![1567410169687](assets/1567410169687.png)

![1567410335788](assets/1567410335788.png)

![1567410436100](assets/1567410436100.png)

![1567410449971](assets/1567410449971.png)

循环list

![1567411548346](assets/1567411548346.png)

![1567481242248](assets/1567481242248.png)

![1567485375544](assets/1567485375544.png)

错误处理机制

默认效果,返回一个错误页面

![1567486803893](assets/1567486803893.png)

![1567487221934](assets/1567487221934.png)

如何定制json数据

![1567487475548](assets/1567487475548.png)

没有自适应效果,浏览器客户端都返回json

![1567487722056](assets/1567487722056.png)

![1567490358989](assets/1567490358989.png)

配置嵌入式servlet容器

![1567492454868](assets/1567492454868.png)

springboot默认使用tomcat作为嵌入式的seervlet容器

![1567490523020](assets/1567490523020.png)

![1567490661647](assets/1567490661647.png)

![1567492376951](assets/1567492376951.png)

![1567492404794](assets/1567492404794.png)

注册三大组件

![1567492546352](assets/1567492546352.png)

springboot是以jar包方式启动嵌入式tomcat没有xml文件

注册三大组件有以下方式

![1567492827941](assets/1567492827941.png)

注册filte

![1567493177005](assets/1567493177005.png)





注册listener

![1567493019555](assets/1567493019555.png)

![1567493079506](assets/1567493079506.png)

springboot帮我们自动注册了dispachterServlet

![1567493387534](assets/1567493387534.png)

![1567493622713](assets/1567493622713.png)

![1567493678124](assets/1567493678124.png)

使用starteer-web默认使用tomcat

嵌入式servlet容器自动配置原理

![1567494674827](assets/1567494674827.png)

![1567495323871](assets/1567495323871.png)

![1567495368764](assets/1567495368764.png)

嵌入式servlet

优点: 简单,便携

缺点:默认不支持jsp,优化定制比较负载(使用定制器(Serverproperties,自定义enableedservletContainnerCustomer))自己编写嵌入式servlet容器的创建工厂

(enableedServletContainerFactor)

使用外部 的servlet容器,外面安装servlet

![1567497612597](assets/1567497612597.png)

外部servlet启动原理

![1567499878340](assets/1567499878340.png)

# docker

![1567500306126](assets/1567500306126.png)

![1567500590209](assets/1567500590209.png)

![1567504579254](assets/1567504579254.png)

![1567505213824](assets/1567505213824.png)

启动mysql

![1567506857760](assets/1567506857760.png)

![1567508007836](assets/1567508007836.png)

springboot数据交互

![1567512112287](assets/1567512112287.png)

### druid

注册数据源

![1567512806258](assets/1567512806258.png)

配置servlet

![1567512782915](assets/1567512782915.png)

配置过滤器

![1567514550904](assets/1567514550904.png)

### 整合mybatis(在springboot01项目里)

引入mybatis或创建的时候直接选中jdbc,mybatis,web三项即可

![1567514812670](assets/1567514812670.png)

![1567514964882](assets/1567514964882.png)

引入druid

配置文件:

```yml
spring:
  datasource:
    url: jdbc:mysql://172.20.10.4:3306/mybatis
    username: root
    password: 123456
    type: com.alibaba.druid.pool.DruidDataSource


    initialSize: 5
    minIdle: 5
    maxActive: 20
    maxWait: 60000
    timeBetweenEvictionRunsMillis: 60000
    minEvictableIdleTimeMillis: 300000
    validationQuery: SELECT 1 FROM DUAL
    testWhileIdle: true
    testOnBorrow: false
    testOnReturn: false
    poolPreparedStatements: true
    filters: stat,wall,log4j
    maxPoolPreparedStatementPerConnectionSize: 20
    useGlobalDataSourceStat: true
    connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=500
    driver-class-name: com.mysql.jdbc.Driver


```

如果有错误导入log4j

```
<dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>1.2.17</version>
        </dependency>
```

servlet和filter

```java
package com.day01.springboot01.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class DruidConfig {
    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource driud(){
        return new DruidDataSource();
    }
    @Bean
    public ServletRegistrationBean statViewServlet(){
        ServletRegistrationBean bean=new ServletRegistrationBean(new StatViewServlet(),"/druid/*");
        Map<String, String> map=new HashMap<>();
        map.put("loginUsername","admin");
        map.put("loginPassword","123456");
        map.put("allow","");
        bean.setInitParameters(map);
        return bean;
    }
    @Bean
    public FilterRegistrationBean webStatFilter(){
        FilterRegistrationBean bean = new FilterRegistrationBean(new WebStatFilter());
        Map<String,String> map=new HashMap<>();
        bean.setInitParameters(map);
        bean.setUrlPatterns(Arrays.asList("/*"));
        map.put("exclusions","*.js,*.css,/druid/*");

        return bean;
    }
}

```

创建表

```sql
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tab_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dept`;
CREATE TABLE `tab_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_dept
-- ----------------------------
INSERT INTO `tab_dept` VALUES ('1', '开发部');
INSERT INTO `tab_dept` VALUES ('4', '测试部');
INSERT INTO `tab_dept` VALUES ('6', '管理部');

-- ----------------------------
-- Table structure for `tab_emp`
-- ----------------------------
DROP TABLE IF EXISTS `tab_emp`;
CREATE TABLE `tab_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `tab_emp_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `tab_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_emp
-- ----------------------------
INSERT INTO `tab_emp` VALUES ('1', '小李', '1', '123@qq.com', '4');
INSERT INTO `tab_emp` VALUES ('2', '小马', '1', '456@qq.com', '1');
INSERT INTO `tab_emp` VALUES ('3', '小王', '1', '321@qq.com', '1');
INSERT INTO `tab_emp` VALUES ('4', '046100', '0', '046100@qq.com', '1');
INSERT INTO `tab_emp` VALUES ('5', 'babf61', '1', 'babf61@qq.com', '1');
INSERT INTO `tab_emp` VALUES ('6', '01fa12', '1', '01fa12@qq.com', '1');
INSERT INTO `tab_emp` VALUES ('7', 'f8f6d3', '1', 'f8f6d3@qq.com', '1');
```

使用mybatis逆向工程生成bean和mapper和dao层

引入mybatis-generator的核心依赖

```
<dependency>
            <groupId>org.mybatis.generator</groupId>
            <artifactId>mybatis-generator-core</artifactId>
            <version>1.3.5</version>
        </dependency>
```

生成generatorConfig.xml文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration
        PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">

<generatorConfiguration>

    <context id="DB2Tables" targetRuntime="MyBatis3">
        <commentGenerator>
            <property name="suppressAllComments" value="true"/>
        </commentGenerator>


        <jdbcConnection driverClass="com.mysql.jdbc.Driver"
                        connectionURL="jdbc:mysql://172.20.10.4:3306/mybatis"
                        userId="root"
                        password="123456">
        </jdbcConnection>

        <javaTypeResolver >
            <property name="forceBigDecimals" value="false" />
        </javaTypeResolver>
        <!--javabean  -->
        <javaModelGenerator targetPackage="com.day01.springboot01.bean" targetProject=".\src\main\java">
            <property name="enableSubPackages" value="true" />
            <property name="trimStrings" value="true" />
        </javaModelGenerator>

        <sqlMapGenerator targetPackage="mapper"  targetProject=".\src\main\resources">
            <property name="enableSubPackages" value="true" />
        </sqlMapGenerator>

        <javaClientGenerator type="XMLMAPPER" targetPackage="com.day01.springboot01.dao"  targetProject=".\src\main\java">
            <property name="enableSubPackages" value="true" />
        </javaClientGenerator>

        <table tableName="tab_emp" domainObjectName="Employee" ></table>
        <table tableName="tab_dept" domainObjectName="Department" ></table>

    </context>
</generatorConfiguration>
```

运行程序生成bean

```java
package com.day01.springboot01;import org.mybatis.generator.api.MyBatisGenerator;import org.mybatis.generator.config.Configuration;import org.mybatis.generator.config.xml.ConfigurationParser;import org.mybatis.generator.internal.DefaultShellCallback;import java.io.File;import java.util.ArrayList;import java.util.List;public class DataSourceTest {    
    public static void main(String[] args) throws Exception {        
        List<String> warnings = new ArrayList<String>();        
        boolean overwrite = true;        
        File configFile = new              File("E:\\IdeaProjects\\springboot01\\src\\main\\resources\\generatorConfig.xml");        ConfigurationParser cp = new ConfigurationParser(warnings);        
        Configuration config = cp.parseConfiguration(configFile);        		             DefaultShellCallback callback = new DefaultShellCallback(overwrite);        	     MyBatisGenerator myBatisGenerator = new 
            MyBatisGenerator(config, callback, warnings);        
        myBatisGenerator.generate(null);    
    }
}
```

mybatis注解版

![1567525180840](assets/1567525180840.png)

自定义mybatis的配置规则

![1567527548770](assets/1567527548770.png)

扫描所有mapper

![1567527631215](assets/1567527631215.png)

配置版mybatis

```
mybatis:
  config-location: classpath:mybatis/mybatis-config.xml
  mapper-locations: classpath:mybatis/mapper/*.xml
```

![1567531700250](assets/1567531700250.png)

引入mybatis-config.xml文件

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>

</configuration>
```

整合springdata jpa

jap:orm(object relational Mapping)

1 编写一个实体类(bean)和数据表进行映射,并且配置好映射

![1567532461890](assets/1567532461890.png)

![1567532616436](assets/1567532616436.png)

![1567532681003](assets/1567532681003.png)

application.yml文件

```yml
spring:
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true
  datasource:
    username: root
    url: jdbc:mysql://172.20.10.4:3306/jpa
    password: 123456
    driver-class-name: com.mysql.jdbc.Driver
```

springboot启动原理

![1567535539682](assets/1567535539682.png)

1 创建springapplication对象

![1567535941152](assets/1567535941152.png)

2 ![1567545551978](assets/1567545551978.png)

自定义starter

1 这个场景需要使用的依赖是什么

2 如何编写自动配置

![1567546066452](assets/1567546066452.png)

springboot缓存

![1567546836826](assets/1567546836826.png)

![1567575960155](assets/1567575960155.png)

![1567576231131](assets/1567576231131.png)

springboot驼峰命名法配置

```properties
spring.datasource.username=root
spring.datasource.password=root
spring.datasource.url=jdbc:mysql://localhost:3306/ssm_crud?useSSL=false&serverTimezone=UTC
mybatis.configuration.map-underscore-to-camel-case=true
```

开启基于注解的缓存

```
logging.level.com.day01.cache.mapper=debug
```

![1567583959002](assets/1567583959002.png)

![1567583942836](assets/1567583942836.png)

缓存运行流程

![1567585237268](assets/1567585237268.png)

![1567585263694](assets/1567585263694.png)

![1567585374159](assets/1567585374159.png)

![1567585622501](assets/1567585622501.png)

![1567585644551](assets/1567585644551.png)

![1567585769391](assets/1567585769391.png)

![1567587367395](assets/1567587367395.png)

@catchput及调用方法又更新缓存数据(同步更新缓存)

运行时机: 先调用方法,在将目标数据保存起来

要和catchable的key相同:

![1567586428839](assets/1567586428839.png)

![1567587470062](assets/1567587470062.png)

![1567587488934](assets/1567587488934.png)

@CacheEvict 缓存清除(默认是在方法之后执行)

![1567587018678](assets/1567587018678.png)

![1567586950443](assets/1567586950443.png)

![1567587624169](assets/1567587624169.png)

### 整合redis

```
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
        </dependency>
         <dependency>
            <groupId>redis.clients</groupId>
            <artifactId>jedis</artifactId>
            <version>2.9.0</version>
        </dependency>
```

配置文件

```

```



![1567591032716](assets/1567591032716.png)



配置json序列化

![1567591566870](assets/1567591566870.png)

```java

@Configuration
    public class MyRedisConfig {
        @Bean
        public RedisTemplate empRedisTemplate(RedisConnectionFactory redisConnectionFactory){
            RedisTemplate<Object, Employee> template = new RedisTemplate<>();
            template.setConnectionFactory(redisConnectionFactory);
            Jackson2JsonRedisSerializer<Employee> jsonRedisSerializer = new Jackson2JsonRedisSerializer<>(Employee.class);
            template.setDefaultSerializer(jsonRedisSerializer);
            return template;

        }

}
```

测试

![1567592769342](assets/1567592769342.png)

```java
    @Test
    public void  redisTest(){
        //stringRedisTemplate.opsForValue().append("hello","redis");
        Employee emp = employeeMapper.getEmpById(1);
        empRedisTemplate.opsForValue().set("emp01",emp);
    }
```

自定义redis manageer

![1567617534855](assets/1567617534855.png)

springboot与消息

![1567617861383](assets/1567617861383.png)

![1567618002585](assets/1567618002585.png)

![1567618141010](assets/1567618141010.png)

![1567618535599](assets/1567618535599.png)

![1567618694236](assets/1567618694236.png)

![1567618769245](assets/1567618769245.png)

rabbitmq的自动配置类

```properties
spring.rabbitmq.host=172.20.10.4
spring.rabbitmq.username=guest
spring.rabbitmq.password=guest

```

![1567622602301](assets/1567622602301.png)

自定义序列化

```java
    @Configuration
    public class Myconfig {
        @Bean
        public MessageConverter messageConverter(){
            return new Jackson2JsonMessageConverter();
        }
```

```java
 @Autowired
    RabbitTemplate rabbitTemplate;

    @Test
    public void contextLoads() {
        Map<String,Object> map=new HashMap<>();
        map.put("msg","第3封消息");
        map.put("data", Arrays.asList("hello world",123,true));
        rabbitTemplate.convertAndSend("exchange.direct","atguigu.news",new Book("西游记","吴承恩"));
    }
    @Test
    public void  getMessage(){
        Object o = rabbitTemplate.receiveAndConvert("atguigu.news");
        System.out.println(o);
    }
```

![1567623797779](assets/1567623797779.png)

![1567624331896](assets/1567624331896.png)

注解EnableRabbit,在service注解@RabbitListner

![1567624730192](assets/1567624730192.png)

高级检索

docker安装Elasticsearch

启动elasticsearch

```
docker run -d -e ES_JAVA_POTS="-Xms256m -Xmx256m"  -e "discovery.type=single-node" -p 9200:9200 -p 
9300:9300 --name ES3 8f46db60ddd6
```

![1567630351557](assets/1567630351557.png)

springboot默认支持两种技术来和es交互

jest(默认不生效)

需要导入jest的工具包

![1567632086643](assets/1567632086643.png)

```
spring.elasticsearch.jest.uris=http://172.20.10.4:9200
```

```
public class Article {
    @JestId
    private Integer id;
    private String title;
    private String author;
    private String content;
```

```java
@RunWith(SpringRunner.class)
@SpringBootTest
public class ElasticApplicationTests {
    @Autowired
    JestClient jestClient;

    @Test
    public void contextLoads() {
        //给es创建一个索引
        Article article = new Article();
        article.setId(1);
        article.setTitle("hello world");
        article.setAuthor("zhangsan");
        article.setContent("你好");

        Index index = new Index.Builder(article).index("article").type("message").build();
        try {
            jestClient.execute(index);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void search(){
        String json="{\"query\":{\"match\":{\"content\":\"你好\"}}}";
        Search search = new Search.Builder(json).addIndex("article").addType("message").build();
        try {
            SearchResult result = jestClient.execute(search);
            System.out.println(result.getJsonString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
```

springdata ElasticSearch

![1567632221780](assets/1567632221780.png)

![1567639009942](assets/1567639009942.png)

```java
   @Autowired
    BookRepository bookRepository;

    @Test
    public void test01(){
        Book book = new Book();
        book.setId(1);
        book.setTitle("西游记");
        book.setAuthor("吴承恩");
        bookRepository.index(book);
    }
```

```properties
spring.data.elasticsearch.cluster-name=docker-cluster
spring.data.elasticsearch.cluster-nodes=172.20.10.4:9300
```

```java
package com.day01.elastic.repository;

import com.day01.elastic.bean.Book;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface BookRepository extends ElasticsearchRepository<Book,Integer> {
}

```

```java
@Document(indexName = "atguigu",type = "book")
public class Book {
    private Integer id;
    private String title;
    private String author;
```

springboot与任务

异步任务

![1567639812223](assets/1567639812223.png)

![1567639824700](assets/1567639824700.png)

定时任务

![1567639906457](assets/1567639906457.png)

![1567640630061](assets/1567640630061.png)

邮件任务

![1567640966028](assets/1567640966028.png)

![1567640984586](assets/1567640984586.png)

复杂邮件发送

![1567641215879](assets/1567641215879.png)

springboot与安全

引入spring-security

```
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.thymeleaf.extras/thymeleaf-extras-springsecurity5 -->
        <dependency>
            <groupId>org.thymeleaf.extras</groupId>
            <artifactId>thymeleaf-extras-springsecurity5</artifactId>
            <version>3.0.4.RELEASE</version>
        </dependency>
```

编写配置

![1567644935474](assets/1567644935474.png)

```java
package com.day01.security.config;


import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
;

@EnableWebSecurity
public class MyConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //super.configure(http);
        //定制规则
        http.authorizeRequests().antMatchers("/").permitAll().antMatchers("/level1/**").hasRole("VIP1").antMatchers("/level2/**").hasRole("VIP2").antMatchers("/level3/**").hasRole("VIP3");
        //如果没有权限就会登录
        http.formLogin().usernameParameter("user").passwordParameter("pwd").loginPage("/userlogin");
        //开启自动配置的注销功能,访问/logout 清空session
        http.logout().logoutSuccessUrl("/");
        //注销成功会返回/login/logout页面
        //开启记住我的功能
        http.rememberMe().rememberMeParameter("remeber");


    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //super.configure(auth);
        auth.inMemoryAuthentication().passwordEncoder(new BCryptPasswordEncoder()).withUser("zhangsan").password(new BCryptPasswordEncoder().encode("123456")).roles("VIP1","VIP2").and()
        .withUser("lisi").password(new BCryptPasswordEncoder().encode("123456")).roles("VIP2","VIP3");

    }
}

```

```html
//welcome.html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">欢迎光临武林秘籍管理系统</h1>
<div sec:authorize="!isAuthenticated()">
	<h2 align="center">游客您好，如果想查看武林秘籍 <a th:href="@{/userlogin}">请登录</a></h2>
</div>
<div sec:authorize="isAuthenticated()">
	<h2><span sec:authentication="name"></span>，您好,您的角色有：
		<span sec:authentication="principal.authorities"></span></h2>
	<form th:action="@{/logout}" method="post">
		<input type="submit" value="注销"/>
	</form>
</div>

<hr>

<div sec:authorize="hasRole('VIP1')">
	<h3>普通武功秘籍</h3>
	<ul>
		<li><a th:href="@{/level1/1}">罗汉拳</a></li>
		<li><a th:href="@{/level1/2}">武当长拳</a></li>
		<li><a th:href="@{/level1/3}">全真剑法</a></li>
	</ul>

</div>

<div sec:authorize="hasRole('VIP2')">
	<h3>高级武功秘籍</h3>
	<ul>
		<li><a th:href="@{/level2/1}">太极拳</a></li>
		<li><a th:href="@{/level2/2}">七伤拳</a></li>
		<li><a th:href="@{/level2/3}">梯云纵</a></li>
	</ul>

</div>

<div sec:authorize="hasRole('VIP3')">
	<h3>绝世武功秘籍</h3>
	<ul>
		<li><a th:href="@{/level3/1}">葵花宝典</a></li>
		<li><a th:href="@{/level3/2}">龟派气功</a></li>
		<li><a th:href="@{/level3/3}">独孤九剑</a></li>
	</ul>
</div>


</body>
</html>
```

```
//login.html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">欢迎登陆武林秘籍管理系统</h1>
	<hr>
	<div align="center">
		<form th:action="@{/userlogin}" method="post">
			用户名:<input name="user"/><br>
			密码:<input name="pwd"><br/>
			<input type="checkbox" name="remeber"> 记住我<br/>
			<input type="submit" value="登陆">
		</form>
	</div>
</body>
</html>
```

![1567682483068](assets/1567682483068.png)

springboot与分布式

zookeeper与dubbo

provider的pom添加一下依赖

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.1.7.RELEASE</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.day01</groupId>
    <artifactId>provider-ticket</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>provider-ticket</name>
    <description>Demo project for Spring Boot</description>

    <properties>
        <spring-boot.version>2.1.1.RELEASE</spring-boot.version>
        <dubbo.version>2.7.3</dubbo.version>
    </properties>


    <dependencies>
        <!-- Dubbo Spring Boot Starter -->
        <dependency>
            <groupId>org.apache.dubbo</groupId>
            <artifactId>dubbo-spring-boot-starter</artifactId>
            <version>2.7.3</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>

        <!-- https://mvnrepository.com/artifact/com.101tec/zkclient -->
        <dependency>
            <groupId>com.101tec</groupId>
            <artifactId>zkclient</artifactId>
            <version>0.10</version>
        </dependency>


        <dependency>
            <groupId>org.apache.curator</groupId>
            <artifactId>curator-framework</artifactId>
            <version>2.8.0</version>
        </dependency>
        <dependency>
            <groupId>org.apache.curator</groupId>
            <artifactId>curator-recipes</artifactId>
            <version>2.8.0</version>
        </dependency>

    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>

</project>

```

配置文件

```
dubbo.application.name=provider-ticket
dubbo.registry.address=zookeeper://172.20.10.4:2181
dubbo.scan.base-packages=com.day01.ticket.service

```

![1567690690009](assets/1567690690009.png)

添加service并实现方法

```
import org.apache.dubbo.config.annotation.Service;
import org.springframework.stereotype.Component;
@Component
@Service
public class TicketServiceImpl implements TicketService {
    @Override
    public String getTicket() {
        return "<厉害>";
    }
}
```

消费者同样添加依赖

```
<dependency>
            <groupId>org.apache.dubbo</groupId>
            <artifactId>dubbo-spring-boot-starter</artifactId>
            <version>2.7.3</version>
        </dependency>
        <dependency>
            <groupId>com.101tec</groupId>
            <artifactId>zkclient</artifactId>
            <version>0.10</version>
        </dependency>
        <dependency>
            <groupId>org.apache.curator</groupId>
            <artifactId>curator-framework</artifactId>
            <version>2.8.0</version>
        </dependency>
        <dependency>
            <groupId>org.apache.curator</groupId>
            <artifactId>curator-recipes</artifactId>
            <version>2.8.0</version>
        </dependency>
```

配置文件

```
dubbo.application.name=consumer-user
dubbo.registry.address=zookeeper://172.20.10.4:2181
```

将生产者的service包放在和consumer的同包名下

![1567690990965](assets/1567690990965.png)

将ticket的service放在和consumer的service同级目录下

```
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Reference
    TicketService ticketService;

    public void hello(){
        String ticket = ticketService.getTicket();
        System.out.println("买到票了"+ticket);

    }

}
```

测试类

```
    @Autowired
    UserService userService;

    @Test
    public void contextLoads() {
        userService.hello();
    }

```

springboot与springcloud

创建eureka服务器,选择springcloud的

```
@EnableEurekaServer 配置服务器

配置文件
server:
  port: 8761
eureka:
  instance:
    hostname: euraka-server #euerka实例的主机名
  client:
    register-with-eureka: false #不把自己注册
    fetch-registry: false #不从eureka上获取注册信息
    service-url:
      dedaultZone: http://localhost:8761/eureka/
创建提供者
配置文件
server:
  port: 8002
spring:
  application:
    name: provider-ticket
eureka:
  instance:
    prefer-ip-address: true #使用ip注册
  client:
    service-url:
      dedaultZone: http://localhost:8761/eureka/
//service包
@Service
public class TicketService {

    public String getTicket(){
        System.out.println("8002");
        return "<厉害了,我的国>";
    }  
@RestController
public class TicketController {
    @Autowired
    TicketService ticketService;
    @GetMapping("/ticket")
    public String getTicket(){
        return ticketService.getTicket();
    }
}
创建消费者
配置文件
spring:
  application:
    name: consumer-user
server:
  port: 8200

eureka:
  instance:
    prefer-ip-address: true #使用ip注册
  client:
    service-url:
      dedaultZone: http://localhost:8761/eureka/
//controller层
package com.day01.consumeruser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import rx.BackpressureOverflow;

@RestController
public class UserContorller {
    @Autowired
    RestTemplate restTemplate;

    @GetMapping("/buy")
    public String buyTicket(String name){
        String s = restTemplate.getForObject("http://PROVIDER-TICKET/ticket", String.class);
        return name+"购买了票"+s;
    }
}
//主程序
package com.day01.consumeruser;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@EnableDiscoveryClient//开启发现服务功能
@SpringBootApplication
public class ConsumerUserApplication {

    public static void main(String[] args) {
        SpringApplication.run(ConsumerUserApplication.class, args);
    }
    @LoadBalanced //使用负载均衡机制
    @Bean
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }
}

```

![1567695642590](assets/1567695642590.png)

![1567696188793](assets/1567696188793.png)

![1567695466235](assets/1567695466235.png)

热部署

![1567696334410](assets/1567696334410.png)

![1567696577577](assets/1567696577577.png)

springboot与监控管理

![1567697264664](assets/1567697264664.png)

![1567697234620](assets/1567697234620.png)