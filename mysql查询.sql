表的准备:
create table goods (
  goods_id mediumint(8) unsigned primary key auto_increment,
  goods_name varchar(120) not null default '',
  cat_id smallint(5) unsigned not null default '0',
  brand_id smallint(5) unsigned not null default '0',
  goods_sn char(15) not null default '',
  goods_number smallint(5) unsigned not null default '0',
  shop_price decimal(10,2) unsigned not null default '0.00',
  market_price decimal(10,2) unsigned not null default '0.00',
  click_count int(10) unsigned not null default '0'
) engine=myisam default charset=utf8;
insert into `goods` values (1,'kd876',4,8,'ecs000000',1,1388.00,1665.60,9),
(4,'诺基亚n85原装充电器',8,1,'ecs000004',17,58.00,69.60,0),
(3,'诺基亚原装5800耳机',8,1,'ecs000002',24,68.00,81.60,3),
(5,'索爱原装m2卡读卡器',11,7,'ecs000005',8,20.00,24.00,3),
(6,'胜创kingmax内存卡',11,0,'ecs000006',15,42.00,50.40,0),
(7,'诺基亚n85原装立体声耳机hs-82',8,1,'ecs000007',20,100.00,120.00,0),
(8,'飞利浦9@9v',3,4,'ecs000008',1,399.00,478.79,10),
(9,'诺基亚e66',3,1,'ecs000009',4,2298.00,2757.60,20),
(10,'索爱c702c',3,7,'ecs000010',7,1328.00,1593.60,11),
(11,'索爱c702c',3,7,'ecs000011',1,1300.00,0.00,0),
(12,'摩托罗拉a810',3,2,'ecs000012',8,983.00,1179.60,13),
(13,'诺基亚5320 xpressmusic',3,1,'ecs000013',8,1311.00,1573.20,13),
(14,'诺基亚5800xm',4,1,'ecs000014',1,2625.00,3150.00,6),
(15,'摩托罗拉a810',3,2,'ecs000015',3,788.00,945.60,8),
(16,'恒基伟业g101',2,11,'ecs000016',0,823.33,988.00,3),
(17,'夏新n7',3,5,'ecs000017',1,2300.00,2760.00,2),
(18,'夏新t5',4,5,'ecs000018',1,2878.00,3453.60,0),
(19,'三星sgh-f258',3,6,'ecs000019',12,858.00,1029.60,7),
(20,'三星bc01',3,6,'ecs000020',12,280.00,336.00,14),
(21,'金立 a30',3,10,'ecs000021',40,2000.00,2400.00,4),
(22,'多普达touch hd',3,3,'ecs000022',1,5999.00,7198.80,16),
(23,'诺基亚n96',5,1,'ecs000023',8,3700.00,4440.00,17),
(24,'p806',3,9,'ecs000024',100,2000.00,2400.00,35),
(25,'小灵通/固话50元充值卡',13,0,'ecs000025',2,48.00,57.59,0),
(26,'小灵通/固话20元充值卡',13,0,'ecs000026',2,19.00,22.80,0),
(27,'联通100元充值卡',15,0,'ecs000027',2,95.00,100.00,0),
(28,'联通50元充值卡',15,0,'ecs000028',0,45.00,50.00,0),
(29,'移动100元充值卡',14,0,'ecs000029',0,90.00,0.00,0),
(30,'移动20元充值卡',14,0,'ecs000030',9,18.00,21.00,1),
(31,'摩托罗拉e8 ',3,2,'ecs000031',1,1337.00,1604.39,5),
(32,'诺基亚n85',3,1,'ecs000032',4,3010.00,3612.00,9);
create table category (
cat_id smallint unsigned auto_increment primary key,
cat_name varchar(90) not null default '',
parent_id smallint unsigned
)engine myisam charset utf8;
INSERT INTO `category` VALUES
(1,'手机类型',0),
(2,'CDMA手机',1),
(3,'GSM手机',1),
(4,'3G手机',1),
(5,'双模手机',1),
(6,'手机配件',0),
(7,'充电器',6),
(8,'耳机',6),
(9,'电池',6),
(11,'读卡器和内存卡',6),
(12,'充值卡',0),
(13,'小灵通/固话充值卡',12),
(14,'移动手机充值卡',12),
(15,'联通手机充值卡',12);
CREATE TABLE `result` (
  `name` varchar(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `score` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
insert into result
values
('张三','数学',90),
('张三','语文',50),
('张三','地理',40),
('李四','语文',55),
('李四','政治',45),
('王五','政治',30);
create table a (
id char(1),
num int
)engine myisam charset utf8;
insert into a values ('a',5),('b',10),('c',15),('d',10);
create table b (
id char(1),
num int
)engine myisam charset utf8;
insert into b values ('b',5),('c',15),('d',20),('e',99);
create table m(
     mid int,
     hid int,
     gid int,
     mres varchar(10),
     matime date
)engine myisam charset utf8;
create table t (
     tid int,
     tname varchar(20)
)engine myisam charset utf8;
insert into m
     values
     (1,1,2,'2:0','2006-05-21'),
     (2,2,3,'1:2','2006-06-21'),
     (3,3,1,'2:5','2006-06-25'),
     (4,2,1,'3:2','2006-07-21');
insert into t
     values
     (1,'国安'),
     (2,'申花'),
     (3,'布尔联队');
create table mian ( num int) engine myisam;
insert into mian values
(3),
(12),
(15),
(25),
(23),
(29),
(34),
(37),
(32);
create table user (
uid int primary key auto_increment,
name varchar(20) not null default '',
age smallint unsigned not null default 0
) engine myisam charset utf8;
create table boy (
    hid char(1),
     bname varchar(20)
)engine myisam charset utf8;
insert into boy (bname,hid)
     values
     ('屌丝','A'),
     ('杨过','B'),
     ('陈冠希','C');
create table girl (
    hid char(1),
     gname varchar(20)
     )engine myisam charset utf8;
insert into girl(gname,hid)
     values
     ('小龙女','B'),
     ('张柏芝','C'),
     ('死宅女','D');



mysql> select goods_name,goods_id, concat("HTC",substring(goods_name,4)) as name from goods where goods_name like "诺基亚%";
+----------------------------------------+----------+----------------------------------+
| goods_name                             | goods_id | name                             |
+----------------------------------------+----------+----------------------------------+
| 诺基亚n85原装充电器                    |        4 | HTCn85原装充电器                 |
| 诺基亚原装5800耳机                     |        3 | HTC原装5800耳机                  |
| 诺基亚n85原装立体声耳机hs-82           |        7 | HTCn85原装立体声耳机hs-82        |
| 诺基亚e66                              |        9 | HTCe66                           |
| 诺基亚5320 xpressmusic                 |       13 | HTC5320 xpressmusic              |
| 诺基亚5800xm                           |       14 | HTC5800xm                        |
| 诺基亚n96                              |       23 | HTCn96                           |
| 诺基亚n85                              |       32 | HTCn85                           |
+----------------------------------------+----------+----------------------------------+
8 rows in set (0.00 sec)

mysql> select * from mian
    -> ;
+------+
| num  |
+------+
|    3 |
|   12 |
|   15 |
|   20 |
|   20 |
|   20 |
|   30 |
|   30 |
|   30 |
+------+
9 rows in set (0.00 sec)

mysql> #取出第三个栏目下价格小于1000或者大于3000 同时点击量大于5的商品
mysql> select goods_id ,goods_name, shop_price,cat_id,click_count from goods where cat_id=3 and (shop_price<1000 || shop_price>3000) and click_count >=5 ; 
+----------+-------------------+------------+--------+-------------+
| goods_id | goods_name        | shop_price | cat_id | click_count |
+----------+-------------------+------------+--------+-------------+
|        8 | 飞利浦9@9v        |     399.00 |      3 |          10 |
|       12 | 摩托罗拉a810      |     983.00 |      3 |          13 |
|       15 | 摩托罗拉a810      |     788.00 |      3 |           8 |
|       19 | 三星sgh-f258      |     858.00 |      3 |           7 |
|       20 | 三星bc01          |     280.00 |      3 |          14 |
|       22 | 多普达touch hd    |    5999.00 |      3 |          16 |
|       32 | 诺基亚n85         |    3010.00 |      3 |           9 |
+----------+-------------------+------------+--------+-------------+
7 rows in set (0.00 sec)

mysql> #最贵的商品的价格
mysql> select max(shop_price) from goods;
+-----------------+
| max(shop_price) |
+-----------------+
|         5999.00 |
+-----------------+
1 row in set (0.06 sec)

mysql> #查询最便宜的商品的价格
mysql> select min(shop_price) from goods ;
+-----------------+
| min(shop_price) |
+-----------------+
|           18.00 |
+-----------------+
1 row in set (0.00 sec)

mysql> #查出最旧的商品
mysql> select min(goods_id) from goods;
+---------------+
| min(goods_id) |
+---------------+
|             1 |
+---------------+
1 row in set (0.10 sec)

mysql> #goods_number是库存量
mysql> select sum(goods_number) from goods
    -> ;
+-------------------+
| sum(goods_number) |
+-------------------+
|               313 |
+-------------------+
1 row in set (0.00 sec)

mysql> #查看自己店里的商品的平均价格

mysql> select avg(shop_price) from goods;
+-----------------+
| avg(shop_price) |
+-----------------+
|     1232.526774 |
+-----------------+
1 row in set (0.00 sec)

mysql> #统计多少种商品
mysql> select count(*) from goods;
+----------+
| count(*) |
+----------+
|       31 |
+----------+
1 row in set (0.00 sec)

mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| a                |
| b                |
| boy              |
| category         |
| girl             |
| goods            |
| m                |
| mian             |
| result           |
| t                |
| user             |
+------------------+
11 rows in set (0.17 sec)

mysql> select * from t;
+------+--------------+
| tid  | tname        |
+------+--------------+
|    1 | 国安         |
|    2 | 申花         |
|    3 | 布尔联队     |
+------+--------------+
3 rows in set (0.06 sec)

mysql> #select count(*) from 表名,表示查询的是绝对的行数,哪怕某一行所有字段全为null的时候也能计算在内,
mysql> #而select count(字段) from 表名 查询的是该列不为null的所有行的行数
mysql> #用count(*)和count(1) 那个好,对于myisamm的表咩有区别,这种引擎计数器在维护,innodb的用count(*))直接读行数,效率很低
mysql> #计算第三个栏目下所有商品的库存量之和
mysql> select sum(goods_number) from goods where cat_id =3;
+-------------------+
| sum(goods_number) |
+-------------------+
|               203 |
+-------------------+
1 row in set (0.00 sec)

mysql> #计算每个栏目下的库存量之和
mysql> select cat_id, sum(goods_number) from goods  group by cat_id ;
+--------+-------------------+
| cat_id | sum(goods_number) |
+--------+-------------------+
|      4 |                 3 |
|      8 |                61 |
|     11 |                23 |
|      3 |               203 |
|      2 |                 0 |
|      5 |                 8 |
|     13 |                 4 |
|     15 |                 2 |
|     14 |                 9 |
+--------+-------------------+
9 rows in set (0.05 sec)

mysql> #having 筛选
mysql> #查询每种商品积压的货款
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bookstore          |
| clouddb01          |
| clouddb02          |
| clouddb03          |
| information_schema |
| mydb               |
| mysql              |
| performance_schema |
| shop               |
| ssm_crud           |
| struts             |
| student            |
| sys                |
| test               |
| test01             |
+--------------------+
15 rows in set (0.00 sec)

mysql> #查询每种商品积压的货款
mysql> select market_price,shop_price, market_price-shop_price as discount from goods where 1 having discount >200;
ERROR 1046 (3D000): No database selected
mysql> use test01;
Database changed

mysql> #查询每种商品积压的货款
mysql> #提示: 商品的库存量*价格

mysql> select goods_id ,shop_price,goods_number*shop_price as hk from goods;
+----------+------------+-----------+
| goods_id | shop_price | hk        |
+----------+------------+-----------+
|        1 |    1388.00 |   1388.00 |
|        4 |      58.00 |    986.00 |
|        3 |      68.00 |   1632.00 |
|        5 |      20.00 |    160.00 |
|        6 |      42.00 |    630.00 |
|        7 |     100.00 |   2000.00 |
|        8 |     399.00 |    399.00 |
|        9 |    2298.00 |   9192.00 |
|       10 |    1328.00 |   9296.00 |
|       11 |    1300.00 |   1300.00 |
|       12 |     983.00 |   7864.00 |
|       13 |    1311.00 |  10488.00 |
|       14 |    2625.00 |   2625.00 |
|       15 |     788.00 |   2364.00 |
|       16 |     823.33 |      0.00 |
|       17 |    2300.00 |   2300.00 |
|       18 |    2878.00 |   2878.00 |
|       19 |     858.00 |  10296.00 |
|       20 |     280.00 |   3360.00 |
|       21 |    2000.00 |  80000.00 |
|       22 |    5999.00 |   5999.00 |
|       23 |    3700.00 |  29600.00 |
|       24 |    2000.00 | 200000.00 |
|       25 |      48.00 |     96.00 |
|       26 |      19.00 |     38.00 |
|       27 |      95.00 |    190.00 |
|       28 |      45.00 |      0.00 |
|       29 |      90.00 |      0.00 |
|       30 |      18.00 |    162.00 |
|       31 |    1337.00 |   1337.00 |
|       32 |    3010.00 |  12040.00 |
+----------+------------+-----------+
31 rows in set (0.00 sec)

mysql> #查询该店积压的总货款
mysql> select goods_number ,sum(goods_number*shop_price) as sum from goods;
+--------------+-----------+
| goods_number | sum       |
+--------------+-----------+
|            1 | 398620.00 |
+--------------+-----------+
1 row in set (0.07 sec)

mysql> select sum(goods_number*shop_price) as sum from goods;
+-----------+
| sum       |
+-----------+
| 398620.00 |
+-----------+
1 row in set (0.00 sec)

mysql> #查询每个栏目下积压的k货款
mysql> select cat_id, sum(goods_number*shop_price) as sum from goods group by cat_id;
+--------+-----------+
| cat_id | sum       |
+--------+-----------+
|      4 |   6891.00 |
|      8 |   4618.00 |
|     11 |    790.00 |
|      3 | 356235.00 |
|      2 |      0.00 |
|      5 |  29600.00 |
|     13 |    134.00 |
|     15 |    190.00 |
|     14 |    162.00 |
+--------+-----------+
9 rows in set (0.03 sec)

mysql> #查询栏目的积压货款金额,且查出挤压金额超出20000的货款
mysql> select cat_id, sum(goods_number*shop_price) as sum from goods  group by cat_id having sum>20000;
+--------+-----------+
| cat_id | sum       |
+--------+-----------+
|      3 | 356235.00 |
|      5 |  29600.00 |
+--------+-----------+
2 rows in set (0.00 sec)

mysql> #查询本店市场价与本店价省的钱,且筛选出省钱200以上的商品
mysql> select goods_name, market_price-shop_price as discount from goods having discount>200;
ERROR 1690 (22003): DECIMAL UNSIGNED value is out of range in '(`test01`.`goods`.`market_price` - `test01`.`goods`.`shop_price`)'
mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| a                |
| b                |
| boy              |
| category         |
| girl             |
| goods            |
| m                |
| mian             |
| result           |
| t                |
| user             |
+------------------+
11 rows in set (0.14 sec)

mysql> select * from result;
+--------+---------+-------+
| name   | subject | score |
+--------+---------+-------+
| 张三   | 数学    |    90 |
| 张三   | 语文    |    50 |
| 张三   | 地理    |    40 |
| 李四   | 语文    |    55 |
| 李四   | 政治    |    45 |
| 王五   | 政治    |    30 |
+--------+---------+-------+
6 rows in set (0.07 sec)

mysql> #查询出两门及两门以上不及格者的平均成绩
mysql> select avg(score) as average ,subject from result where subject>=2  group by name having average<60;
Empty set, 6 warnings (0.00 sec)

mysql> select avg(score) as average ,subject from result group by name;
+---------+---------+
| average | subject |
+---------+---------+
| 60.0000 | 数学    |
| 50.0000 | 语文    |
| 30.0000 | 政治    |
+---------+---------+
3 rows in set (0.00 sec)

mysql> select avg(score) as average ,name from result group by name;
+---------+--------+
| average | name   |
+---------+--------+
| 60.0000 | 张三   |
| 50.0000 | 李四   |
| 30.0000 | 王五   |
+---------+--------+
3 rows in set (0.00 sec)


mysql> select avg(score) as average ,name from result where 1  group by name;
+---------+--------+
| average | name   |
+---------+--------+
| 60.0000 | 张三   |
| 50.0000 | 李四   |
| 30.0000 | 王五   |
+---------+--------+
3 rows in set (0.00 sec)

mysql> select avg(score) as average ,name from result where 1  group by name having average<60 ;
+---------+--------+
| average | name   |
+---------+--------+
| 50.0000 | 李四   |
| 30.0000 | 王五   |
+---------+--------+
2 rows in set (0.00 sec)


mysql> select avg(score) as average ,name from result where score<60  group by name having avg(average) ;
Empty set (0.00 sec)

mysql> select avg(score<60) as average ,name from result where 1  group by name having avg(average) ;
Empty set (0.00 sec)

mysql> select avg(score<60) as average ,name from result where 1  group by name ;
+---------+--------+
| average | name   |
+---------+--------+
|  0.6667 | 张三   |
|  1.0000 | 李四   |
|  1.0000 | 王五   |
+---------+--------+
3 rows in set (0.00 sec)

mysql> select avg(score) as average ,name from result where score<60  group by name ;
+---------+--------+
| average | name   |
+---------+--------+
| 45.0000 | 张三   |
| 50.0000 | 李四   |
| 30.0000 | 王五   |
+---------+--------+
3 rows in set (0.00 sec)

mysql> select avg(score) as average ,name from result where subject>=2  group by name ;
Empty set, 6 warnings (0.00 sec)

mysql> select avg(score) as average ,name,count(subject) from result where score<60  group by name ;
+---------+--------+----------------+
| average | name   | count(subject) |
+---------+--------+----------------+
| 45.0000 | 张三   |              2 |
| 50.0000 | 李四   |              2 |
| 30.0000 | 王五   |              1 |
+---------+--------+----------------+
3 rows in set (0.00 sec)


mysql> select avg(score) as average ,name,count(subject) as subject from result where score<60   group by name having subject>=2  ;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 45.0000 | 张三   |       2 |
| 50.0000 | 李四   |       2 |
+---------+--------+---------+
2 rows in set (0.00 sec)


mysql> select avg(score) as average ,name,count(subject) as subject from result where score<60   group by name having subject>=2 and avg(average);
Empty set (0.00 sec)


mysql> select avg(score) as average ,name,count(subject)>=2 as subject from result where score<60   group by name having avg(average);
Empty set (0.00 sec)


mysql> select avg(score) as average ,name,count(subject) as subject from result where score<60   group by name having subject>=2;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 45.0000 | 张三   |       2 |
| 50.0000 | 李四   |       2 |
+---------+--------+---------+
2 rows in set (0.00 sec)


mysql> select avg(score) as average ,name from result where score<60  group by name ;
+---------+--------+
| average | name   |
+---------+--------+
| 45.0000 | 张三   |
| 50.0000 | 李四   |
| 30.0000 | 王五   |
+---------+--------+
3 rows in set (0.00 sec)

mysql> select avg(score) as average ,name,count(subject) from result where score<60  group by name ;
+---------+--------+----------------+
| average | name   | count(subject) |
+---------+--------+----------------+
| 45.0000 | 张三   |              2 |
| 50.0000 | 李四   |              2 |
| 30.0000 | 王五   |              1 |
+---------+--------+----------------+
3 rows in set (0.00 sec)

mysql> select avg(score) as average ,name,count(subject)>=2 from result where score<60  group by name ;
+---------+--------+-------------------+
| average | name   | count(subject)>=2 |
+---------+--------+-------------------+
| 45.0000 | 张三   |                 1 |
| 50.0000 | 李四   |                 1 |
| 30.0000 | 王五   |                 0 |
+---------+--------+-------------------+
3 rows in set (0.00 sec)


mysql> select avg(score) as average ,name,count(subject)>=2 from result where score<60  group by name ;
+---------+--------+-------------------+
| average | name   | count(subject)>=2 |
+---------+--------+-------------------+
| 45.0000 | 张三   |                 1 |
| 50.0000 | 李四   |                 1 |
| 30.0000 | 王五   |                 0 |
+---------+--------+-------------------+
3 rows in set (0.00 sec)


mysql> select avg(score) as average ,name,count(subject) from result where score<60  group by name ;
+---------+--------+----------------+
| average | name   | count(subject) |
+---------+--------+----------------+
| 45.0000 | 张三   |              2 |
| 50.0000 | 李四   |              2 |
| 30.0000 | 王五   |              1 |
+---------+--------+----------------+
3 rows in set (0.00 sec)


mysql> select avg(score) as average ,name from result where score<60 and subject>=2   group by name ;
Empty set, 5 warnings (0.00 sec)

mysql> select avg(score) as average ,name, count(subject) from result where score<60 and subject>=2   group by name ;
Empty set, 5 warnings (0.00 sec)

mysql> select avg(score) as average ,name, count(subject) from result where score<60    group by name ;
+---------+--------+----------------+
| average | name   | count(subject) |
+---------+--------+----------------+
| 45.0000 | 张三   |              2 |
| 50.0000 | 李四   |              2 |
| 30.0000 | 王五   |              1 |
+---------+--------+----------------+
3 rows in set (0.00 sec)

mysql> select avg(score) as average ,name, count(subject) as subject from result where score<60    group by name having subject>=2  ;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 45.0000 | 张三   |       2 |
| 50.0000 | 李四   |       2 |
+---------+--------+---------+
2 rows in set (0.00 sec)

mysql> use test01
Database changed
mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| a                |
| b                |
| boy              |
| category         |
| girl             |
| goods            |
| m                |
| mian             |
| result           |
| t                |
| user             |
+------------------+
11 rows in set (0.42 sec)

mysql> select avg(score) as average ,name, count(subject) as subject from result where score<60    group by name having subject>=2  ;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 45.0000 | 张三   |       2 |
| 50.0000 | 李四   |       2 |
+---------+--------+---------+
2 rows in set (0.14 sec)

mysql> insert into resule values("赵六","语文",100),
    -> ("赵六","数学",99),
    -> ("赵六","英语",98);
ERROR 1146 (42S02): Table 'test01.resule' doesn't exist
mysql> insert into result values("赵六","语文",100),
    -> ("赵六","数学",99),
    -> ("赵六","英语",98);
Query OK, 3 rows affected (0.19 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from result;
+--------+---------+-------+
| name   | subject | score |
+--------+---------+-------+
| 张三   | 数学    |    90 |
| 张三   | 语文    |    50 |
| 张三   | 地理    |    40 |
| 李四   | 语文    |    55 |
| 李四   | 政治    |    45 |
| 王五   | 政治    |    30 |
| 赵六   | 语文    |   100 |
| 赵六   | 数学    |    99 |
| 赵六   | 英语    |    98 |
+--------+---------+-------+
9 rows in set (0.00 sec)

mysql>  select avg(score) as average ,name, count(subject) as subject from result where score<60    group by name having subject>=2;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 45.0000 | 张三   |       2 |
| 50.0000 | 李四   |       2 |
+---------+--------+---------+
2 rows in set (0.00 sec)

mysql> insert into result values("张三","英语",34);
Query OK, 1 row affected (0.05 sec)

mysql>  select avg(score) as average ,name, count(subject) as subject from result where score<60    group by name having subject>=2;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 41.3333 | 张三   |       3 |
| 50.0000 | 李四   |       2 |
+---------+--------+---------+
2 rows in set (0.00 sec)

mysql>  select avg(score) as average ,name, sum(score<60) as subject from result   group by name having subject>=2;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 53.5000 | 张三   |       3 |
| 50.0000 | 李四   |       2 |
+---------+--------+---------+
2 rows in set (0.00 sec)

mysql>  select avg(score) as average ,name, sum(score<60) as subject from result   group by name having subject>=2 order by average;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 50.0000 | 李四   |       2 |
| 53.5000 | 张三   |       3 |
+---------+--------+---------+
2 rows in set (0.00 sec)

mysql>  select avg(score) as average ,name, sum(score<60) as subject from result   group by name having subject>=2 order by desc average;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc average' at line 1
mysql>  select avg(score) as average ,name, sum(score<60) as subject from result   group by name having subject>=2 order by  average desc;
+---------+--------+---------+
| average | name   | subject |
+---------+--------+---------+
| 53.5000 | 张三   |       3 |
| 50.0000 | 李四   |       2 |
+---------+--------+---------+
2 rows in set (0.00 sec)

mysql> #降序排 order by 列名 desc 降序/asc升序
mysql>  select avg(score) as average ,name, sum(score<60) as subject from result   group by name having subject>=2 order by  add_time asc;
ERROR 1054 (42S22): Unknown column 'add_time' in 'order clause'
mysql> desc goods;
+--------------+------------------------+------+-----+---------+----------------+
| Field        | Type                   | Null | Key | Default | Extra          |
+--------------+------------------------+------+-----+---------+----------------+
| goods_id     | mediumint(8) unsigned  | NO   | PRI | NULL    | auto_increment |
| goods_name   | varchar(120)           | NO   |     |         |                |
| cat_id       | smallint(5) unsigned   | NO   |     | 0       |                |
| brand_id     | smallint(5) unsigned   | NO   |     | 0       |                |
| goods_sn     | char(15)               | NO   |     |         |                |
| goods_number | smallint(5) unsigned   | NO   |     | 0       |                |
| shop_price   | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| market_price | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| click_count  | int(10) unsigned       | NO   |     | 0       |                |
+--------------+------------------------+------+-----+---------+----------------+
9 rows in set (0.20 sec)

mysql> select goods_name ,cat_id,goods_id,shop_price from goods order by asc cat_id ,shop_price desc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'asc cat_id ,shop_price desc' at line 1
mysql> select goods_name ,cat_id,goods_id,shop_price from goods order by  cat_id asc ,shop_price desc;
+----------------------------------------+--------+----------+------------+
| goods_name                             | cat_id | goods_id | shop_price |
+----------------------------------------+--------+----------+------------+
| 恒基伟业g101                           |      2 |       16 |     823.33 |
| 多普达touch hd                         |      3 |       22 |    5999.00 |
| 诺基亚n85                              |      3 |       32 |    3010.00 |
| 夏新n7                                 |      3 |       17 |    2300.00 |
| 诺基亚e66                              |      3 |        9 |    2298.00 |
| 金立 a30                               |      3 |       21 |    2000.00 |
| p806                                   |      3 |       24 |    2000.00 |
| 摩托罗拉e8                             |      3 |       31 |    1337.00 |
| 索爱c702c                              |      3 |       10 |    1328.00 |
| 诺基亚5320 xpressmusic                 |      3 |       13 |    1311.00 |
| 索爱c702c                              |      3 |       11 |    1300.00 |
| 摩托罗拉a810                           |      3 |       12 |     983.00 |
| 三星sgh-f258                           |      3 |       19 |     858.00 |
| 摩托罗拉a810                           |      3 |       15 |     788.00 |
| 飞利浦9@9v                             |      3 |        8 |     399.00 |
| 三星bc01                               |      3 |       20 |     280.00 |
| 夏新t5                                 |      4 |       18 |    2878.00 |
| 诺基亚5800xm                           |      4 |       14 |    2625.00 |
| kd876                                  |      4 |        1 |    1388.00 |
| 诺基亚n96                              |      5 |       23 |    3700.00 |
| 诺基亚n85原装立体声耳机hs-82           |      8 |        7 |     100.00 |
| 诺基亚原装5800耳机                     |      8 |        3 |      68.00 |
| 诺基亚n85原装充电器                    |      8 |        4 |      58.00 |
| 胜创kingmax内存卡                      |     11 |        6 |      42.00 |
| 索爱原装m2卡读卡器                     |     11 |        5 |      20.00 |
| 小灵通/固话50元充值卡                  |     13 |       25 |      48.00 |
| 小灵通/固话20元充值卡                  |     13 |       26 |      19.00 |
| 移动100元充值卡                        |     14 |       29 |      90.00 |
| 移动20元充值卡                         |     14 |       30 |      18.00 |
| 联通100元充值卡                        |     15 |       27 |      95.00 |
| 联通50元充值卡                         |     15 |       28 |      45.00 |
+----------------------------------------+--------+----------+------------+
31 rows in set (0.26 sec)

mysql> #多排 用,隔开 order by cat_id asc ,shop_price desc
mysql> exit
mysql> use test01;
Database changed
mysql> #limit 限制条目
mysql> select goods_id,cat_id,goods_name,shop_price from goods where cat_id=3 order by shop_price desc limit 0,3;
+----------+--------+-------------------+------------+
| goods_id | cat_id | goods_name        | shop_price |
+----------+--------+-------------------+------------+
|       22 |      3 | 多普达touch hd    |    5999.00 |
|       32 |      3 | 诺基亚n85         |    3010.00 |
|       17 |      3 | 夏新n7            |    2300.00 |
+----------+--------+-------------------+------------+
3 rows in set (0.01 sec)

mysql> select goods_id,cat_id,goods_name,shop_price from goods where cat_id=3 order by shop_price desc limit 2,2;
+----------+--------+--------------+------------+
| goods_id | cat_id | goods_name   | shop_price |
+----------+--------+--------------+------------+
|       17 |      3 | 夏新n7       |    2300.00 |
|        9 |      3 | 诺基亚e66    |    2298.00 |
+----------+--------+--------------+------------+
2 rows in set (0.00 sec)

mysql> select goods_id,cat_id,goods_name,shop_price from goods where cat_id=3 order by shop_price desc limit 2,3;
+----------+--------+--------------+------------+
| goods_id | cat_id | goods_name   | shop_price |
+----------+--------+--------------+------------+
|       17 |      3 | 夏新n7       |    2300.00 |
|        9 |      3 | 诺基亚e66    |    2298.00 |
|       21 |      3 | 金立 a30     |    2000.00 |
+----------+--------+--------------+------------+
3 rows in set (0.00 sec)

mysql> #limit 第一个参数为0可以不写
mysql> #查询出每个栏目下id号最大的一条商品
mysql> select goods_id,cat_id,goods_name,shop_price from goods where 1 group by cat_id order by goods_id desc limit 1;
+----------+--------+-----------------------+------------+
| goods_id | cat_id | goods_name            | shop_price |
+----------+--------+-----------------------+------------+
|       29 |     14 | 移动100元充值卡       |      90.00 |
+----------+--------+-----------------------+------------+
1 row in set (0.06 sec)

mysql> select goods_id,cat_id,goods_name,shop_price from goods where 1 group by cat_id ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|        1 |      4 | kd876                          |    1388.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select goods_id,cat_id,goods_name,shop_price from goods  group by cat_id ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|        1 |      4 | kd876                          |    1388.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select cat_id,goods_name,shop_price from goods  group by cat_id ;
+--------+--------------------------------+------------+
| cat_id | goods_name                     | shop_price |
+--------+--------------------------------+------------+
|      4 | kd876                          |    1388.00 |
|      8 | 诺基亚n85原装充电器            |      58.00 |
|     11 | 索爱原装m2卡读卡器             |      20.00 |
|      3 | 飞利浦9@9v                     |     399.00 |
|      2 | 恒基伟业g101                   |     823.33 |
|      5 | 诺基亚n96                      |    3700.00 |
|     13 | 小灵通/固话50元充值卡          |      48.00 |
|     15 | 联通100元充值卡                |      95.00 |
|     14 | 移动100元充值卡                |      90.00 |
+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods   group by cat_id=3  ;
+----------+--------+---------------+------------+
| goods_id | cat_id | goods_name    | shop_price |
+----------+--------+---------------+------------+
|        1 |      4 | kd876         |    1388.00 |
|        8 |      3 | 飞利浦9@9v    |     399.00 |
+----------+--------+---------------+------------+
2 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|        1 |      4 | kd876                                  |    1388.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|       24 |      3 | p806                                   |    2000.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|       32 |      3 | 诺基亚n85                              |    3010.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods group by cat_id ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|        1 |      4 | kd876                          |    1388.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       24 |      3 | p806                                   |    2000.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|       32 |      3 | 诺基亚n85                              |    3010.00 |
|        1 |      4 | kd876                                  |    1388.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc ;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|       32 |      3 | 诺基亚n85                              |    3010.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|       24 |      3 | p806                                   |    2000.00 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|        1 |      4 | kd876                                  |    1388.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods group by cat_id  order by cat_id asc ,goods_id desc ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|        1 |      4 | kd876                          |    1388.00 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc ;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|       32 |      3 | 诺基亚n85                              |    3010.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|       24 |      3 | p806                                   |    2000.00 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|        1 |      4 | kd876                                  |    1388.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select * from (select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc) as tem group by cat_id  ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|        1 |      4 | kd876                          |    1388.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.04 sec)

mysql> select * from (select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc) as tem group by cat_id  order by cat_id asc ,goods_id desc limit 1  ;
+----------+--------+------------------+------------+
| goods_id | cat_id | goods_name       | shop_price |
+----------+--------+------------------+------------+
|       16 |      2 | 恒基伟业g101     |     823.33 |
+----------+--------+------------------+------------+
1 row in set (0.00 sec)

mysql> select * from (select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc) as tem group by cat_id  order by cat_id asc ,goods_id desc ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|        1 |      4 | kd876                          |    1388.00 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc ;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|       32 |      3 | 诺基亚n85                              |    3010.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|       24 |      3 | p806                                   |    2000.00 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|        1 |      4 | kd876                                  |    1388.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select * from (select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc) as temp order by cat_id asc ;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       24 |      3 | p806                                   |    2000.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|       32 |      3 | 诺基亚n85                              |    3010.00 |
|        1 |      4 | kd876                                  |    1388.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select * from (select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc) as temp group by cat_id order by cat_id asc ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|        1 |      4 | kd876                          |    1388.00 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select * from (select goods_id, cat_id,goods_name,shop_price from goods order by cat_id asc ,goods_id desc) as temp group by cat_id  ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|        1 |      4 | kd876                          |    1388.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)


mysql> select goods_id, cat_id,goods_name,shop_price from goods where cat_id=3 order by goods_id desc limit 1 ;
+----------+--------+--------------+------------+
| goods_id | cat_id | goods_name   | shop_price |
+----------+--------+--------------+------------+
|       32 |      3 | 诺基亚n85    |    3010.00 |
+----------+--------+--------------+------------+
1 row in set (0.07 sec)


mysql> select goods_id, cat_id,goods_name,shop_price from goods  order by goods_id desc limit 1 ;
+----------+--------+--------------+------------+
| goods_id | cat_id | goods_name   | shop_price |
+----------+--------+--------------+------------+
|       32 |      3 | 诺基亚n85    |    3010.00 |
+----------+--------+--------------+------------+
1 row in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods  order by goods_id desc limit 1 ;
+----------+--------+--------------+------------+
| goods_id | cat_id | goods_name   | shop_price |
+----------+--------+--------------+------------+
|       32 |      3 | 诺基亚n85    |    3010.00 |
+----------+--------+--------------+------------+
1 row in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods  order by goods_id desc  ;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       32 |      3 | 诺基亚n85                              |    3010.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       24 |      3 | p806                                   |    2000.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|        1 |      4 | kd876                                  |    1388.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods group by cat_id  order by goods_id desc  ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|       29 |     14 | 移动100元充值卡                |      90.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        1 |      4 | kd876                          |    1388.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods group by cat_id  ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|        1 |      4 | kd876                          |    1388.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
|       29 |     14 | 移动100元充值卡                |      90.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods group by cat_id  order by goods_id desc  ;
+----------+--------+--------------------------------+------------+
| goods_id | cat_id | goods_name                     | shop_price |
+----------+--------+--------------------------------+------------+
|       29 |     14 | 移动100元充值卡                |      90.00 |
|       27 |     15 | 联通100元充值卡                |      95.00 |
|       25 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|       23 |      5 | 诺基亚n96                      |    3700.00 |
|       16 |      2 | 恒基伟业g101                   |     823.33 |
|        8 |      3 | 飞利浦9@9v                     |     399.00 |
|        5 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|        4 |      8 | 诺基亚n85原装充电器            |      58.00 |
|        1 |      4 | kd876                          |    1388.00 |
+----------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select goods_id, cat_id,goods_name,shop_price from goods  order by goods_id desc limit 1 ;
+----------+--------+--------------+------------+
| goods_id | cat_id | goods_name   | shop_price |
+----------+--------+--------------+------------+
|       32 |      3 | 诺基亚n85    |    3010.00 |
+----------+--------+--------------+------------+
1 row in set (0.00 sec)

mysql> select max(goods_id), cat_id,goods_name,shop_price from goods  order by goods_id desc ;
+---------------+--------+------------+------------+
| max(goods_id) | cat_id | goods_name | shop_price |
+---------------+--------+------------+------------+
|            32 |      4 | kd876      |    1388.00 |
+---------------+--------+------------+------------+
1 row in set (0.06 sec)

mysql> select goods_id ,cat_id ,goods_name from goods
    -> ;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|        1 |      4 | kd876                                  |
|        4 |      8 | 诺基亚n85原装充电器                    |
|        3 |      8 | 诺基亚原装5800耳机                     |
|        5 |     11 | 索爱原装m2卡读卡器                     |
|        6 |     11 | 胜创kingmax内存卡                      |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        8 |      3 | 飞利浦9@9v                             |
|        9 |      3 | 诺基亚e66                              |
|       10 |      3 | 索爱c702c                              |
|       11 |      3 | 索爱c702c                              |
|       12 |      3 | 摩托罗拉a810                           |
|       13 |      3 | 诺基亚5320 xpressmusic                 |
|       14 |      4 | 诺基亚5800xm                           |
|       15 |      3 | 摩托罗拉a810                           |
|       16 |      2 | 恒基伟业g101                           |
|       17 |      3 | 夏新n7                                 |
|       18 |      4 | 夏新t5                                 |
|       19 |      3 | 三星sgh-f258                           |
|       20 |      3 | 三星bc01                               |
|       21 |      3 | 金立 a30                               |
|       22 |      3 | 多普达touch hd                         |
|       23 |      5 | 诺基亚n96                              |
|       24 |      3 | p806                                   |
|       25 |     13 | 小灵通/固话50元充值卡                  |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       27 |     15 | 联通100元充值卡                        |
|       28 |     15 | 联通50元充值卡                         |
|       29 |     14 | 移动100元充值卡                        |
|       30 |     14 | 移动20元充值卡                         |
|       31 |      3 | 摩托罗拉e8                             |
|       32 |      3 | 诺基亚n85                              |
+----------+--------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select max(goods_id), cat_id,goods_name,shop_price from goods group by cat_id ;
+---------------+--------+--------------------------------+------------+
| max(goods_id) | cat_id | goods_name                     | shop_price |
+---------------+--------+--------------------------------+------------+
|            18 |      4 | kd876                          |    1388.00 |
|             7 |      8 | 诺基亚n85原装充电器            |      58.00 |
|             6 |     11 | 索爱原装m2卡读卡器             |      20.00 |
|            32 |      3 | 飞利浦9@9v                     |     399.00 |
|            16 |      2 | 恒基伟业g101                   |     823.33 |
|            23 |      5 | 诺基亚n96                      |    3700.00 |
|            26 |     13 | 小灵通/固话50元充值卡          |      48.00 |
|            28 |     15 | 联通100元充值卡                |      95.00 |
|            30 |     14 | 移动100元充值卡                |      90.00 |
+---------------+--------+--------------------------------+------------+
9 rows in set (0.00 sec)

mysql> select max(goods_id), cat_id from goods group by cat_id ;
+---------------+--------+
| max(goods_id) | cat_id |
+---------------+--------+
|            18 |      4 |
|             7 |      8 |
|             6 |     11 |
|            32 |      3 |
|            16 |      2 |
|            23 |      5 |
|            26 |     13 |
|            28 |     15 |
|            30 |     14 |
+---------------+--------+
9 rows in set (0.00 sec)

mysql> select * from (select max(goods_id) as goods_id, cat_id from goods group by cat_id ) as temp where cat_id=cat_id ;
+----------+--------+
| goods_id | cat_id |
+----------+--------+
|       18 |      4 |
|        7 |      8 |
|        6 |     11 |
|       32 |      3 |
|       16 |      2 |
|       23 |      5 |
|       26 |     13 |
|       28 |     15 |
|       30 |     14 |
+----------+--------+
9 rows in set (0.06 sec)

mysql> select cat_id ,count(goods_name) from goods group by cat_id;
+--------+-------------------+
| cat_id | count(goods_name) |
+--------+-------------------+
|      4 |                 3 |
|      8 |                 3 |
|     11 |                 2 |
|      3 |                15 |
|      2 |                 1 |
|      5 |                 1 |
|     13 |                 2 |
|     15 |                 2 |
|     14 |                 2 |
+--------+-------------------+
9 rows in set (0.00 sec)

mysql> select cat_id ,max(goods_id) from goods group by cat_id;
+--------+---------------+
| cat_id | max(goods_id) |
+--------+---------------+
|      4 |            18 |
|      8 |             7 |
|     11 |             6 |
|      3 |            32 |
|      2 |            16 |
|      5 |            23 |
|     13 |            26 |
|     15 |            28 |
|     14 |            30 |
+--------+---------------+
9 rows in set (0.00 sec)


mysql> select cat_id ,max(goods_id),max(goods_name) from goods group by cat_id;
+--------+---------------+--------------------------------+
| cat_id | max(goods_id) | max(goods_name)                |
+--------+---------------+--------------------------------+
|      4 |            18 | 诺基亚5800xm                   |
|      8 |             7 | 诺基亚原装5800耳机             |
|     11 |             6 | 胜创kingmax内存卡              |
|      3 |            32 | 飞利浦9@9v                     |
|      2 |            16 | 恒基伟业g101                   |
|      5 |            23 | 诺基亚n96                      |
|     13 |            26 | 小灵通/固话50元充值卡          |
|     15 |            28 | 联通50元充值卡                 |
|     14 |            30 | 移动20元充值卡                 |
+--------+---------------+--------------------------------+
9 rows in set (0.00 sec)

mysql> select cat_id ,max(goods_id) from goods ;
+--------+---------------+
| cat_id | max(goods_id) |
+--------+---------------+
|      4 |            32 |
+--------+---------------+
1 row in set (0.00 sec)

mysql> select cat_id, goods_id,goods_name from goods order by goods_id desc ;
+--------+----------+----------------------------------------+
| cat_id | goods_id | goods_name                             |
+--------+----------+----------------------------------------+
|      3 |       32 | 诺基亚n85                              |
|      3 |       31 | 摩托罗拉e8                             |
|     14 |       30 | 移动20元充值卡                         |
|     14 |       29 | 移动100元充值卡                        |
|     15 |       28 | 联通50元充值卡                         |
|     15 |       27 | 联通100元充值卡                        |
|     13 |       26 | 小灵通/固话20元充值卡                  |
|     13 |       25 | 小灵通/固话50元充值卡                  |
|      3 |       24 | p806                                   |
|      5 |       23 | 诺基亚n96                              |
|      3 |       22 | 多普达touch hd                         |
|      3 |       21 | 金立 a30                               |
|      3 |       20 | 三星bc01                               |
|      3 |       19 | 三星sgh-f258                           |
|      4 |       18 | 夏新t5                                 |
|      3 |       17 | 夏新n7                                 |
|      2 |       16 | 恒基伟业g101                           |
|      3 |       15 | 摩托罗拉a810                           |
|      4 |       14 | 诺基亚5800xm                           |
|      3 |       13 | 诺基亚5320 xpressmusic                 |
|      3 |       12 | 摩托罗拉a810                           |
|      3 |       11 | 索爱c702c                              |
|      3 |       10 | 索爱c702c                              |
|      3 |        9 | 诺基亚e66                              |
|      3 |        8 | 飞利浦9@9v                             |
|      8 |        7 | 诺基亚n85原装立体声耳机hs-82           |
|     11 |        6 | 胜创kingmax内存卡                      |
|     11 |        5 | 索爱原装m2卡读卡器                     |
|      8 |        4 | 诺基亚n85原装充电器                    |
|      8 |        3 | 诺基亚原装5800耳机                     |
|      4 |        1 | kd876                                  |
+--------+----------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select cat_id ,max(goods_id) from goods ;
+--------+---------------+
| cat_id | max(goods_id) |
+--------+---------------+
|      4 |            32 |
+--------+---------------+
1 row in set (0.00 sec)

mysql> select cat_id, goods_id,goods_name from goods order by goods_id desc ;
+--------+----------+----------------------------------------+
| cat_id | goods_id | goods_name                             |
+--------+----------+----------------------------------------+
|      3 |       32 | 诺基亚n85                              |
|      3 |       31 | 摩托罗拉e8                             |
|     14 |       30 | 移动20元充值卡                         |
|     14 |       29 | 移动100元充值卡                        |
|     15 |       28 | 联通50元充值卡                         |
|     15 |       27 | 联通100元充值卡                        |
|     13 |       26 | 小灵通/固话20元充值卡                  |
|     13 |       25 | 小灵通/固话50元充值卡                  |
|      3 |       24 | p806                                   |
|      5 |       23 | 诺基亚n96                              |
|      3 |       22 | 多普达touch hd                         |
|      3 |       21 | 金立 a30                               |
|      3 |       20 | 三星bc01                               |
|      3 |       19 | 三星sgh-f258                           |
|      4 |       18 | 夏新t5                                 |
|      3 |       17 | 夏新n7                                 |
|      2 |       16 | 恒基伟业g101                           |
|      3 |       15 | 摩托罗拉a810                           |
|      4 |       14 | 诺基亚5800xm                           |
|      3 |       13 | 诺基亚5320 xpressmusic                 |
|      3 |       12 | 摩托罗拉a810                           |
|      3 |       11 | 索爱c702c                              |
|      3 |       10 | 索爱c702c                              |
|      3 |        9 | 诺基亚e66                              |
|      3 |        8 | 飞利浦9@9v                             |
|      8 |        7 | 诺基亚n85原装立体声耳机hs-82           |
|     11 |        6 | 胜创kingmax内存卡                      |
|     11 |        5 | 索爱原装m2卡读卡器                     |
|      8 |        4 | 诺基亚n85原装充电器                    |
|      8 |        3 | 诺基亚原装5800耳机                     |
|      4 |        1 | kd876                                  |
+--------+----------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select cat_id ,max(goods_id) from goods ;
+--------+---------------+
| cat_id | max(goods_id) |
+--------+---------------+
|      4 |            32 |
+--------+---------------+
1 row in set (0.00 sec)

mysql> select cat_id ,max(goods_id) from goods group by cat_id;
+--------+---------------+
| cat_id | max(goods_id) |
+--------+---------------+
|      4 |            18 |
|      8 |             7 |
|     11 |             6 |
|      3 |            32 |
|      2 |            16 |
|      5 |            23 |
|     13 |            26 |
|     15 |            28 |
|     14 |            30 |
+--------+---------------+
9 rows in set (0.00 sec)


mysql> select goods_id ,goods_name,cat_id from goods where goods_id in(select max(goods_id) from goods group by cat_id) ;
+----------+----------------------------------------+--------+
| goods_id | goods_name                             | cat_id |
+----------+----------------------------------------+--------+
|        6 | 胜创kingmax内存卡                      |     11 |
|        7 | 诺基亚n85原装立体声耳机hs-82           |      8 |
|       16 | 恒基伟业g101                           |      2 |
|       18 | 夏新t5                                 |      4 |
|       23 | 诺基亚n96                              |      5 |
|       26 | 小灵通/固话20元充值卡                  |     13 |
|       28 | 联通50元充值卡                         |     15 |
|       30 | 移动20元充值卡                         |     14 |
|       32 | 诺基亚n85                              |      3 |
+----------+----------------------------------------+--------+
9 rows in set (0.06 sec)

mysql> select * from(select goods_id,cat_id ,goods_name from goods order by goods_id desc ) as temp  group by cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|        1 |      4 | kd876                          |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|        8 |      3 | 飞利浦9@9v                     |
|       16 |      2 | 恒基伟业g101                   |
|       23 |      5 | 诺基亚n96                      |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       27 |     15 | 联通100元充值卡                |
|       29 |     14 | 移动100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)


