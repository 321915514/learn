```mysql
create table shop(
     id int unsigned not null  auto_increment primary key ,
     name varchar(20) not null ,
     price decimal(4,2) not null default 0.00 ,
     others text not null
     );
```

```mysql
select distinct password from users;
select user_name,age from users where id>3;
insert into users (user_name,password,age,email,fee,create_at)values('liming','2342',23,'y2734tr72',123.78,20130627);
select user_name,id from users order by id desc(降序)/asc(升序);
select count(*)/计数 from users;
select sum/avg/max/min(age) as sum from users;
alter table users add/modify sex tinyint unsigned not null default 0 comment'0男1女' after age;
select student.name, student.age,grade.grade from student,grade where grade.stu_id=student.id ;
select student.name,grade.grade from student left join grade on grade.stu_id=student.id ;
create trigger ming afer/before insert(update) delete on biaoming for each row begin  sql语句 end;
```

```
主键primary key(字段);
唯一unique(字段);
全文索引fulltext();
外键索引foreign key();
键key/index;
 show index from user;查询索引；
```



```
create table mark(
    -> id int unsigned not null auto_increment,
    -> mark int not null,
    -> stu_id int unsigned not null,
    -> primary key(id),
    -> foreign key(stu_id) references user(id)(外键索引必须和所关联的主键定义一致)。-> );变量：
	
```

```sql
1.set @变量名 =表达式。
2.{declare 变量名 类型 【default 默认值】
,set 变量名=值}
3.select @变量名:=值；
4.select 表达式 into 变量；
```

```
  create table user(
    -> id int unsigned not null   auto_increment ,
    -> user_name varchar(32) not null,
    -> age tinyint unsigned  not null,
    -> primary key(id),
    -> unique(user_name)
    -> );
```









视图：

```
create view 表名 as 查询语句。
```

变量：
		


视图：

```
create view 表名 as 查询语句。
```

​	

show variables like '%profiling%';
视图：
create view 表名 as 查询语句。
变量：
	1.set @变量名 =表达式。
	

语句块：

```
begin
...
end;
条件语句：
 if 条件 then
 代码
 end if;
if 条件 then
 代码1
 else
 代码2
 end if;
```

 存储过程：

```
 create procedure 名字（参数1，参数2，）
 begin
 	代码
 end
```

 改变提交符：
 	delimiter 符号

![1563070581041](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563070581041.png)



 存储过程：

```
 create procedure 名字（参数1，参数2，）
 begin
 	代码
 end
```

具体语句：
	查看过程：

```
	show procedure status;
```



```

	create procedure p1(n int)
	begin
	if n=1 then
	select 'spring' as 'season';
	elseif n=2 then
	select 'summer' as 'season';
	elseif n=3 then
	select 'autumn' as 'season';
	elseif n=4 then
	select 'winter' as 'season';
	else
	select wufawutian as season;
	end if;
	end&
```

​	调用： call 存储过程名字（参数）

![](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563070199717.png)

csae 判断

```mysql
case 变量
when 值 then 语句；
when 值 then 语句；
else 语句；
end case；
```

删除存储过程；

​	

```
drop  procedure p1&
```

![1563071204598](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563071204598.png)

case实现：

```mysql
create procedure p2(n int)
	begin
	case n
	when 1 then select 'spring' as 'season';
	when 2 then select 'summer' as 'season';
	when 3 then select 'autumn' as 'season';
	when 4 then select 'winter' as 'season';
	else select 'wufawutian' as 'season';
	end case;
	end&
```

![](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563071677164.png)

循环

1.loop循环

```
标签名:loop

leave 标签名  --退出循环

end loop；
```

2.while 循环

```
[标签:]while 条件 do
	代码
end while;
```

3.repeat循环

```
repeat
	代码
until 条件 end repeat;
```

使用loop循环，完成1到n的循环：

```
create procedure p3(n int)
begin
declare i int default 1;
declare s int default 0;
aa:loop
	set s=s+i;
	set i=i+1;
	if i>n then
	leave aa;
	end if;
end loop;
select s;
end&
```

