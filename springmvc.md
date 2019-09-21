# springmvc

![1566524457350](assets/1566524457350.png)

![1566527576156](assets/1566527576156.png)

![1566526533155](assets/1566526533155.png)

spring mvc流程:

导包:

![1566529478523](assets/1566529478523.png)

写配置:

web-xml配置:

```xml

	<servlet>
		<servlet-name>springDispacherServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>classpath:springmvc.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>
	
	<servlet-mapping>
		<servlet-name>springDispacherServlet</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>
```

在bean.xml配置包扫描

```
<context:component-scan base-package="com.day01.springcontroller"></context:component-scan>
```

创建控制器

![1566529729656](assets/1566529729656.png)

并且有注解

```java

@org.springframework.stereotype.Controller
public class Controller {
	@RequestMapping("/helloworld")
	public String helloworld() {
		return "/WEB-INF/pages/success.jsp";
	}
}

```

运行流程:

![1566530170889](assets/1566530170889.png)

![1566530661076](assets/1566530661076.png)

![1566530990496](assets/1566530990496.png)

### requestmapping

标在类上,指定基准路径

标在方法上,标注方法请求

![1566531400278](assets/1566531400278.png)

method 限定请求方式:

![1566531561434](assets/1566531561434.png)

value 请求方法

params 

标注携带请求参数

![1566531706605](assets/1566531706605.png)

![1566531846174](assets/1566531846174.png)

![1566531873432](assets/1566531873432.png)

headers:

规定请求头

consumes:只接受内容类型是那种的请求,规定请求头中的content-type

produces: 告诉浏览器返回的内容类型,给响应头加上content-type

requestmaping的模糊匹配功能:

模糊匹配情况下,精确优先,

![1566532737374](assets/1566532737374.png)

占位符: 路径上的占位符只能站一层路径

![1566533409679](assets/1566533409679.png)

rest风格编程

![1566533696026](assets/1566533696026.png)

通过不同的请求方式区分一个资源的增删改查

![1566534149149](assets/1566534149149.png)











获取请求参数:

![1566536448506](assets/1566536448506.png)

![1566537408058](assets/1566537408058.png)

![1566536499833](assets/1566536499833.png)

标注requestparam默认必须带参数

![1566536703964](assets/1566536703964.png)

requestheader获取请求头信息

![1566537286533](assets/1566537286533.png)

获取cookievalue

![1566537735424](assets/1566537735424.png)

原生api

![1566538391710](assets/1566538391710.png)

数据输出  :map model  ,modelmap都放在request域中

![1566540873427](assets/1566540873427.png)

![1566541010154](assets/1566541010154.png)

![1566541028644](assets/1566541028644.png)

![1566541117962](assets/1566541117962.png)

![1566541320080](assets/1566541320080.png)

modelandview

![1566541579336](assets/1566541579336.png)

![1566541823484](assets/1566541823484.png)

sessionAttributes()

![1566541973989](assets/1566541973989.png)

![1566541981750](assets/1566541981750.png)

modelAttribute()标记字段,提示mvc不用new 对象直接只用我查出来的对象

解决字段覆写问题

![1566545689421](assets/1566545689421.png)

![1566545714598](assets/1566545714598.png)

源码

![1566546676207](assets/1566546676207.png)

```java
protected void doDispatch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpServletRequest processedRequest = request;
		HandlerExecutionChain mappedHandler = null;
		boolean multipartRequestParsed = false;

		WebAsyncManager asyncManager = WebAsyncUtils.getAsyncManager(request);

		try {
			ModelAndView mv = null;
			Exception dispatchException = null;

			try {
				processedRequest = checkMultipart(request);
				multipartRequestParsed = (processedRequest != request);

				// Determine handler for the current request.
				mappedHandler = getHandler(processedRequest);
				if (mappedHandler == null || mappedHandler.getHandler() == null) {
					noHandlerFound(processedRequest, response);
					return;
				}

				// Determine handler adapter for the current request.
				HandlerAdapter ha = getHandlerAdapter(mappedHandler.getHandler());

				// Process last-modified header, if supported by the handler.
				String method = request.getMethod();
				boolean isGet = "GET".equals(method);
				if (isGet || "HEAD".equals(method)) {
					long lastModified = ha.getLastModified(request, mappedHandler.getHandler());
					if (logger.isDebugEnabled()) {
						logger.debug("Last-Modified value for [" + getRequestUri(request) + "] is: " + lastModified);
					}
					if (new ServletWebRequest(request, response).checkNotModified(lastModified) && isGet) {
						return;
					}
				}

				if (!mappedHandler.applyPreHandle(processedRequest, response)) {
					return;
				}

				// Actually invoke the handler.
				mv = ha.handle(processedRequest, response, mappedHandler.getHandler());

				if (asyncManager.isConcurrentHandlingStarted()) {
					return;
				}

				applyDefaultViewName(processedRequest, mv);
				mappedHandler.applyPostHandle(processedRequest, response, mv);
			}
			catch (Exception ex) {
				dispatchException = ex;
			}
			catch (Throwable err) {
				// As of 4.3, we're processing Errors thrown from handler methods as well,
				// making them available for @ExceptionHandler methods and other scenarios.
				dispatchException = new NestedServletException("Handler dispatch failed", err);
			}
			processDispatchResult(processedRequest, response, mappedHandler, mv, dispatchException);
		}
		catch (Exception ex) {
			triggerAfterCompletion(processedRequest, response, mappedHandler, ex);
		}
		catch (Throwable err) {
			triggerAfterCompletion(processedRequest, response, mappedHandler,
					new NestedServletException("Handler processing failed", err));
		}
		finally {
			if (asyncManager.isConcurrentHandlingStarted()) {
				// Instead of postHandle and afterCompletion
				if (mappedHandler != null) {
					mappedHandler.applyAfterConcurrentHandlingStarted(processedRequest, response);
				}
			}
			else {
				// Clean up any resources used by a multipart request.
				if (multipartRequestParsed) {
					cleanupMultipart(processedRequest);
				}
			}
		}
	}
```