mysql> select * from(select goods_id,cat_id ,goods_name from goods order by goods_id desc)  as temp  group by temp.cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|        1 |      4 | kd876                          |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|        8 |      3 | 飞利浦9@9v                     |
|       16 |      2 | 恒基伟业g101                   |
|       23 |      5 | 诺基亚n96                      |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       27 |     15 | 联通100元充值卡                |
|       29 |     14 | 移动100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)

mysql> select goods_id,cat_id ,goods_name from goods order by goods_id desc;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       32 |      3 | 诺基亚n85                              |
|       31 |      3 | 摩托罗拉e8                             |
|       30 |     14 | 移动20元充值卡                         |
|       29 |     14 | 移动100元充值卡                        |
|       28 |     15 | 联通50元充值卡                         |
|       27 |     15 | 联通100元充值卡                        |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       25 |     13 | 小灵通/固话50元充值卡                  |
|       24 |      3 | p806                                   |
|       23 |      5 | 诺基亚n96                              |
|       22 |      3 | 多普达touch hd                         |
|       21 |      3 | 金立 a30                               |
|       20 |      3 | 三星bc01                               |
|       19 |      3 | 三星sgh-f258                           |
|       18 |      4 | 夏新t5                                 |
|       17 |      3 | 夏新n7                                 |
|       16 |      2 | 恒基伟业g101                           |
|       15 |      3 | 摩托罗拉a810                           |
|       14 |      4 | 诺基亚5800xm                           |
|       13 |      3 | 诺基亚5320 xpressmusic                 |
|       12 |      3 | 摩托罗拉a810                           |
|       11 |      3 | 索爱c702c                              |
|       10 |      3 | 索爱c702c                              |
|        9 |      3 | 诺基亚e66                              |
|        8 |      3 | 飞利浦9@9v                             |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        6 |     11 | 胜创kingmax内存卡                      |
|        5 |     11 | 索爱原装m2卡读卡器                     |
|        4 |      8 | 诺基亚n85原装充电器                    |
|        3 |      8 | 诺基亚原装5800耳机                     |
|        1 |      4 | kd876                                  |
+----------+--------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select cat_id,goods_name from (select goods_id,cat_id ,goods_name from goods order by goods_id desc) as temp group by cat_id;
+--------+--------------------------------+
| cat_id | goods_name                     |
+--------+--------------------------------+
|      4 | kd876                          |
|      8 | 诺基亚n85原装充电器            |
|     11 | 索爱原装m2卡读卡器             |
|      3 | 飞利浦9@9v                     |
|      2 | 恒基伟业g101                   |
|      5 | 诺基亚n96                      |
|     13 | 小灵通/固话50元充值卡          |
|     15 | 联通100元充值卡                |
|     14 | 移动100元充值卡                |
+--------+--------------------------------+
9 rows in set (0.00 sec)

