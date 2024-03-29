# ssh

## struts2

![1565668314174](assets/1565668314174.png)



![1565668354894](assets/1565668354894.png)

![1565668537629](assets/1565668537629.png)

web层交表现层  mvc        struts2框架 属于表现层简化mvc结构 filter属于web层

service层 业务层

dao层数据访问层

执行顺序

![1565675885349](assets/1565675885349.png)

tomcat启动会执行web.xml文件,xml文件有strutsfilter,会初始化过滤器,内部会加载struts.xml文件,浏览器访问,过滤器得到action,访问struts.xml,new一个action,然后调用对象的方法,然后返回结果并展示.

![1565676267894](assets/1565676267894.png)

配置文件加载顺序:

![1565676706052](assets/1565676706052.png)

开发模式能够显示更多的错误信息

![1565677649989](assets/1565677649989.png)

### package的属性: 

![1565678091566](assets/1565678091566.png)

![1565678311587](assets/1565678311587.png)

![1565678518468](assets/1565678518468.png)

```
action:
			name: 动作名称,
			class: 动作类全名,
			method: 处理请求的的方法;
					1 默认是 public String excute(){
					}
					2 方法的要求:
						1 public
						2 返回值必须是String
						3 没有参数
```

![1565679059581](assets/1565679059581.png)

### action写法:

继承action的接口,struts.xml不需要写method,默认执行excute()方法,里面有常量可以用.

![1565679579398](assets/1565679579398.png)

![1565679617048](assets/1565679617048.png)

第三种:常用

第三种没有实现ecxute方法,找到父类的excute方法

![1565679647004](assets/1565679647004.png)

![1565679860508](assets/1565679860508.png)

![1565679992629](assets/1565679992629.png)

默认动作类:

![1565680207378](assets/1565680207378.png)

通配符 * 

![1565681391333](assets/1565681391333.png)

![1565681480597](assets/1565681480597.png)

动态方法的调用:

![1565681577786](assets/1565681577786.png)

![1565681853240](assets/1565681853240.png)

### result元素:

​			name和type属性

​			name属性可以不写,默认是success

![1565682007401](assets/1565682007401.png)

chain: 转发到另一个action中.

![1565683801357](assets/1565683801357.png)

转发到不同包下的action,需要依赖注入,需要<param name="namespace">/另一个包的名称</param>

![1565684149576](assets/1565684149576.png)

自定义结果类型

![1565684300088](assets/1565684300088.png)

![1565689378721](assets/1565689378721.png)

![1565689394336](assets/1565689394336.png)

属性提供get set方法.在action写参数,会自动注入属性中.

![1565689667640](assets/1565689667640.png)

![1565689726979](assets/1565689726979.png)

声名一个抽象包 并继承:

![1565695133585](assets/1565695133585.png)

![1565695178483](assets/1565695178483.png)

### action动作获取对象

![1565695509781](assets/1565695509781.png)

![1565695616313](assets/1565695616313.png)

![1565697163012](assets/1565697163012.png)

多个struts.xml配置文件

![1565697416270](assets/1565697416270.png)

获取请求参数:1 通过request

![1565697708485](assets/1565697708485.png)

![1565697927816](assets/1565697927816.png)



第二种::提供属性的set方法struts自动注入

第三种: 通过set模型:

![1565698296040](assets/1565698296040.png)

第四种方式: (最常用)通过模型驱动,在action里实现一个模型驱动接口.通过这种方式就不用写user

![1565698493679](assets/1565698493679.png)

步骤: 

![1565698841045](assets/1565698841045.png)

![1565698631846](assets/1565698631846.png)

源码分析:

![1565699046963](assets/1565699046963.png)

![1565699132974](assets/1565699132974.png)

### 数据类型转换:

![1565711882756](assets/1565711882756.png)

![1565712193867](assets/1565712193867.png)

![1565712922464](assets/1565712922464.png)

![1565713035656](assets/1565713035656.png)

类名的地址:

![1565713339237](assets/1565713339237.png)

全局数据类型转换:

![1565714284637](assets/1565714284637.png)

类的根路径指在src下.

### 回显

![1565714492819](assets/1565714492819.png)

![1565714896310](assets/1565714896310.png)

回显效果:

![1565714989433](assets/1565714989433.png)

form表单

![1565715172647](assets/1565715172647.png)

![1565718089120](assets/1565718089120.png)

回显中文化

![1565718066584](assets/1565718066584.png)

![1565718656759](assets/1565718656759.png)

![1565718820378](assets/1565718820378.png)

### 表单验证:

表单验证方式之重写validate方法:

![1565744949549](assets/1565744949549.png)