![1563072759743](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563072759743.png)

while

```
create procedure p3(n int)
begin
declare i int default 1;
declare s int default 0;
while i<=n do
	set s=s+i;
	set i=i+1;
end while;
select s;
end&
```

![1563073118505](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563073118505.png)

repeat

```
create procedure p4(n int)
begin
declare i int default 1;
declare s int default 0;
repeat
	set s=s+i;
	set i=i+1;
until i>n end repeat;
select s;
end&
```

![1563073278075](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563073278075.png)

存储过程：

```
 create procedure 名字（参数1，参数2，）
 begin
 	代码
 end
```

```
create procedure p5( str varchar(1))
begin
if str='h' then
select username from test where id>40;
else
select username from test where id<=40;
end if;
end&
```

![1563074467484](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563074467484.png)

![1563074498251](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563074498251.png)

复杂过程：

```
create procedure p6(in n int,out re int)
begin
set re=n*n;
end&
```

![1563075174584](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563075174584.png)

```mysql
create procedure p7(inout n int)
begin
set n=n*n;
end&
```

![1563075412087](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563075412087.png)

函数：

语法

```mysql
create function 函数名(参数) return 返回值类型
begin
	代码
end
```

```mysql
create function f1(a int,b int) returns int
begin
	return a+b;
end&
```

```mysql
create function he(n int) returns int
begin
	declare i int default 1;
	declare s int default 0;
	while i<=n do
		set s=s+i;
		set i=i+1;
	end while;
	return s;
end&
```

![1563076739509](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563076739509.png)

![1563076757256](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563076757256.png)

系统函数：

```mysql
select rand();
select * from  teat order by rand() limit 2;
select floor(3.9)
select ceil(3.1);
select round(3.5)四舍五入
select ucase/length/char_length/replace('i am boy')转大写
select length(trim('  abc  '))trim去空格
select lcase('HHH')转小写
截取字符串：
select left/right('asasasa',3)
select substring('asasasa',3,2)从1开始
select concat('asasasa','adad')连接
select coalesce(null,123);
coalesce(str1,str2)若str1为空，则显示str2
日期：
select unix_timestamp();
select from_unixtime(unix_timestamp());
select now();
select year/day/month/hour/(now());
select curdate();
select datediff(now(),'1997-10-8');
```

![1563078214433](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563078214433.png)

![1563078468501](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563078468501.png)

![1563078974039](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563078974039.png)

![1563079047202](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563079047202.png)

![1563079181058](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563079181058.png)

取出昨天的日期：

```mysql
select date_sub(curdate(),interval 1 day);
select date_add(curdate(),interval -1 day);
取明天：
select date_sub(curdate(),interval -1 day);
select date_add(curdate(),interval 1 day);
```

![1563088564035](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563088564035.png)

存入时间：

![1563091068522](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563091068522.png)

![1563091111042](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563091111042.png)

![1563091233309](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563091233309.png)

触发器：

```mysql
create trigger trigger_name
after/before insert/update/delete/ on 表名
for each row
begin
	sql语句：(一句或多句)
end
```

例子：

```mysql
create trigger t1
after insert on b_order
for each row
begin
	update book set b_num=b_num-new.much where 		b_id=new.book_id;
end
```

![1563112970466](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563112970466.png)

![1563113008230](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563113008230.png)

```mysql
create trigger t2
after delete on b_order
for each row
begin
	update book set b_num=b_num+old.much where 		b_id=old.book_id;
end
```

![1563113491607](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563113491607.png)

![1563113521171](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563113521171.png)

![1563113654075](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563113654075.png)

![1563113584280](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563113584280.png)

```
create trigger t3
after update on b_order
for each row
begin
	update book set b_num=b_num+old.much where b_id=old.book_id;
	update book set b_num=b_num-new.much where b_id=new.book_id;
end
//完成修改的思路
//1.撤销订单book表恢复
//2.重新下单book表减少
```

![1563115294989](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563115294989.png)

![1563115358123](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563115358123.png)

![1563115374136](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563115374136.png)

![1563115441562](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\1563115441562.png)