mysql> select temp.cat_id,goods_name from (select goods_id,cat_id ,goods_name from goods order by goods_id desc) as temp group by temp.cat_id;
+--------+--------------------------------+
| cat_id | goods_name                     |
+--------+--------------------------------+
|      4 | kd876                          |
|      8 | 诺基亚n85原装充电器            |
|     11 | 索爱原装m2卡读卡器             |
|      3 | 飞利浦9@9v                     |
|      2 | 恒基伟业g101                   |
|      5 | 诺基亚n96                      |
|     13 | 小灵通/固话50元充值卡          |
|     15 | 联通100元充值卡                |
|     14 | 移动100元充值卡                |
+--------+--------------------------------+
9 rows in set (0.05 sec)

mysql> #子查询
mysql> #查询商品id最大的商品不用排序
mysql> select goods_id ,cat_id ,goods_name from goods where goods_id=(select max(goods_id) from goods);
+----------+--------+--------------+
| goods_id | cat_id | goods_name   |
+----------+--------+--------------+
|       32 |      3 | 诺基亚n85    |
+----------+--------+--------------+
1 row in set (0.05 sec)

mysql> #如果where型子查询 即where 列=(内层sql 返回的是必是单行单列单个值,) 若where 列 in(内层sql)只能是单列多行
mysql> #from型子查询,内部查询的结果当作外部查询的表s
mysql> select goods_id ,cat_id ,goods_name from (select goods_id ,cat_id ,goods_name from goods order by cat_id asc,goods_id desc) as temp group by cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|        1 |      4 | kd876                          |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|        8 |      3 | 飞利浦9@9v                     |
|       16 |      2 | 恒基伟业g101                   |
|       23 |      5 | 诺基亚n96                      |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       27 |     15 | 联通100元充值卡                |
|       29 |     14 | 移动100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)