表单要用struts表单才能生效.

![1565745596761](assets/1565745596761.png)

第二种写validateRgist()方法,只对regist有用.,

第三种在其他的方法上标注@skipvalidation注解.

在xml文件中全局声明:

![1565745970369](assets/1565745970369.png)

![1565746440611](assets/1565746440611.png)

![1565746482192](assets/1565746482192.png)

在xml局部声名:

![1565746583580](assets/1565746583580.png)

```
已定义的类型
conversion validator
date validator
double validator
email validator
expression validator   
fieldexpression validator
int validator max, min
regex validator
required validator
requiredstring validator 比required好一点,有去空格的作用.
short validator
stringlength validator maxLength minLength
url validator
visitor validator
```

![1565748213815](assets/1565748213815.png)

![1565748286138](assets/1565748286138.png)

![1565748387822](assets/1565748387822.png)

![1565748662316](assets/1565748662316.png)

### 国际化读取resource文件:

![1565749834351](assets/1565749834351.png)

jsp获取国际化资源

![1565750083725](assets/1565750083725.png)

struts读取国际化资源:顺序: 局部-包级别-全局

![1565750336481](assets/1565750336481.png)

![1565750654529](assets/1565750654529.png)

包范围的资源包:

![1565750947228](assets/1565750947228.png)

![1565751205792](assets/1565751205792.png)

### 拦截器的使用:

myintercepter需要继承AbstractIntercepter

![1565751942895](assets/1565751942895.png)

xml文档声明

![1565752022871](assets/1565752022871.png)

![1565752168663](assets/1565752168663.png)

注:  在action配置了拦截器,则默认的拦截器就会失效.

登录拦截器

![1565754811157](assets/1565754811157.png)

![1565754847501](assets/1565754847501.png)

![1565754899770](assets/1565754899770.png)

![1565754950904](assets/1565754950904.png)

只对同一个包下的action有用.

![1565755184808](assets/1565755184808.png)

文件上传:

![1565764593485](assets/1565764593485.png)

![1565767880846](assets/1565767880846.png)

![1565767983542](assets/1565767983542.png)

![1565768419294](assets/1565768419294.png)

![1565769615928](assets/1565769615928.png)

中文显示

![1565769969177](assets/1565769969177.png)

![1565770022193](assets/1565770022193.png)

配置最大上传文件大小

![1565768895411](assets/1565768895411.png)

多文件上传

![1565770543782](assets/1565770543782.png)

文件下载

![1565770683331](assets/1565770683331.png)

![1565770723799](assets/1565770723799.png)

![1565770758993](assets/1565770758993.png)

动态文件名

![1565772103715](assets/1565772103715.png)

![1565772208627](assets/1565772208627.png)

filename需要提供get方法

文件名中文显示

![1565772413379](assets/1565772413379.png)

### ognl表达式

![1565772534052](assets/1565772534052.png)

![1565773130232](assets/1565773130232.png)

### contextmap

![1565773844988](assets/1565773844988.png)

在contentmap存数据

![1565774676928](assets/1565774676928.png)

![1565775564715](assets/1565775564715.png)

![1565775682738](assets/1565775682738.png)

取值

![1565775856829](assets/1565775856829.png)

![1565775884080](assets/1565775884080.png)

![1565775943643](assets/1565775943643.png)

有多个属性相同时

![1565776038803](assets/1565776038803.png)

通过索引取

![1565776113626](assets/1565776113626.png)

不写<s:property>value的值,默认是栈顶的对象. 

![1565776699494](assets/1565776699494.png)

setValue()如果栈里没有key会报错:

el表达式取值顺序![1565779873488](assets/1565779873488.png)

![1565779997658](assets/1565779997658.png)

![1565780373736](assets/1565780373736.png)

遍历

![1565780655855](assets/1565780655855.png)

![1565780704378](assets/1565780704378.png)

也可以用el表达式取

投影:

![1565780921468](assets/1565780921468.png)

![1565781064993](assets/1565781064993.png)

struts的符号

![1565781218711](assets/1565781218711.png)

![1565781259266](assets/1565781259266.png)

![1565781276178](assets/1565781276178.png)

![1565781326636](assets/1565781326636.png)

![1565781354539](assets/1565781354539.png)

![1565781884241](assets/1565781884241.png)

![1565782368803](assets/1565782368803.png)

![1565782583922](assets/1565782583922.png)

![1565782700203](assets/1565782700203.png)

主题

![1565782841575](assets/1565782841575.png)

避免表单重复提交

![1565783929242](assets/1565783929242.png)

![1565784006003](assets/1565784006003.png)

![1565784116056](assets/1565784116056.png)