九大组件

![1566549791944](assets/1566549791944.png)

![1566552814737](assets/1566552814737.png)

![1566551028782](assets/1566551028782.png)

![1566553505030](assets/1566553505030.png)

![1566554575080](assets/1566554575080.png)

视图解析

forword转发不会拼串.

![1566555450816](assets/1566555450816.png)

![1566555545174](assets/1566555545174.png)

![1566555636696](assets/1566555636696.png)

redirect

![1566555799226](assets/1566555799226.png)

![1566555936282](assets/1566555936282.png)

视图解析原理

![1566564496302](assets/1566564496302.png)

![1566564564632](assets/1566564564632.png)

![1566565879787](assets/1566565879787.png)

![1566565916457](assets/1566565916457.png)

自定义视图解析器

实现view的接口



默认静态资源访问设置

![1566574592771](assets/1566574592771.png)

![1566574620047](assets/1566574620047.png)

数据转换和数据格式化,数据校验

webdatabinder 数据绑定器,负责数据的校验和绑定,

conversionservice负责数据的格式化. validata负责数据的校验,bingingresukt负责数据校验和保存的错误.

![1566576138341](assets/1566576138341.png)

![1566576218712](assets/1566576218712.png)

自定义数据转换.

步骤:

conversionService 是一个接口

里面有converter(转换器)工作

![1566576920525](assets/1566576920525.png)

第一步:实现converter接口

两个泛型,将什么转换成什么

2 converter 是conversionService 中的组件

​		2 将converter放进conversionService中

​		3 将webdatabinder 中的conversionService设置成我们这个加了自定义类型转换的的conversionServcie 

配置:

1 告用我们自己定义的诉springmvc别用自定义的,

![1566577469538](assets/1566577469538.png)

2 让spring用conversionService

![1566577513924](assets/1566577513924.png)

总结, 1 实现converter接口,2配置conversionService,3 rangspring用

### annotation-driven

![1566577887185](assets/1566577887185.png)

没听懂

数据格式化

data数据默认为2019/12/12

只需要一个注解

![1566584508529](assets/1566584508529.png)

注意,自定义类型转换器和默认类型转换器配置

以后写自定义类型转换器时,既有自定义类型转换器,还有格式化数据

![1566584717716](assets/1566584717716.png)

![1566584858621](assets/1566584858621.png)

数据校验

1 可以写程序让我们每一个数据进行校验 ,如果失败直接来到登录页面

2 spring mvc  提供jsr303 来做数据校验

jsr303 规范, hibernate validdator 规范

3 如何快速进行后端校验

导包

![1566730927498](assets/1566730927498.png)

2 加注解

3 在springmvc 中告诉

![1566731179869](assets/1566731179869.png)

4 如何知道校验结果

紧跟一个bindingresult

![1566732065198](assets/1566732065198.png)

![1566735010346](assets/1566735010346.png)

![1566735050467](assets/1566735050467.png)

![1566735381152](assets/1566735381152.png)

ajax请求

导包jason

![1566737510597](assets/1566737510597.png)

![1566742818405](assets/1566742818405.png)

![1566742986712](assets/1566742986712.png)

![1566743166754](assets/1566743166754.png)

![1566743384267](assets/1566743384267.png)

文件下载

![1566743710182](assets/1566743710182.png)

![1566743701163](assets/1566743701163.png)

文件上传

![1566746745024](assets/1566746745024.png)

多文件上传

![1566748449926](assets/1566748449926.png)

![1566748431457](assets/1566748431457.png)

拦截器

拦截器在目标运行之前或之后运行的东西

![1566749970640](assets/1566749970640.png)

preHandle 拦截之前 在目标运行之前调用,返回boolean return true 放行,return false 不放行

postHandle 运行之后调用,目标方法运行之后

afterCompletion() 请求完成后,来到目标页面之后,chain.dofilter()放行

拦截器是一个接口

implement 

注册拦截器

![1566750699378](assets/1566750699378.png)

![1566750783157](assets/1566750783157.png)

只要放行afterCompletion都执行

多个拦截器

![1566751032721](assets/1566751032721.png)

![1566751146837](assets/1566751146837.png)

![1566751193954](assets/1566751193954.png)

国际化

![1566752320008](assets/1566752320008.png)

![1566752725351](assets/1566752725351.png)

![1566752698339](assets/1566752698339.png)

中英文切换

![1566753689785](assets/1566753689785.png)

![1566753570273](assets/1566753570273.png)

![1566753648244](assets/1566753648244.png)

![1566753543778](assets/1566753543778.png)

异常处理

![1566755565504](assets/1566755565504.png)

![1566755549562](assets/1566755549562.png)

集中处理异常需要加到ioc容器中

![1566755753284](assets/1566755753284.png)

自定义异常

![1566756154003](assets/1566756154003.png)

![1566756163726](assets/1566756163726.png)

执行流程

![1566757321085](assets/1566757321085.png)

![1566757370230](assets/1566757370230.png)

![1566757532010](assets/1566757532010.png)

spring-springmvc 整合

分工明确; springmvc配置文件和网站逻辑及网站功能有关

spring 配置文件来配置和业务有关的

### spring 发送put请求配置

![1567041971406](assets/1567041971406.png)

只能用ajax直接发送put请求