mysql> select goods_id ,cat_id ,goods_name from goods order by cat_id asc,goods_id desc;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       16 |      2 | 恒基伟业g101                           |
|       32 |      3 | 诺基亚n85                              |
|       31 |      3 | 摩托罗拉e8                             |
|       24 |      3 | p806                                   |
|       22 |      3 | 多普达touch hd                         |
|       21 |      3 | 金立 a30                               |
|       20 |      3 | 三星bc01                               |
|       19 |      3 | 三星sgh-f258                           |
|       17 |      3 | 夏新n7                                 |
|       15 |      3 | 摩托罗拉a810                           |
|       13 |      3 | 诺基亚5320 xpressmusic                 |
|       12 |      3 | 摩托罗拉a810                           |
|       11 |      3 | 索爱c702c                              |
|       10 |      3 | 索爱c702c                              |
|        9 |      3 | 诺基亚e66                              |
|        8 |      3 | 飞利浦9@9v                             |
|       18 |      4 | 夏新t5                                 |
|       14 |      4 | 诺基亚5800xm                           |
|        1 |      4 | kd876                                  |
|       23 |      5 | 诺基亚n96                              |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        4 |      8 | 诺基亚n85原装充电器                    |
|        3 |      8 | 诺基亚原装5800耳机                     |
|        6 |     11 | 胜创kingmax内存卡                      |
|        5 |     11 | 索爱原装m2卡读卡器                     |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       25 |     13 | 小灵通/固话50元充值卡                  |
|       30 |     14 | 移动20元充值卡                         |
|       29 |     14 | 移动100元充值卡                        |
|       28 |     15 | 联通50元充值卡                         |
|       27 |     15 | 联通100元充值卡                        |
+----------+--------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select * from (select goods_id ,cat_id ,goods_name from goods order by cat_id asc,goods_id desc) as temp group by cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|        1 |      4 | kd876                          |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|        8 |      3 | 飞利浦9@9v                     |
|       16 |      2 | 恒基伟业g101                   |
|       23 |      5 | 诺基亚n96                      |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       27 |     15 | 联通100元充值卡                |
|       29 |     14 | 移动100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)

mysql> select * from (select goods_id ,cat_id ,goods_name from goods order by cat_id asc,goods_id desc) as temp group by temp.cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|        1 |      4 | kd876                          |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|        8 |      3 | 飞利浦9@9v                     |
|       16 |      2 | 恒基伟业g101                   |
|       23 |      5 | 诺基亚n96                      |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       27 |     15 | 联通100元充值卡                |
|       29 |     14 | 移动100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)

mysql> select goods_id,cat_id,goods_name from (select goods_id as goods_id ,cat_id as cat_id ,goods_name as goods_name from goods order by cat_id asc,goods_id desc) as temp group by temp.cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|        1 |      4 | kd876                          |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|        8 |      3 | 飞利浦9@9v                     |
|       16 |      2 | 恒基伟业g101                   |
|       23 |      5 | 诺基亚n96                      |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       27 |     15 | 联通100元充值卡                |
|       29 |     14 | 移动100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)

mysql> select goods_id, cat_id, goods_name from (select goods_id, goods_name, cat_id from goods order by cat_id asc, goods_id desc) as tmp group by cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|        1 |      4 | kd876                          |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|        8 |      3 | 飞利浦9@9v                     |
|       16 |      2 | 恒基伟业g101                   |
|       23 |      5 | 诺基亚n96                      |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       27 |     15 | 联通100元充值卡                |
|       29 |     14 | 移动100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)

mysql> exit
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bookstore          |
| clouddb01          |
| clouddb02          |
| clouddb03          |
| information_schema |
| mydb               |
| mysql              |
| performance_schema |
| shop               |
| ssm_crud           |
| struts             |
| student            |
| sys                |
| test               |
| test01             |
+--------------------+
15 rows in set (0.35 sec)

mysql> use test01;
Database changed
mysql> select goods_id,cat_id,goods_name from goods order by goods_id desc ,cat_id asc;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       32 |      3 | 诺基亚n85                              |
|       31 |      3 | 摩托罗拉e8                             |
|       30 |     14 | 移动20元充值卡                         |
|       29 |     14 | 移动100元充值卡                        |
|       28 |     15 | 联通50元充值卡                         |
|       27 |     15 | 联通100元充值卡                        |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       25 |     13 | 小灵通/固话50元充值卡                  |
|       24 |      3 | p806                                   |
|       23 |      5 | 诺基亚n96                              |
|       22 |      3 | 多普达touch hd                         |
|       21 |      3 | 金立 a30                               |
|       20 |      3 | 三星bc01                               |
|       19 |      3 | 三星sgh-f258                           |
|       18 |      4 | 夏新t5                                 |
|       17 |      3 | 夏新n7                                 |
|       16 |      2 | 恒基伟业g101                           |
|       15 |      3 | 摩托罗拉a810                           |
|       14 |      4 | 诺基亚5800xm                           |
|       13 |      3 | 诺基亚5320 xpressmusic                 |
|       12 |      3 | 摩托罗拉a810                           |
|       11 |      3 | 索爱c702c                              |
|       10 |      3 | 索爱c702c                              |
|        9 |      3 | 诺基亚e66                              |
|        8 |      3 | 飞利浦9@9v                             |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        6 |     11 | 胜创kingmax内存卡                      |
|        5 |     11 | 索爱原装m2卡读卡器                     |
|        4 |      8 | 诺基亚n85原装充电器                    |
|        3 |      8 | 诺基亚原装5800耳机                     |
|        1 |      4 | kd876                                  |
+----------+--------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select goods_id,cat_id,goods_name from  goods order by cat_id  desc ;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       27 |     15 | 联通100元充值卡                        |
|       28 |     15 | 联通50元充值卡                         |
|       29 |     14 | 移动100元充值卡                        |
|       30 |     14 | 移动20元充值卡                         |
|       25 |     13 | 小灵通/固话50元充值卡                  |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|        5 |     11 | 索爱原装m2卡读卡器                     |
|        6 |     11 | 胜创kingmax内存卡                      |
|        4 |      8 | 诺基亚n85原装充电器                    |
|        3 |      8 | 诺基亚原装5800耳机                     |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|       23 |      5 | 诺基亚n96                              |
|        1 |      4 | kd876                                  |
|       14 |      4 | 诺基亚5800xm                           |
|       18 |      4 | 夏新t5                                 |
|        8 |      3 | 飞利浦9@9v                             |
|        9 |      3 | 诺基亚e66                              |
|       10 |      3 | 索爱c702c                              |
|       11 |      3 | 索爱c702c                              |
|       12 |      3 | 摩托罗拉a810                           |
|       13 |      3 | 诺基亚5320 xpressmusic                 |
|       15 |      3 | 摩托罗拉a810                           |
|       17 |      3 | 夏新n7                                 |
|       19 |      3 | 三星sgh-f258                           |
|       20 |      3 | 三星bc01                               |
|       21 |      3 | 金立 a30                               |
|       22 |      3 | 多普达touch hd                         |
|       24 |      3 | p806                                   |
|       31 |      3 | 摩托罗拉e8                             |
|       32 |      3 | 诺基亚n85                              |
|       16 |      2 | 恒基伟业g101                           |
+----------+--------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select goods_id,cat_id,goods_name from(select goods_id,cat_id,goods_name from goods order by cat_id,goods_id desc) as tmp;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       16 |      2 | 恒基伟业g101                           |
|       32 |      3 | 诺基亚n85                              |
|       31 |      3 | 摩托罗拉e8                             |
|       24 |      3 | p806                                   |
|       22 |      3 | 多普达touch hd                         |
|       21 |      3 | 金立 a30                               |
|       20 |      3 | 三星bc01                               |
|       19 |      3 | 三星sgh-f258                           |
|       17 |      3 | 夏新n7                                 |
|       15 |      3 | 摩托罗拉a810                           |
|       13 |      3 | 诺基亚5320 xpressmusic                 |
|       12 |      3 | 摩托罗拉a810                           |
|       11 |      3 | 索爱c702c                              |
|       10 |      3 | 索爱c702c                              |
|        9 |      3 | 诺基亚e66                              |
|        8 |      3 | 飞利浦9@9v                             |
|       18 |      4 | 夏新t5                                 |
|       14 |      4 | 诺基亚5800xm                           |
|        1 |      4 | kd876                                  |
|       23 |      5 | 诺基亚n96                              |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        4 |      8 | 诺基亚n85原装充电器                    |
|        3 |      8 | 诺基亚原装5800耳机                     |
|        6 |     11 | 胜创kingmax内存卡                      |
|        5 |     11 | 索爱原装m2卡读卡器                     |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       25 |     13 | 小灵通/固话50元充值卡                  |
|       30 |     14 | 移动20元充值卡                         |
|       29 |     14 | 移动100元充值卡                        |
|       28 |     15 | 联通50元充值卡                         |
|       27 |     15 | 联通100元充值卡                        |
+----------+--------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select goods_id,cat_id,goods_name from(select goods_id,cat_id,goods_name from goods order by cat_id,goods_id desc) as tmp group by cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|        1 |      4 | kd876                          |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|        8 |      3 | 飞利浦9@9v                     |
|       16 |      2 | 恒基伟业g101                   |
|       23 |      5 | 诺基亚n96                      |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       27 |     15 | 联通100元充值卡                |
|       29 |     14 | 移动100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)


mysql> desc goods;
+--------------+------------------------+------+-----+---------+----------------+
| Field        | Type                   | Null | Key | Default | Extra          |
+--------------+------------------------+------+-----+---------+----------------+
| goods_id     | mediumint(8) unsigned  | NO   | PRI | NULL    | auto_increment |
| goods_name   | varchar(120)           | NO   |     |         |                |
| cat_id       | smallint(5) unsigned   | NO   |     | 0       |                |
| brand_id     | smallint(5) unsigned   | NO   |     | 0       |                |
| goods_sn     | char(15)               | NO   |     |         |                |
| goods_number | smallint(5) unsigned   | NO   |     | 0       |                |
| shop_price   | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| market_price | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| click_count  | int(10) unsigned       | NO   |     | 0       |                |
+--------------+------------------------+------+-----+---------+----------------+
9 rows in set (0.18 sec)


mysql> alter table goods add index cat(cat_id);
Query OK, 31 rows affected (1.05 sec)
Records: 31  Duplicates: 0  Warnings: 0

mysql> select goods_id,cat_id,goods_name from(select goods_id,cat_id,goods_name from goods order by cat_id,goods_id desc) as tmp group by cat_id;
+----------+--------+--------------------------------+
| goods_id | cat_id | goods_name                     |
+----------+--------+--------------------------------+
|       16 |      2 | 恒基伟业g101                   |
|        8 |      3 | 飞利浦9@9v                     |
|        1 |      4 | kd876                          |
|       23 |      5 | 诺基亚n96                      |
|        4 |      8 | 诺基亚n85原装充电器            |
|        5 |     11 | 索爱原装m2卡读卡器             |
|       25 |     13 | 小灵通/固话50元充值卡          |
|       29 |     14 | 移动100元充值卡                |
|       27 |     15 | 联通100元充值卡                |
+----------+--------+--------------------------------+
9 rows in set (0.00 sec)

mysql> select goods_id,cat_id,goods_name from(select goods_id,cat_id,goods_name from goods order by cat_id,goods_id desc limit 1000) as tmp group by cat_id;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       16 |      2 | 恒基伟业g101                           |
|       32 |      3 | 诺基亚n85                              |
|       18 |      4 | 夏新t5                                 |
|       23 |      5 | 诺基亚n96                              |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        6 |     11 | 胜创kingmax内存卡                      |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       30 |     14 | 移动20元充值卡                         |
|       28 |     15 | 联通50元充值卡                         |
+----------+--------+----------------------------------------+
9 rows in set (0.00 sec)


mysql> select goods_id,cat_id,goods_name from goods where goods_id in(select max(goods_id) from goods group by cat_id) group by cat_id;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       16 |      2 | 恒基伟业g101                           |
|       32 |      3 | 诺基亚n85                              |
|       18 |      4 | 夏新t5                                 |
|       23 |      5 | 诺基亚n96                              |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        6 |     11 | 胜创kingmax内存卡                      |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       30 |     14 | 移动20元充值卡                         |
|       28 |     15 | 联通50元充值卡                         |
+----------+--------+----------------------------------------+
9 rows in set (0.04 sec)

mysql> #exits子查询
mysql> #from子查询的排序要加limit\
mysql> #exists 存在,exists 子查询
mysql> #查出有商品的栏目
mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| a                |
| b                |
| boy              |
| category         |
| girl             |
| goods            |
| m                |
| mian             |
| result           |
| t                |
| user             |
+------------------+
11 rows in set (0.06 sec)

mysql> desc category;
+-----------+----------------------+------+-----+---------+----------------+
| Field     | Type                 | Null | Key | Default | Extra          |
+-----------+----------------------+------+-----+---------+----------------+
| cat_id    | smallint(5) unsigned | NO   | PRI | NULL    | auto_increment |
| cat_name  | varchar(90)          | NO   |     |         |                |
| parent_id | smallint(5) unsigned | YES  |     | NULL    |                |
+-----------+----------------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> select * from  category;
+--------+---------------------------+-----------+
| cat_id | cat_name                  | parent_id |
+--------+---------------------------+-----------+
|      1 | 手机类型                  |         0 |
|      2 | CDMA手机                  |         1 |
|      3 | GSM手机                   |         1 |
|      4 | 3G手机                    |         1 |
|      5 | 双模手机                  |         1 |
|      6 | 手机配件                  |         0 |
|      7 | 充电器                    |         6 |
|      8 | 耳机                      |         6 |
|      9 | 电池                      |         6 |
|     11 | 读卡器和内存卡            |         6 |
|     12 | 充值卡                    |         0 |
|     13 | 小灵通/固话充值卡         |        12 |
|     14 | 移动手机充值卡            |        12 |
|     15 | 联通手机充值卡            |        12 |
+--------+---------------------------+-----------+
14 rows in set (0.07 sec)

mysql> desc goods;
+--------------+------------------------+------+-----+---------+----------------+
| Field        | Type                   | Null | Key | Default | Extra          |
+--------------+------------------------+------+-----+---------+----------------+
| goods_id     | mediumint(8) unsigned  | NO   | PRI | NULL    | auto_increment |
| goods_name   | varchar(120)           | NO   |     |         |                |
| cat_id       | smallint(5) unsigned   | NO   | MUL | 0       |                |
| brand_id     | smallint(5) unsigned   | NO   |     | 0       |                |
| goods_sn     | char(15)               | NO   |     |         |                |
| goods_number | smallint(5) unsigned   | NO   |     | 0       |                |
| shop_price   | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| market_price | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| click_count  | int(10) unsigned       | NO   |     | 0       |                |
+--------------+------------------------+------+-----+---------+----------------+
9 rows in set (0.00 sec)


mysql> show index from goods;
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
| goods |          0 | PRIMARY  |            1 | goods_id    | A         |          31 |     NULL |   NULL |      | BTREE      |         |               | YES     |
| goods |          1 | cat      |            1 | cat_id      | A         |        NULL |     NULL |   NULL |      | BTREE      |         |               | YES     |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
2 rows in set (0.17 sec)

mysql> drop index cat on goods;
Query OK, 31 rows affected (0.55 sec)
Records: 31  Duplicates: 0  Warnings: 0

mysql> show index from goods;
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
| goods |          0 | PRIMARY  |            1 | goods_id    | A         |          31 |     NULL |   NULL |      | BTREE      |         |               | YES     |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
1 row in set (0.00 sec)

mysql> desc goods;
+--------------+------------------------+------+-----+---------+----------------+
| Field        | Type                   | Null | Key | Default | Extra          |
+--------------+------------------------+------+-----+---------+----------------+
| goods_id     | mediumint(8) unsigned  | NO   | PRI | NULL    | auto_increment |
| goods_name   | varchar(120)           | NO   |     |         |                |
| cat_id       | smallint(5) unsigned   | NO   |     | 0       |                |
| brand_id     | smallint(5) unsigned   | NO   |     | 0       |                |
| goods_sn     | char(15)               | NO   |     |         |                |
| goods_number | smallint(5) unsigned   | NO   |     | 0       |                |
| shop_price   | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| market_price | decimal(10,2) unsigned | NO   |     | 0.00    |                |
| click_count  | int(10) unsigned       | NO   |     | 0       |                |
+--------------+------------------------+------+-----+---------+----------------+
9 rows in set (0.00 sec)

mysql> desc category;
+-----------+----------------------+------+-----+---------+----------------+
| Field     | Type                 | Null | Key | Default | Extra          |
+-----------+----------------------+------+-----+---------+----------------+
| cat_id    | smallint(5) unsigned | NO   | PRI | NULL    | auto_increment |
| cat_name  | varchar(90)          | NO   |     |         |                |
| parent_id | smallint(5) unsigned | YES  |     | NULL    |                |
+-----------+----------------------+------+-----+---------+----------------+
3 rows in set (0.03 sec)

mysql> select cat_name from category;
+---------------------------+
| cat_name                  |
+---------------------------+
| 手机类型                  |
| CDMA手机                  |
| GSM手机                   |
| 3G手机                    |
| 双模手机                  |
| 手机配件                  |
| 充电器                    |
| 耳机                      |
| 电池                      |
| 读卡器和内存卡            |
| 充值卡                    |
| 小灵通/固话充值卡         |
| 移动手机充值卡            |
| 联通手机充值卡            |
+---------------------------+
14 rows in set (0.00 sec)

mysql> select cat_id,cat_name from category where exists(select * from goods where category.cat_id=goods_id);
+--------+---------------------------+
| cat_id | cat_name                  |
+--------+---------------------------+
|      1 | 手机类型                  |
|      3 | GSM手机                   |
|      4 | 3G手机                    |
|      5 | 双模手机                  |
|      6 | 手机配件                  |
|      7 | 充电器                    |
|      8 | 耳机                      |
|      9 | 电池                      |
|     11 | 读卡器和内存卡            |
|     12 | 充值卡                    |
|     13 | 小灵通/固话充值卡         |
|     14 | 移动手机充值卡            |
|     15 | 联通手机充值卡            |
+--------+---------------------------+
13 rows in set (0.00 sec)

mysql> select cat_id,cat_name from category where exists(select * from goods where category.cat_id=goods.cat_id);
+--------+---------------------------+
| cat_id | cat_name                  |
+--------+---------------------------+
|      2 | CDMA手机                  |
|      3 | GSM手机                   |
|      4 | 3G手机                    |
|      5 | 双模手机                  |
|      8 | 耳机                      |
|     11 | 读卡器和内存卡            |
|     13 | 小灵通/固话充值卡         |
|     14 | 移动手机充值卡            |
|     15 | 联通手机充值卡            |
+--------+---------------------------+
9 rows in set (0.00 sec)

mysql> #为什么建表时加not null或default 0  ,不想出现null值
mysql> #null判断只能用 is null 或is not nul
mysql> 
mysql> #效率不高,影响索引效率
mysql> select 100000*232344242
    -> ;
+------------------+
| 100000*232344242 |
+------------------+
|   23234424200000 |
+------------------+
1 row in set (0.00 sec)

mysql> #左连接的语法
mysql> a表不动,b表在右边滑动
    -> #
    -> \n
ERROR: 
Unknown command '\n'.
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'a表不动,b表在右边滑动

\n' at line 1
mysql> #a表与b表通过什么关联行
mysql> # a 表left join b on 条件 条件为真,则b表对应的行取出
mysql> # a left join b on
mysql> #将a left join b on 条件 设为c 表
mysql> #可以对c表进行查询,可以查询a和b的列
mysql> select  goods_id,cat_id,cat_name from goods left join category on goods.cat_id=category.cat_id;
ERROR 1052 (23000): Column 'cat_id' in field list is ambiguous
mysql> select  goods_id,goods.cat_id,cat_name from goods left join category on goods.cat_id=category.cat_id;
+----------+--------+---------------------------+
| goods_id | cat_id | cat_name                  |
+----------+--------+---------------------------+
|        1 |      4 | 3G手机                    |
|        4 |      8 | 耳机                      |
|        3 |      8 | 耳机                      |
|        5 |     11 | 读卡器和内存卡            |
|        6 |     11 | 读卡器和内存卡            |
|        7 |      8 | 耳机                      |
|        8 |      3 | GSM手机                   |
|        9 |      3 | GSM手机                   |
|       10 |      3 | GSM手机                   |
|       11 |      3 | GSM手机                   |
|       12 |      3 | GSM手机                   |
|       13 |      3 | GSM手机                   |
|       14 |      4 | 3G手机                    |
|       15 |      3 | GSM手机                   |
|       16 |      2 | CDMA手机                  |
|       17 |      3 | GSM手机                   |
|       18 |      4 | 3G手机                    |
|       19 |      3 | GSM手机                   |
|       20 |      3 | GSM手机                   |
|       21 |      3 | GSM手机                   |
|       22 |      3 | GSM手机                   |
|       23 |      5 | 双模手机                  |
|       24 |      3 | GSM手机                   |
|       25 |     13 | 小灵通/固话充值卡         |
|       26 |     13 | 小灵通/固话充值卡         |
|       27 |     15 | 联通手机充值卡            |
|       28 |     15 | 联通手机充值卡            |
|       29 |     14 | 移动手机充值卡            |
|       30 |     14 | 移动手机充值卡            |
|       31 |      3 | GSM手机                   |
|       32 |      3 | GSM手机                   |
+----------+--------+---------------------------+
31 rows in set (0.00 sec)

mysql> select  goods_id,goods.cat_id,cat_name,goods_name from goods left join category on goods.cat_id=category.cat_id;
+----------+--------+---------------------------+----------------------------------------+
| goods_id | cat_id | cat_name                  | goods_name                             |
+----------+--------+---------------------------+----------------------------------------+
|        1 |      4 | 3G手机                    | kd876                                  |
|        4 |      8 | 耳机                      | 诺基亚n85原装充电器                    |
|        3 |      8 | 耳机                      | 诺基亚原装5800耳机                     |
|        5 |     11 | 读卡器和内存卡            | 索爱原装m2卡读卡器                     |
|        6 |     11 | 读卡器和内存卡            | 胜创kingmax内存卡                      |
|        7 |      8 | 耳机                      | 诺基亚n85原装立体声耳机hs-82           |
|        8 |      3 | GSM手机                   | 飞利浦9@9v                             |
|        9 |      3 | GSM手机                   | 诺基亚e66                              |
|       10 |      3 | GSM手机                   | 索爱c702c                              |
|       11 |      3 | GSM手机                   | 索爱c702c                              |
|       12 |      3 | GSM手机                   | 摩托罗拉a810                           |
|       13 |      3 | GSM手机                   | 诺基亚5320 xpressmusic                 |
|       14 |      4 | 3G手机                    | 诺基亚5800xm                           |
|       15 |      3 | GSM手机                   | 摩托罗拉a810                           |
|       16 |      2 | CDMA手机                  | 恒基伟业g101                           |
|       17 |      3 | GSM手机                   | 夏新n7                                 |
|       18 |      4 | 3G手机                    | 夏新t5                                 |
|       19 |      3 | GSM手机                   | 三星sgh-f258                           |
|       20 |      3 | GSM手机                   | 三星bc01                               |
|       21 |      3 | GSM手机                   | 金立 a30                               |
|       22 |      3 | GSM手机                   | 多普达touch hd                         |
|       23 |      5 | 双模手机                  | 诺基亚n96                              |
|       24 |      3 | GSM手机                   | p806                                   |
|       25 |     13 | 小灵通/固话充值卡         | 小灵通/固话50元充值卡                  |
|       26 |     13 | 小灵通/固话充值卡         | 小灵通/固话20元充值卡                  |
|       27 |     15 | 联通手机充值卡            | 联通100元充值卡                        |
|       28 |     15 | 联通手机充值卡            | 联通50元充值卡                         |
|       29 |     14 | 移动手机充值卡            | 移动100元充值卡                        |
|       30 |     14 | 移动手机充值卡            | 移动20元充值卡                         |
|       31 |      3 | GSM手机                   | 摩托罗拉e8                             |
|       32 |      3 | GSM手机                   | 诺基亚n85                              |
+----------+--------+---------------------------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> select  goods_id,goods.cat_id,goods_name,cat_name from goods left join category on goods.cat_id=category.cat_id;
+----------+--------+----------------------------------------+---------------------------+
| goods_id | cat_id | goods_name                             | cat_name                  |
+----------+--------+----------------------------------------+---------------------------+
|        1 |      4 | kd876                                  | 3G手机                    |
|        4 |      8 | 诺基亚n85原装充电器                    | 耳机                      |
|        3 |      8 | 诺基亚原装5800耳机                     | 耳机                      |
|        5 |     11 | 索爱原装m2卡读卡器                     | 读卡器和内存卡            |
|        6 |     11 | 胜创kingmax内存卡                      | 读卡器和内存卡            |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           | 耳机                      |
|        8 |      3 | 飞利浦9@9v                             | GSM手机                   |
|        9 |      3 | 诺基亚e66                              | GSM手机                   |
|       10 |      3 | 索爱c702c                              | GSM手机                   |
|       11 |      3 | 索爱c702c                              | GSM手机                   |
|       12 |      3 | 摩托罗拉a810                           | GSM手机                   |
|       13 |      3 | 诺基亚5320 xpressmusic                 | GSM手机                   |
|       14 |      4 | 诺基亚5800xm                           | 3G手机                    |
|       15 |      3 | 摩托罗拉a810                           | GSM手机                   |
|       16 |      2 | 恒基伟业g101                           | CDMA手机                  |
|       17 |      3 | 夏新n7                                 | GSM手机                   |
|       18 |      4 | 夏新t5                                 | 3G手机                    |
|       19 |      3 | 三星sgh-f258                           | GSM手机                   |
|       20 |      3 | 三星bc01                               | GSM手机                   |
|       21 |      3 | 金立 a30                               | GSM手机                   |
|       22 |      3 | 多普达touch hd                         | GSM手机                   |
|       23 |      5 | 诺基亚n96                              | 双模手机                  |
|       24 |      3 | p806                                   | GSM手机                   |
|       25 |     13 | 小灵通/固话50元充值卡                  | 小灵通/固话充值卡         |
|       26 |     13 | 小灵通/固话20元充值卡                  | 小灵通/固话充值卡         |
|       27 |     15 | 联通100元充值卡                        | 联通手机充值卡            |
|       28 |     15 | 联通50元充值卡                         | 联通手机充值卡            |
|       29 |     14 | 移动100元充值卡                        | 移动手机充值卡            |
|       30 |     14 | 移动20元充值卡                         | 移动手机充值卡            |
|       31 |      3 | 摩托罗拉e8                             | GSM手机                   |
|       32 |      3 | 诺基亚n85                              | GSM手机                   |
+----------+--------+----------------------------------------+---------------------------+
31 rows in set (0.00 sec)

mysql> #取出第四个栏目的商品以及商品的栏目名称
mysql> select  goods_id,goods.cat_id,goods_name,cat_name from goods left join category on goods.cat_id=category.cat_id where goods.cat_id=4;
+----------+--------+-----------------+----------+
| goods_id | cat_id | goods_name      | cat_name |
+----------+--------+-----------------+----------+
|        1 |      4 | kd876           | 3G手机   |
|       14 |      4 | 诺基亚5800xm    | 3G手机   |
|       18 |      4 | 夏新t5          | 3G手机   |
+----------+--------+-----------------+----------+
3 rows in set (0.07 sec)

mysql> #左右连接,左连接即左表不动,
mysql> #a left join b 并不是说 a 一定是在b的左边
mysql> #左右连接可以互换, a left join b =b right join a
mysql> # 内链接 特点 所有有配偶的男生/女生 走到舞台上来, 其 左表和右表不匹配的不能出现
mysql> # 集合的角度看,内链接是左右连接的交集;
mysql> # 外连接,求的是并集,但是在mysql中不支持
mysql> #左连接
mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| a                |
| b                |
| boy              |
| category         |
| girl             |
| goods            |
| m                |
| mian             |
| result           |
| t                |
| user             |
+------------------+
11 rows in set (0.60 sec)

mysql> select * from t;
+------+--------------+
| tid  | tname        |
+------+--------------+
|    1 | 国安         |
|    2 | 申花         |
|    3 | 布尔联队     |
+------+--------------+
3 rows in set (0.40 sec)

mysql> select * from m;
+------+------+------+------+------------+
| mid  | hid  | gid  | mres | matime     |
+------+------+------+------+------------+
|    1 |    1 |    2 | 2:0  | 2006-05-21 |
|    2 |    2 |    3 | 1:2  | 2006-06-21 |
|    3 |    3 |    1 | 2:5  | 2006-06-25 |
|    4 |    2 |    1 | 3:2  | 2006-07-21 |
+------+------+------+------+------------+
4 rows in set (0.10 sec)

mysql> select m.mid,m.hid,t.tname,m.gid,t.tname from m left join t on m.hid=t.tid;
+------+------+--------------+------+--------------+
| mid  | hid  | tname        | gid  | tname        |
+------+------+--------------+------+--------------+
|    1 |    1 | 国安         |    2 | 国安         |
|    2 |    2 | 申花         |    3 | 申花         |
|    4 |    2 | 申花         |    1 | 申花         |
|    3 |    3 | 布尔联队     |    1 | 布尔联队     |
+------+------+--------------+------+--------------+
4 rows in set (0.00 sec)

mysql> select m.mid,m.hid,t.tname,m.gid from m left join t on m.hid=t.tid;
+------+------+--------------+------+
| mid  | hid  | tname        | gid  |
+------+------+--------------+------+
|    1 |    1 | 国安         |    2 |
|    2 |    2 | 申花         |    3 |
|    4 |    2 | 申花         |    1 |
|    3 |    3 | 布尔联队     |    1 |
+------+------+--------------+------+
4 rows in set (0.00 sec)


mysql> select tem.mid,tem.hid,t.tname,tem.gid,t.tname from (select m.mid,m.hid,t.tname,m.gid from m left join t on m.hid=t.tid) as tem  left join t on t.tid=tem.gid;
+------+------+--------------+------+--------------+
| mid  | hid  | tname        | gid  | tname        |
+------+------+--------------+------+--------------+
|    4 |    2 | 国安         |    1 | 国安         |
|    3 |    3 | 国安         |    1 | 国安         |
|    1 |    1 | 申花         |    2 | 申花         |
|    2 |    2 | 布尔联队     |    3 | 布尔联队     |
+------+------+--------------+------+--------------+
4 rows in set (0.00 sec)

mysql> select tem.mid,tem.hid,t.tname,tem.gid,t.tname from (select m.mid,m.hid,t.tname,m.gid from m left join t on m.hid=t.tid) as tem  left join t on t.tid=tem.gid order by tem.mid asc;
+------+------+--------------+------+--------------+
| mid  | hid  | tname        | gid  | tname        |
+------+------+--------------+------+--------------+
|    1 |    1 | 申花         |    2 | 申花         |
|    2 |    2 | 布尔联队     |    3 | 布尔联队     |
|    3 |    3 | 国安         |    1 | 国安         |
|    4 |    2 | 国安         |    1 | 国安         |
+------+------+--------------+------+--------------+
4 rows in set (0.00 sec)

mysql> select tem.mid,tem.hid,t.tname,tem.gid,t.tname from (select m.mid,m.hid,t.tname,m.gid from m left join t on m.hid=t.tid) as tem  left join t on tem.gid=t.tid order by tem.mid asc;
+------+------+--------------+------+--------------+
| mid  | hid  | tname        | gid  | tname        |
+------+------+--------------+------+--------------+
|    1 |    1 | 申花         |    2 | 申花         |
|    2 |    2 | 布尔联队     |    3 | 布尔联队     |
|    3 |    3 | 国安         |    1 | 国安         |
|    4 |    2 | 国安         |    1 | 国安         |
+------+------+--------------+------+--------------+
4 rows in set (0.00 sec)

mysql> select tem.mid,tem.hid,tem.tname,tem.gid,tem.tname from (select m.mid,m.hid,t.tname,m.gid from m left join t on m.hid=t.tid) as tem  left join t on tem.gid=t.tid order by tem.mid asc;
+------+------+--------------+------+--------------+
| mid  | hid  | tname        | gid  | tname        |
+------+------+--------------+------+--------------+
|    1 |    1 | 国安         |    2 | 国安         |
|    2 |    2 | 申花         |    3 | 申花         |
|    3 |    3 | 布尔联队     |    1 | 布尔联队     |
|    4 |    2 | 申花         |    1 | 申花         |
+------+------+--------------+------+--------------+
4 rows in set (0.00 sec)

mysql> select m.* from m left join t on m.hid=t.tid;
+------+------+------+------+------------+
| mid  | hid  | gid  | mres | matime     |
+------+------+------+------+------------+
|    1 |    1 |    2 | 2:0  | 2006-05-21 |
|    2 |    2 |    3 | 1:2  | 2006-06-21 |
|    4 |    2 |    1 | 3:2  | 2006-07-21 |
|    3 |    3 |    1 | 2:5  | 2006-06-25 |
+------+------+------+------+------------+
4 rows in set (0.00 sec)

mysql> select m.*,t.tname from m left join t on m.hid=t.tid;
+------+------+------+------+------------+--------------+
| mid  | hid  | gid  | mres | matime     | tname        |
+------+------+------+------+------------+--------------+
|    1 |    1 |    2 | 2:0  | 2006-05-21 | 国安         |
|    2 |    2 |    3 | 1:2  | 2006-06-21 | 申花         |
|    4 |    2 |    1 | 3:2  | 2006-07-21 | 申花         |
|    3 |    3 |    1 | 2:5  | 2006-06-25 | 布尔联队     |
+------+------+------+------+------------+--------------+
4 rows in set (0.00 sec)


mysql> select tem.*, t.tname  from (select m.*,t.tname from m left join t on m.hid=t.tid) as tem left join t on tem.gid=t.tid;
+------+------+------+------+------------+--------------+--------------+
| mid  | hid  | gid  | mres | matime     | tname        | tname        |
+------+------+------+------+------------+--------------+--------------+
|    4 |    2 |    1 | 3:2  | 2006-07-21 | 申花         | 国安         |
|    3 |    3 |    1 | 2:5  | 2006-06-25 | 布尔联队     | 国安         |
|    1 |    1 |    2 | 2:0  | 2006-05-21 | 国安         | 申花         |
|    2 |    2 |    3 | 1:2  | 2006-06-21 | 申花         | 布尔联队     |
+------+------+------+------+------------+--------------+--------------+
4 rows in set (0.00 sec)

mysql> select * from t;
+------+--------------+
| tid  | tname        |
+------+--------------+
|    1 | 国安         |
|    2 | 申花         |
|    3 | 布尔联队     |
+------+--------------+
3 rows in set (0.00 sec)

mysql> select tem.mid,tem.hid,tem.tname,tem.gid,t.tname,tem.mres,tem.matime  from (select m.mid ,m.hid,t.tname,m.gid,m.mres,m.matime from m left join t on m.hid=t.tid) as tem left join t on tem.gid=t.tid;
+------+------+--------------+------+--------------+------+------------+
| mid  | hid  | tname        | gid  | tname        | mres | matime     |
+------+------+--------------+------+--------------+------+------------+
|    4 |    2 | 申花         |    1 | 国安         | 3:2  | 2006-07-21 |
|    3 |    3 | 布尔联队     |    1 | 国安         | 2:5  | 2006-06-25 |
|    1 |    1 | 国安         |    2 | 申花         | 2:0  | 2006-05-21 |
|    2 |    2 | 申花         |    3 | 布尔联队     | 1:2  | 2006-06-21 |
+------+------+--------------+------+--------------+------+------------+
4 rows in set (0.00 sec)

mysql> select tem.mid,tem.hid,tem.tname,tem.gid,t.tname,tem.mres,tem.matime  from (select m.mid ,m.hid,t.tname,m.gid,m.mres,m.matime from m left join t on m.hid=t.tid) as tem left join t on tem.gid=t.tid order by tem.mid;
+------+------+--------------+------+--------------+------+------------+
| mid  | hid  | tname        | gid  | tname        | mres | matime     |
+------+------+--------------+------+--------------+------+------------+
|    1 |    1 | 国安         |    2 | 申花         | 2:0  | 2006-05-21 |
|    2 |    2 | 申花         |    3 | 布尔联队     | 1:2  | 2006-06-21 |
|    3 |    3 | 布尔联队     |    1 | 国安         | 2:5  | 2006-06-25 |
|    4 |    2 | 申花         |    1 | 国安         | 3:2  | 2006-07-21 |
+------+------+--------------+------+--------------+------+------------+
4 rows in set (0.00 sec)

mysql> select * from m;
+------+------+------+------+------------+
| mid  | hid  | gid  | mres | matime     |
+------+------+------+------+------------+
|    1 |    1 |    2 | 2:0  | 2006-05-21 |
|    2 |    2 |    3 | 1:2  | 2006-06-21 |
|    3 |    3 |    1 | 2:5  | 2006-06-25 |
|    4 |    2 |    1 | 3:2  | 2006-07-21 |
+------+------+------+------+------------+
4 rows in set (0.00 sec)

mysql> select tem.mid,tem.hid,tem.tname,tem.gid,t.tname,tem.mres,tem.matime  from (select m.mid ,m.hid,t.tname,m.gid,m.mres,m.matime from m left join t on m.hid=t.tid) as tem left join t on tem.gid=t.tid where tem.matime between "2006-6-1" and "2006-7-1"  order by tem.mid;
+------+------+--------------+------+--------------+------+------------+
| mid  | hid  | tname        | gid  | tname        | mres | matime     |
+------+------+--------------+------+--------------+------+------------+
|    2 |    2 | 申花         |    3 | 布尔联队     | 1:2  | 2006-06-21 |
|    3 |    3 | 布尔联队     |    1 | 国安         | 2:5  | 2006-06-25 |
+------+------+--------------+------+--------------+------+------------+
2 rows in set (0.06 sec)

mysql> select m.mid ,m.hid,t.tname,m.gid,tem.tname,m.mres,m.matime from m left join t on m.hid=t.tid  left join t  as tem on m.gid=tem.tid where m.matime between "2006-6-1" and "2006-7-1"  order by m.mid;
+------+------+--------------+------+--------------+------+------------+
| mid  | hid  | tname        | gid  | tname        | mres | matime     |
+------+------+--------------+------+--------------+------+------------+
|    2 |    2 | 申花         |    3 | 布尔联队     | 1:2  | 2006-06-21 |
|    3 |    3 | 布尔联队     |    1 | 国安         | 2:5  | 2006-06-25 |
+------+------+--------------+------+--------------+------+------------+
2 rows in set (0.00 sec)

mysql> exit
mysql> use test01;
Database changed
mysql> select goods_id,goods_name,shop_price from goods where shop_price<50
    -> ;
+----------+--------------------------------+------------+
| goods_id | goods_name                     | shop_price |
+----------+--------------------------------+------------+
|        5 | 索爱原装m2卡读卡器             |      20.00 |
|        6 | 胜创kingmax内存卡              |      42.00 |
|       25 | 小灵通/固话50元充值卡          |      48.00 |
|       26 | 小灵通/固话20元充值卡          |      19.00 |
|       28 | 联通50元充值卡                 |      45.00 |
|       30 | 移动20元充值卡                 |      18.00 |
+----------+--------------------------------+------------+
6 rows in set (0.14 sec)

mysql> #union 联合 语法 sql1 union sql2
mysql> select goods_id,goods_name,shop_price from goods where shop_price>4000;
+----------+-------------------+------------+
| goods_id | goods_name        | shop_price |
+----------+-------------------+------------+
|       22 | 多普达touch hd    |    5999.00 |
+----------+-------------------+------------+
1 row in set (0.00 sec)

mysql> select goods_id,goods_name,shop_price from goods where shop_price>4000 union select goods_id,goods_name,shop_price from goods where shop_price<50;
+----------+--------------------------------+------------+
| goods_id | goods_name                     | shop_price |
+----------+--------------------------------+------------+
|       22 | 多普达touch hd                 |    5999.00 |
|        5 | 索爱原装m2卡读卡器             |      20.00 |
|        6 | 胜创kingmax内存卡              |      42.00 |
|       25 | 小灵通/固话50元充值卡          |      48.00 |
|       26 | 小灵通/固话20元充值卡          |      19.00 |
|       28 | 联通50元充值卡                 |      45.00 |
|       30 | 移动20元充值卡                 |      18.00 |
+----------+--------------------------------+------------+
7 rows in set (0.10 sec)

mysql> #可以从两张表union联合查询
mysql> #两个列名不一致 以第一个列名为准
mysql> #union 满足的条件,只要结果集的列数一致就可以了
mysql> #union后的结果集可以排序
mysql> #格式: sql1 union sql2 order by
mysql> # 用nuion 取出第4个栏目和第5个栏目的商品m,并按价格升序排列
mysql> select goods_id ,cat_id, goods_name ,shop_price from goods union select goods_id ,cat_id ,goods_name ,shop_price from goods order by shop_price asc;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|        1 |      4 | kd876                                  |    1388.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       24 |      3 | p806                                   |    2000.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       32 |      3 | 诺基亚n85                              |    3010.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.05 sec)

mysql> select goods_id ,cat_id, goods_name ,shop_price from goods where cat_id=4 union select goods_id ,cat_id ,goods_name ,shop_price from goods where cat_id=5 order by shop_price asc;
+----------+--------+-----------------+------------+
| goods_id | cat_id | goods_name      | shop_price |
+----------+--------+-----------------+------------+
|        1 |      4 | kd876           |    1388.00 |
|       14 |      4 | 诺基亚5800xm    |    2625.00 |
|       18 |      4 | 夏新t5          |    2878.00 |
|       23 |      5 | 诺基亚n96       |    3700.00 |
+----------+--------+-----------------+------------+
4 rows in set (0.00 sec)

mysql> #取出第3个下价格前三高 的商品,和第四个栏目下价格前两高的商品用union完成

mysql> select goods_id ,cat_id,goods_name ,shop_price from goods where cat_id=3 order by  shop_price desc limit 3;
+----------+--------+-------------------+------------+
| goods_id | cat_id | goods_name        | shop_price |
+----------+--------+-------------------+------------+
|       22 |      3 | 多普达touch hd    |    5999.00 |
|       32 |      3 | 诺基亚n85         |    3010.00 |
|       17 |      3 | 夏新n7            |    2300.00 |
+----------+--------+-------------------+------------+
3 rows in set (0.00 sec)

mysql> select goods_id ,cat_id ,goods_name ,shop_price from goods where cat_id=4 order by shop_price desc limit 2;
+----------+--------+-----------------+------------+
| goods_id | cat_id | goods_name      | shop_price |
+----------+--------+-----------------+------------+
|       18 |      4 | 夏新t5          |    2878.00 |
|       14 |      4 | 诺基亚5800xm    |    2625.00 |
+----------+--------+-----------------+------------+
2 rows in set (0.00 sec)

mysql> (select goods_id ,cat_id,goods_name ,shop_price from goods where cat_id=3 order by  shop_price desc limit 3) union (select goods_id ,cat_id,goods_name ,shop_price from goods where cat_id=4 order by shop_price desc limit 2);
+----------+--------+-------------------+------------+
| goods_id | cat_id | goods_name        | shop_price |
+----------+--------+-------------------+------------+
|       22 |      3 | 多普达touch hd    |    5999.00 |
|       32 |      3 | 诺基亚n85         |    3010.00 |
|       17 |      3 | 夏新n7            |    2300.00 |
|       18 |      4 | 夏新t5            |    2878.00 |
|       14 |      4 | 诺基亚5800xm      |    2625.00 |
+----------+--------+-------------------+------------+
5 rows in set (0.00 sec)

mysql> #这次内层的order by 不会失效是因为有limit,单纯的order by不会对结果集有影响,需要配合limit
mysql> #如果union后的结果有重复如何解决
mysql> #union会有去重的效果,不想去重可以用union all
mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| a                |
| b                |
| boy              |
| category         |
| girl             |
| goods            |
| m                |
| mian             |
| result           |
| t                |
| user             |
+------------------+
11 rows in set (0.08 sec)

mysql> select * from a;
+------+------+
| id   | num  |
+------+------+
| a    |    5 |
| b    |   10 |
| c    |   15 |
| d    |   10 |
+------+------+
4 rows in set (0.15 sec)

mysql> select  * from b;
+------+------+
| id   | num  |
+------+------+
| b    |    5 |
| c    |   15 |
| d    |   20 |
| e    |   99 |
+------+------+
4 rows in set (0.02 sec)

mysql> select * from a union select * from b;
+------+------+
| id   | num  |
+------+------+
| a    |    5 |
| b    |   10 |
| c    |   15 |
| d    |   10 |
| b    |    5 |
| d    |   20 |
| e    |   99 |
+------+------+
7 rows in set (0.00 sec)

mysql> select * from a union all select * from b;
+------+------+
| id   | num  |
+------+------+
| a    |    5 |
| b    |   10 |
| c    |   15 |
| d    |   10 |
| b    |    5 |
| c    |   15 |
| d    |   20 |
| e    |   99 |
+------+------+
8 rows in set (0.00 sec)

mysql> select * from a union all select * from b group by id;
+------+------+
| id   | num  |
+------+------+
| a    |    5 |
| b    |   10 |
| c    |   15 |
| d    |   10 |
| b    |    5 |
| c    |   15 |
| d    |   20 |
| e    |   99 |
+------+------+
8 rows in set (0.00 sec)

mysql> select tem.id,sum(tem.num) from(select a.id,a.num from a union all select b.id,b.num from b) as tem group by tem.id ;
+------+--------------+
| id   | sum(tem.num) |
+------+--------------+
| a    |            5 |
| b    |           15 |
| c    |           30 |
| d    |           30 |
| e    |           99 |
+------+--------------+
5 rows in set (0.00 sec)


mysql> select a.* ,b.* from a left join b on a.id=b.id;
+------+------+------+------+
| id   | num  | id   | num  |
+------+------+------+------+
| b    |   10 | b    |    5 |
| c    |   15 | c    |   15 |
| d    |   10 | d    |   20 |
| a    |    5 | NULL | NULL |
+------+------+------+------+
4 rows in set (0.00 sec)

mysql> select a.* ,b.* from a inner join b on a.id=b.id;
+------+------+------+------+
| id   | num  | id   | num  |
+------+------+------+------+
| b    |   10 | b    |    5 |
| c    |   15 | c    |   15 |
| d    |   10 | d    |   20 |
+------+------+------+------+
3 rows in set (0.00 sec)

mysql> select a.* ,b.* from a left join b on a.id=b.id;
+------+------+------+------+
| id   | num  | id   | num  |
+------+------+------+------+
| b    |   10 | b    |    5 |
| c    |   15 | c    |   15 |
| d    |   10 | d    |   20 |
| a    |    5 | NULL | NULL |
+------+------+------+------+
4 rows in set (0.00 sec)

mysql> select a.* ,b.* from a left join b on a.id=b.id union select a.* ,b.* from a right join b on a.id=b.id;
+------+------+------+------+
| id   | num  | id   | num  |
+------+------+------+------+
| b    |   10 | b    |    5 |
| c    |   15 | c    |   15 |
| d    |   10 | d    |   20 |
| a    |    5 | NULL | NULL |
| NULL | NULL | e    |   99 |
+------+------+------+------+
5 rows in set (0.00 sec)

mysql> #先左联再u右连然后子查询;
mysql> 
mysql> #函数
mysql> #取出第四个栏目的商品及打88折的会员价
mysql> select goods_id,cat_id,good_name,shop_price*0.88 from goods where cat_id=4 
    -> ;
ERROR 1054 (42S22): Unknown column 'good_name' in 'field list'
mysql> select goods_id,cat_id,goods_name,shop_price*0.88 from goods where cat_id=4 
    -> ;
+----------+--------+-----------------+-----------------+
| goods_id | cat_id | goods_name      | shop_price*0.88 |
+----------+--------+-----------------+-----------------+
|        1 |      4 | kd876           |       1221.4400 |
|       14 |      4 | 诺基亚5800xm    |       2310.0000 |
|       18 |      4 | 夏新t5          |       2532.6400 |
+----------+--------+-----------------+-----------------+
3 rows in set (0.00 sec)

mysql> select goods_id,cat_id,goods_name,floor(shop_price*0.88) from goods where cat_id=4 ;
+----------+--------+-----------------+------------------------+
| goods_id | cat_id | goods_name      | floor(shop_price*0.88) |
+----------+--------+-----------------+------------------------+
|        1 |      4 | kd876           |                   1221 |
|       14 |      4 | 诺基亚5800xm    |                   2310 |
|       18 |      4 | 夏新t5          |                   2532 |
+----------+--------+-----------------+------------------------+
3 rows in set (0.00 sec)

mysql> #随机生成5-15之间的数字;


mysql> select floor(rand()*10+5);
+--------------------+
| floor(rand()*10+5) |
+--------------------+
|                  7 |
+--------------------+
1 row in set (0.00 sec)

mysql> select floor(rand()*10+5);
+--------------------+
| floor(rand()*10+5) |
+--------------------+
|                 13 |
+--------------------+
1 row in set (0.00 sec)

mysql> select floor(rand()*10+5);
+--------------------+
| floor(rand()*10+5) |
+--------------------+
|                  8 |
+--------------------+
1 row in set (0.00 sec)

mysql> select floor(rand()*10+5);
+--------------------+
| floor(rand()*10+5) |
+--------------------+
|                  9 |
+--------------------+
1 row in set (0.00 sec)

mysql> select floor(rand()*10+5);
+--------------------+
| floor(rand()*10+5) |
+--------------------+
|                  8 |
+--------------------+
1 row in set (0.00 sec)

mysql> select floor(rand()*10+5);
+--------------------+
| floor(rand()*10+5) |
+--------------------+
|                  5 |
+--------------------+
1 row in set (0.00 sec)

mysql> select floor(rand()*10+5);
+--------------------+
| floor(rand()*10+5) |
+--------------------+
|                  8 |
+--------------------+
1 row in set (0.00 sec)

mysql> select floor(rand()*10+5);
+--------------------+
| floor(rand()*10+5) |
+--------------------+
|                 11 |
+--------------------+
1 row in set (0.00 sec)

mysql> #ceiling 向上取整
mysql> #group concat 取出4栏目下goods_id拼接
mysql> select group_concat(goods_id) from goods where cat_id=4;
+------------------------+
| group_concat(goods_id) |
+------------------------+
| 1,14,18                |
+------------------------+
1 row in set (0.08 sec)

mysql> #计算字符的ascil码
mysql> select ascil(a);
ERROR 1305 (42000): FUNCTION test01.ascil does not exist
mysql> select ascii(a);
ERROR 1054 (42S22): Unknown column 'a' in 'field list'
mysql> select ascii('a');
+------------+
| ascii('a') |
+------------+
|         97 |
+------------+
1 row in set (0.00 sec)

mysql> select length("中华");
+------------------+
| length("中华")   |
+------------------+
|                6 |
+------------------+
1 row in set (0.06 sec)

mysql> #length 计算的字节场地
mysql> #length 计算的字符数
mysql> #char_length 计算的字符数
mysql> select char_length('中国');
+-----------------------+
| char_length('中国')   |
+-----------------------+
|                     2 |
+-----------------------+
1 row in set (0.00 sec)

mysql> #反转字符串
mysql> select reverse('zh')
    -> ;
+---------------+
| reverse('zh') |
+---------------+
| hz            |
+---------------+
1 row in set (0.05 sec)

mysql> select reverse('zh中国');
+---------------------+
| reverse('zh中国')   |
+---------------------+
| 国中hz              |
+---------------------+
1 row in set (0.00 sec)

mysql> #position 
mysql> select position('@' in 'abc@sina.com');
+---------------------------------+
| position('@' in 'abc@sina.com') |
+---------------------------------+
|                               4 |
+---------------------------------+
1 row in set (0.05 sec)

mysql> select right('abc@sina.com' ,2);
+--------------------------+
| right('abc@sina.com' ,2) |
+--------------------------+
| om                       |
+--------------------------+
1 row in set (0.00 sec)

mysql> #某网站有email字段,有邮件地址,想调查163.qq.com的u邮箱的比例
mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| a                |
| b                |
| boy              |
| category         |
| girl             |
| goods            |
| m                |
| mian             |
| result           |
| t                |
| user             |
+------------------+
11 rows in set (0.01 sec)

mysql> #查询邮箱后缀,
mysql> create table email(uname char,email char);
Query OK, 0 rows affected (1.76 sec)


mysql> desc email;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| uname | char(1) | YES  |     | NULL    |       |
| email | char(1) | YES  |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
2 rows in set (0.09 sec)


mysql> alter table email modify column uname char(50) ;
Query OK, 0 rows affected (1.96 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table email modify column email char(50) ;
Query OK, 0 rows affected (1.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc eamil;
ERROR 1146 (42S02): Table 'test01.eamil' doesn't exist
mysql> desc email;
+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| uname | char(50) | YES  |     | NULL    |       |
| email | char(50) | YES  |     | NULL    |       |
+-------+----------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> insert into email values('zhangsan','zhan@163.com'),('lilie','li@qq.com'),('hanmeimei','han@126.com');
Query OK, 3 rows affected (0.28 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from email;
+-----------+--------------+
| uname     | email        |
+-----------+--------------+
| zhangsan  | zhan@163.com |
| lilie     | li@qq.com    |
| hanmeimei | han@126.com  |
+-----------+--------------+
3 rows in set (0.00 sec)

mysql> select uname ,position('@' in email) from email;
+-----------+------------------------+
| uname     | position('@' in email) |
+-----------+------------------------+
| zhangsan  |                      5 |
| lilie     |                      3 |
| hanmeimei |                      4 |
+-----------+------------------------+
3 rows in set (0.00 sec)

mysql> select uname ,right(email,position('@' in email)) from email;
+-----------+-------------------------------------+
| uname     | right(email,position('@' in email)) |
+-----------+-------------------------------------+
| zhangsan  | 3.com                               |
| lilie     | com                                 |
| hanmeimei | .com                                |
+-----------+-------------------------------------+
3 rows in set (0.00 sec)

mysql> select uname ,right(email,char_length(email)-position('@' in email)) from email;
+-----------+--------------------------------------------------------+
| uname     | right(email,char_length(email)-position('@' in email)) |
+-----------+--------------------------------------------------------+
| zhangsan  | 163.com                                                |
| lilie     | qq.com                                                 |
| hanmeimei | 126.com                                                |
+-----------+--------------------------------------------------------+
3 rows in set (0.00 sec)

mysql> select uname ,right(email,length(email)-position('@' in email)) from email;
+-----------+---------------------------------------------------+
| uname     | right(email,length(email)-position('@' in email)) |
+-----------+---------------------------------------------------+
| zhangsan  | 163.com                                           |
| lilie     | qq.com                                            |
| hanmeimei | 126.com                                           |
+-----------+---------------------------------------------------+
3 rows in set (0.00 sec)

mysql> #截取邮箱
mysql> #截取邮箱后半部分;
mysql> select uname ,right(email,length(email)-position('@' in email)) from email;
+-----------+---------------------------------------------------+
| uname     | right(email,length(email)-position('@' in email)) |
+-----------+---------------------------------------------------+
| zhangsan  | 163.com                                           |
| lilie     | qq.com                                            |
| hanmeimei | 126.com                                           |
+-----------+---------------------------------------------------+
3 rows in set (0.00 sec)

mysql> #日期时间函数,取当前时间
mysql> select now;
ERROR 1054 (42S22): Unknown column 'now' in 'field list'
mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2019-10-15 20:00:44 |
+---------------------+
1 row in set (0.05 sec)

mysql> select curdate();
+------------+
| curdate()  |
+------------+
| 2019-10-15 |
+------------+
1 row in set (0.01 sec)

mysql> # now()返回datetime格式,curdate返回date格式
mysql> select curtime();
+-----------+
| curtime() |
+-----------+
| 20:02:19  |
+-----------+
1 row in set (0.00 sec)

mysql> #查看某一日是那一周的第几天
mysql> select dayofweek('2019-10-15');
+-------------------------+
| dayofweek('2019-10-15') |
+-------------------------+
|                       3 |
+-------------------------+
1 row in set (0.05 sec)

mysql> select week('2019-10-15');
+--------------------+
| week('2019-10-15') |
+--------------------+
|                 41 |
+--------------------+
1 row in set (0.00 sec)

mysql> select week('2019-12-30');
+--------------------+
| week('2019-12-30') |
+--------------------+
|                 52 |
+--------------------+
1 row in set (0.00 sec)

mysql> select week(curdate());
+-----------------+
| week(curdate()) |
+-----------------+
|              41 |
+-----------------+
1 row in set (0.00 sec)

mysql> select week('2019-12-31');
+--------------------+
| week('2019-12-31') |
+--------------------+
|                 52 |
+--------------------+
1 row in set (0.00 sec)

mysql> #案例:name 
mysql> # overtime 日期
mysql> # 5        2019-9-1
mysql> # 6        2019-9-2
mysql> # 3        2019-9-3
mysql> # 报表统计,按星期统计加班时间 
mysql> create table jiaban(num int(10) ,time date);
Query OK, 0 rows affected (0.52 sec)

mysql> insert into jiaban values(3,"2019-9-1"),(4,'2019-9-2'),(5,"2019-9-3"),(6,'2019-9-10'),(19,'2019-9-18');
Query OK, 5 rows affected (0.15 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from jiaban;
+------+------------+
| num  | time       |
+------+------------+
|    3 | 2019-09-01 |
|    4 | 2019-09-02 |
|    5 | 2019-09-03 |
|    6 | 2019-09-10 |
|   19 | 2019-09-18 |
+------+------------+
5 rows in set (0.00 sec)

mysql> #按星期统计加班时间;
mysql> select sum(num), week(time) from jiaban ;
+----------+------------+
| sum(num) | week(time) |
+----------+------------+
|       37 |         35 |
+----------+------------+
1 row in set (0.02 sec)

mysql> select sum(num), week(time) from jiaban group by week(time);
+----------+------------+
| sum(num) | week(time) |
+----------+------------+
|       12 |         35 |
|        6 |         36 |
|       19 |         37 |
+----------+------------+
3 rows in set (0.00 sec)

mysql> select num, week(time) from jiaban group by week(time);
+------+------------+
| num  | week(time) |
+------+------------+
|    3 |         35 |
|    6 |         36 |
|   19 |         37 |
+------+------------+
3 rows in set (0.00 sec)

mysql> select sum(num), week(time) from jiaban group by week(time);
+----------+------------+
| sum(num) | week(time) |
+----------+------------+
|       12 |         35 |
|        6 |         36 |
|       19 |         37 |
+----------+------------+
3 rows in set (0.00 sec)

mysql> select *, week(time) from jiaban;
+------+------------+------------+
| num  | time       | week(time) |
+------+------------+------------+
|    3 | 2019-09-01 |         35 |
|    4 | 2019-09-02 |         35 |
|    5 | 2019-09-03 |         35 |
|    6 | 2019-09-10 |         36 |
|   19 | 2019-09-18 |         37 |
+------+------------+------------+
5 rows in set (0.00 sec)

mysql> #加密函数,码得
mysql> #md5加密函数;
mysql> select md5('1');
+----------------------------------+
| md5('1')                         |
+----------------------------------+
| c4ca4238a0b923820dcc509a6f75849b |
+----------------------------------+
1 row in set (0.07 sec)

mysql> select md5('1');
+----------------------------------+
| md5('1')                         |
+----------------------------------+
| c4ca4238a0b923820dcc509a6f75849b |
+----------------------------------+
1 row in set (0.00 sec)

mysql> #md5是不可逆的
mysql> #流程h控制函数
mysql> #case 变量
mysql> 2 when 值 then 语句；
    -> 3 when 值 then 语句；
    -> 4 else 语句；
    -> 5 end case；
    -> \c
mysql> #if(gender=0,'优先','等待') as vip
mysql> ifnull
    -> \c
mysql> #ifnull的用法,判断第一个表达式是否为null 如果为null 返回第2 个表达式的值
mysql> #如果不为null 返回自身,即表达式1
mysql> select ifnull('',a);
ERROR 1054 (42S22): Unknown column 'a' in 'field list'
mysql> select ifnull('','a');
+----------------+
| ifnull('','a') |
+----------------+
|                |
+----------------+
1 row in set (0.00 sec)

mysql> select ifnull(null,'a');
+------------------+
| ifnull(null,'a') |
+------------------+
| a                |
+------------------+
1 row in set (0.00 sec)

mysql> #系统调试函数
mysql> 
mysql> 
mysql> select user();
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)

mysql> #user返回用户及主机,判断自己的身份
mysql> #database(),返回当前操作的数据库名
mysql> select database();
+------------+
| database() |
+------------+
| test01     |
+------------+
1 row in set (0.00 sec)

mysql> select version();
+-----------+
| version() |
+-----------+
| 8.0.12    |
+-----------+
1 row in set (0.00 sec)

mysql> #vension() 返回数据库的版本
mysql> #时间的h格式化,优先在业务逻辑上使用,
mysql> #总结: where 条件中,对某列使用了函数,由此列的索引不发挥作用
mysql> #视图 view
mysql> view 将查询表当作临时表使用,
    -> \c
mysql> # 查询每个栏目下商品的平均价格,并对平均价格取前三的栏目
mysql> select cat_id,avg(shop_price),count(goods_id) from goods group by cat_id;
+--------+-----------------+-----------------+
| cat_id | avg(shop_price) | count(goods_id) |
+--------+-----------------+-----------------+
|      4 |     2297.000000 |               3 |
|      8 |       75.333333 |               3 |
|     11 |       31.000000 |               2 |
|      3 |     1746.066667 |              15 |
|      2 |      823.330000 |               1 |
|      5 |     3700.000000 |               1 |
|     13 |       33.500000 |               2 |
|     15 |       70.000000 |               2 |
|     14 |       54.000000 |               2 |
+--------+-----------------+-----------------+
9 rows in set (0.10 sec)

mysql> select cat_id,avg(shop_price) as average,count(goods_id) from goods group by cat_id order by average desc limit 3 ;
+--------+-------------+-----------------+
| cat_id | average     | count(goods_id) |
+--------+-------------+-----------------+
|      5 | 3700.000000 |               1 |
|      4 | 2297.000000 |               3 |
|      3 | 1746.066667 |              15 |
+--------+-------------+-----------------+
3 rows in set (0.00 sec)

mysql> select cat_id,avg(shop_price) as average,count(goods_id) from goods group by cat_id order by average asc limit 3 ;
+--------+-----------+-----------------+
| cat_id | average   | count(goods_id) |
+--------+-----------+-----------------+
|     11 | 31.000000 |               2 |
|     13 | 33.500000 |               2 |
|     14 | 54.000000 |               2 |
+--------+-----------+-----------------+
3 rows in set (0.00 sec)

mysql> #取平均价格由高到底第三到第5的栏目
mysql> select cat_id,avg(shop_price) as average,count(goods_id) from goods group by cat_id order by average asc  ;
+--------+-------------+-----------------+
| cat_id | average     | count(goods_id) |
+--------+-------------+-----------------+
|     11 |   31.000000 |               2 |
|     13 |   33.500000 |               2 |
|     14 |   54.000000 |               2 |
|     15 |   70.000000 |               2 |
|      8 |   75.333333 |               3 |
|      2 |  823.330000 |               1 |
|      3 | 1746.066667 |              15 |
|      4 | 2297.000000 |               3 |
|      5 | 3700.000000 |               1 |
+--------+-------------+-----------------+
9 rows in set (0.00 sec)

mysql> select cat_id,avg(shop_price) as average,count(goods_id) from goods group by cat_id;
+--------+-------------+-----------------+
| cat_id | average     | count(goods_id) |
+--------+-------------+-----------------+
|      4 | 2297.000000 |               3 |
|      8 |   75.333333 |               3 |
|     11 |   31.000000 |               2 |
|      3 | 1746.066667 |              15 |
|      2 |  823.330000 |               1 |
|      5 | 3700.000000 |               1 |
|     13 |   33.500000 |               2 |
|     15 |   70.000000 |               2 |
|     14 |   54.000000 |               2 |
+--------+-------------+-----------------+
9 rows in set (0.00 sec)

mysql> # 将结果集设为a  a频繁用到,因此用到视图
mysql> # 表通过某种运算得到的影子
mysql> #如何创建视图,建视图的时候语法 create view 表名 as 查询语句;
mysql> create view state as select cat_id,avg(shop_price) as average,count(goods_id) from goods group by cat_id;
Query OK, 0 rows affected (0.27 sec)

mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| a                |
| b                |
| boy              |
| category         |
| email            |
| girl             |
| goods            |
| jiaban           |
| m                |
| mian             |
| result           |
| state            |
| t                |
| user             |
+------------------+
14 rows in set (0.01 sec)

mysql> #多了一张state表
mysql> select * from state;
+--------+-------------+-----------------+
| cat_id | average     | count(goods_id) |
+--------+-------------+-----------------+
|      4 | 2297.000000 |               3 |
|      8 |   75.333333 |               3 |
|     11 |   31.000000 |               2 |
|      3 | 1746.066667 |              15 |
|      2 |  823.330000 |               1 |
|      5 | 3700.000000 |               1 |
|     13 |   33.500000 |               2 |
|     15 |   70.000000 |               2 |
|     14 |   54.000000 |               2 |
+--------+-------------+-----------------+
9 rows in set (0.06 sec)


mysql> select * from state order by average limit 3;
+--------+-----------+-----------------+
| cat_id | average   | count(goods_id) |
+--------+-----------+-----------------+
|     11 | 31.000000 |               2 |
|     13 | 33.500000 |               2 |
|     14 | 54.000000 |               2 |
+--------+-----------+-----------------+
3 rows in set (0.00 sec)

mysql> #视图一旦创建完毕,可以完全当表使用,
mysql> # 简化查询,复杂的统计,
mysql> #更清晰的权限控制
mysql> # 开放权限,但是不想开放密码字段,用视图
mysql> # 多表查询,分表时候用,将表头放在视图中;
mysql> #视图是表的影子,表与视图相互影响的关系
mysql> #表的数据变化,影响视图的变化,
mysql> #以此例,,此视图的数据不能更改,其数据来自shop_price的平均值
mysql> #视图是否能够增删改呢?
mysql> #某种情况下是可以删除的,11对应,即表的数据能够推出视图的数据,视图的数据能够推出表的数据
mysql> #删除视图即 drop table/view 表名/视图名
mysql> exit
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bookstore          |
| clouddb01          |
| clouddb02          |
| clouddb03          |
| information_schema |
| mydb               |
| mysql              |
| performance_schema |
| shop               |
| ssm_crud           |
| struts             |
| student            |
| sys                |
| test               |
| test01             |
+--------------------+
15 rows in set (0.18 sec)

mysql> use test01;
Database changed
mysql> #algorithm  
mysql> # merge ---合并查询语句
mysql> #tem
mysql> #temptable ---临时表
mysql> #undefined --未定义,由系统判断
mysql> #建一张简单的查询视图,不同临时表,只用y条件合并
mysql> create view as select * from goods where shop_price>300;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as select * from goods where shop_price>300' at line 1
mysql> create view v1  as  select * from goods where shop_price>300;
Query OK, 0 rows affected (0.52 sec)

mysql> #查询视图
mysql> select goods_id ,goods_name ,shop_price from v1 where shop_price<500;
+----------+---------------+------------+
| goods_id | goods_name    | shop_price |
+----------+---------------+------------+
|        8 | 飞利浦9@9v    |     399.00 |
+----------+---------------+------------+
1 row in set (0.01 sec)

mysql> #总的条件是>300 <500;
mysql> #这个简单的查询还建立临时表的话,开销有点大;
mysql> #这是我们可以指定algorithm为merge
mysql> create algorithm=merge view v2 as select * from goods where shop_price>300;
Query OK, 0 rows affected (0.21 sec)

mysql> select goods_id ,goods_name ,shop_price from v2 where shop_price<500;
+----------+---------------+------------+
| goods_id | goods_name    | shop_price |
+----------+---------------+------------+
|        8 | 飞利浦9@9v    |     399.00 |
+----------+---------------+------------+
1 row in set (0.00 sec)

mysql> #有的时候必须建临时表,
mysql> #比如,每个栏目的平均商品价格
mysql> #比如每个栏目下的最高d价格的商品
mysql> create algorithm=temptable view v3 as select goods_id,cat_id,goods_name from goods order by cat_id asc ,goods_id desc;
Query OK, 0 rows affected (0.21 sec)

mysql> select * from v3 group by cat_id;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       16 |      2 | 恒基伟业g101                           |
|       32 |      3 | 诺基亚n85                              |
|       18 |      4 | 夏新t5                                 |
|       23 |      5 | 诺基亚n96                              |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        6 |     11 | 胜创kingmax内存卡                      |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       30 |     14 | 移动20元充值卡                         |
|       28 |     15 | 联通50元充值卡                         |
+----------+--------+----------------------------------------+
9 rows in set (0.05 sec)

mysql> select * from v3;
+----------+--------+----------------------------------------+
| goods_id | cat_id | goods_name                             |
+----------+--------+----------------------------------------+
|       16 |      2 | 恒基伟业g101                           |
|       32 |      3 | 诺基亚n85                              |
|       31 |      3 | 摩托罗拉e8                             |
|       24 |      3 | p806                                   |
|       22 |      3 | 多普达touch hd                         |
|       21 |      3 | 金立 a30                               |
|       20 |      3 | 三星bc01                               |
|       19 |      3 | 三星sgh-f258                           |
|       17 |      3 | 夏新n7                                 |
|       15 |      3 | 摩托罗拉a810                           |
|       13 |      3 | 诺基亚5320 xpressmusic                 |
|       12 |      3 | 摩托罗拉a810                           |
|       11 |      3 | 索爱c702c                              |
|       10 |      3 | 索爱c702c                              |
|        9 |      3 | 诺基亚e66                              |
|        8 |      3 | 飞利浦9@9v                             |
|       18 |      4 | 夏新t5                                 |
|       14 |      4 | 诺基亚5800xm                           |
|        1 |      4 | kd876                                  |
|       23 |      5 | 诺基亚n96                              |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |
|        4 |      8 | 诺基亚n85原装充电器                    |
|        3 |      8 | 诺基亚原装5800耳机                     |
|        6 |     11 | 胜创kingmax内存卡                      |
|        5 |     11 | 索爱原装m2卡读卡器                     |
|       26 |     13 | 小灵通/固话20元充值卡                  |
|       25 |     13 | 小灵通/固话50元充值卡                  |
|       30 |     14 | 移动20元充值卡                         |
|       29 |     14 | 移动100元充值卡                        |
|       28 |     15 | 联通50元充值卡                         |
|       27 |     15 | 联通100元充值卡                        |
+----------+--------+----------------------------------------+
31 rows in set (0.00 sec)

mysql> drop view v3;
Query OK, 0 rows affected (0.27 sec)

mysql> create algorithm=temptable view v3 as select goods_id,cat_id,goods_name,shop_price from goods order by cat_id asc ,shop_price desc;
Query OK, 0 rows affected (0.31 sec)

mysql> slect * form v3 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'slect * form v3' at line 1
mysql> select * form v3 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form v3' at line 1
mysql> select * from v3 ;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       32 |      3 | 诺基亚n85                              |    3010.00 |
|       17 |      3 | 夏新n7                                 |    2300.00 |
|        9 |      3 | 诺基亚e66                              |    2298.00 |
|       21 |      3 | 金立 a30                               |    2000.00 |
|       24 |      3 | p806                                   |    2000.00 |
|       31 |      3 | 摩托罗拉e8                             |    1337.00 |
|       10 |      3 | 索爱c702c                              |    1328.00 |
|       13 |      3 | 诺基亚5320 xpressmusic                 |    1311.00 |
|       11 |      3 | 索爱c702c                              |    1300.00 |
|       12 |      3 | 摩托罗拉a810                           |     983.00 |
|       19 |      3 | 三星sgh-f258                           |     858.00 |
|       15 |      3 | 摩托罗拉a810                           |     788.00 |
|        8 |      3 | 飞利浦9@9v                             |     399.00 |
|       20 |      3 | 三星bc01                               |     280.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       14 |      4 | 诺基亚5800xm                           |    2625.00 |
|        1 |      4 | kd876                                  |    1388.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        3 |      8 | 诺基亚原装5800耳机                     |      68.00 |
|        4 |      8 | 诺基亚n85原装充电器                    |      58.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|        5 |     11 | 索爱原装m2卡读卡器                     |      20.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       26 |     13 | 小灵通/固话20元充值卡                  |      19.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       30 |     14 | 移动20元充值卡                         |      18.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
|       28 |     15 | 联通50元充值卡                         |      45.00 |
+----------+--------+----------------------------------------+------------+
31 rows in set (0.00 sec)

mysql> select * from v3 group by cat_id;
+----------+--------+----------------------------------------+------------+
| goods_id | cat_id | goods_name                             | shop_price |
+----------+--------+----------------------------------------+------------+
|       16 |      2 | 恒基伟业g101                           |     823.33 |
|       22 |      3 | 多普达touch hd                         |    5999.00 |
|       18 |      4 | 夏新t5                                 |    2878.00 |
|       23 |      5 | 诺基亚n96                              |    3700.00 |
|        7 |      8 | 诺基亚n85原装立体声耳机hs-82           |     100.00 |
|        6 |     11 | 胜创kingmax内存卡                      |      42.00 |
|       25 |     13 | 小灵通/固话50元充值卡                  |      48.00 |
|       29 |     14 | 移动100元充值卡                        |      90.00 |
|       27 |     15 | 联通100元充值卡                        |      95.00 |
+----------+--------+----------------------------------------+------------+
9 rows in set (0.03 sec)

mysql> #编码问题
mysql> #字符编码到字符集的映射
mysql> #gb2312,utf-8
mysql> #unicode 码表,----- utf-8 压缩文件的关系
mysql> #如何截取utf-8无乱码
mysql> #从头开始,取1个字节,
mysql> #通过位运算,计算连续的1的g个数
mysql> #如为0 截取1个
mysql> #如为n 则截取n个
mysql> gbk转为utf-8
    -> \c
mysql> #jbk
mysql> #jbk 转unicode 在转utf-8
mysql> #乱码是怎么形成,编码和解码不统一
mysql> #转码过程字节丢失
mysql> create table t(id int ,name varchar(50) not null default("1244"));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '("1244"))' at line 1
mysql> create table t(id int ,name varchar(50) not null default(1244));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(1244))' at line 1
mysql> create table t(id int ,name varchar(50) not null default '1244');
ERROR 1050 (42S01): Table 't' already exists
mysql> create table tem(id int ,time datetime not null default now() );;
Query OK, 0 rows affected (0.95 sec)

ERROR: 
No query specified

mysql> desc time;
ERROR 1146 (42S02): Table 'test01.time' doesn't exist
mysql> desc tem;
+-------+----------+------+-----+-------------------+-------+
| Field | Type     | Null | Key | Default           | Extra |
+-------+----------+------+-----+-------------------+-------+
| id    | int(11)  | YES  |     | NULL              |       |
| time  | datetime | NO   |     | CURRENT_TIMESTAMP |       |
+-------+----------+------+-----+-------------------+-------+
2 rows in set (0.13 sec)

mysql> drop tem;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'tem' at line 1
mysql> drop table tem;
Query OK, 0 rows affected (0.49 sec)

mysql> create table tem(id int(11) not null primary key ,name varchar(50) not null ,time datetime not null default now());
Query OK, 0 rows affected (0.39 sec)

mysql> insert into tem values(1,"lili"),(2,"韩梅梅"),(3,"笑话"),(4,"哈哈");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into tem values(1,"lili",null),(2,"韩梅梅",null),(3,"笑话",null),(4,"哈哈",null);
ERROR 1048 (23000): Column 'time' cannot be null
mysql> insert into tem(id,name) values(1,"lili"),(2,"韩梅梅"),(3,"笑话"),(4,"哈哈");
Query OK, 4 rows affected (0.20 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from tem;
+----+-----------+---------------------+
| id | name      | time                |
+----+-----------+---------------------+
|  1 | lili      | 2019-10-16 19:45:54 |
|  2 | 韩梅梅    | 2019-10-16 19:45:54 |
|  3 | 笑话      | 2019-10-16 19:45:54 |
|  4 | 哈哈      | 2019-10-16 19:45:54 |
+----+-----------+---------------------+
4 rows in set (0.00 sec)

mysql> delete from tem order by id desc limit 2;
Query OK, 2 rows affected (0.33 sec)

mysql> select * from tem;
+----+-----------+---------------------+
| id | name      | time                |
+----+-----------+---------------------+
|  1 | lili      | 2019-10-16 19:45:54 |
|  2 | 韩梅梅    | 2019-10-16 19:45:54 |
+----+-----------+---------------------+
2 rows in set (0.00 sec)

mysql> select *,week(time) from tem;
+----+-----------+---------------------+------------+
| id | name      | time                | week(time) |
+----+-----------+---------------------+------------+
|  1 | lili      | 2019-10-16 19:45:54 |         41 |
|  2 | 韩梅梅    | 2019-10-16 19:45:54 |         41 |
+----+-----------+---------------------+------------+
2 rows in set (0.01 sec)

mysql> #设置client 和connection的字符集
mysql> # set character_set_client=gbk;
mysql> # set character_set_connection=utf8
mysql> # set character_set_ressults=gbk;
mysql> # set character_set_results=gbk;
mysql> # 1366 字符编码问题
mysql> 大转小会丢失
    -> \c
mysql> #即 server> connection> client 编码范围
mysql> #client con results 都是hgbk
mysql> #client con results 都是gbk
mysql> #若三者都是gbk 则可以简写
mysql> # 即 set names gbk
mysql> #utf8中文截取无乱码
mysql> #存储引擎,
mysql> # innodb myisam  innodb支持事务,
mysql> 
mysql> #start transaction;
mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> #commit;
mysql> #rollback;
mysql> exit
