mysql> exit
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
| test01             |
+--------------------+
5 rows in set (0.05 sec)

mysql> #linux安装mysql,下载mysql5.5-linux版 tar解压到 /usr/local
mysql> #添加用户组和权限
mysql> # cd /usr/local/mysql
mysql> # chown -R mysql
mysql> chgrp -R mysql .
    -> \c
mysql> # 安装 scripts/mysql_install_db --user=mysql 
mysql> # 开机启动配置 cp support-files/mysql.server /etc/init.d/mysqld
mysql> sudo update-rc.d -f mysql.server defaults\c
mysql> # sudo update-rc.d -f mysql.server defaults
mysql> # service mysql start
mysql> # service mysql stop
mysql> #之后登录并修改密码
mysql> # 设置环境变量
mysql> # sudo
mysql> # sudo vim /etc/profile
mysql> # 追加   
mysql> # export MYSQL_HOME=/usr/local/mysql
mysql> # 
mysql> # export PATH=${MYSQL_HOME}/bin:$PATH
mysql> # 
mysql> #FLUSH PRIVILEGES;
mysql> #修改字符集,修改/etc/my.cnf 添加字符集设置,
mysql> #重启service mysql restart
mysql> # 数据文件 frm 存放表结构 myd 存放数据,myi存放索引
mysql> #mysql 的逻辑架构介绍,插件式的引擎架构 1 连接层,2 服务层 3 引擎层 4 存储层
mysql> # 存储引擎 ;
mysql> show engines;
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
| CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
| ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
| MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
9 rows in set (0.03 sec)

mysql> show variables like "%storage_engine%";
+------------------------+--------+
| Variable_name          | Value  |
+------------------------+--------+
| default_storage_engine | InnoDB |
| storage_engine         | InnoDB |
+------------------------+--------+
2 rows in set (0.05 sec)

mysql> #索引优化,
mysql> #性能下降sql慢
mysql> #执行时间长
mysql> #等待时间长
mysql> #sql烂 ,索引失效,单值索引,复合
mysql> # create index idx_user_name on user(name);
mysql> #有太多的join 
mysql> #服务器调优及各个参数设置
mysql> #sql 的执行顺序
mysql> #  手写 select xxx from table join table on table_condition=table_condition where group by having order by limit;
mysql> #  手写 select xxx from table join table on table_condition=table_condition where group by order by limit having ;
mysql> # 机读:: from 表   on
mysql> # where 
mysql> # group by
mysql> # having
mysql> # distinct
mysql> # order by
mysql> #总结:  
mysql> # join 关系
mysql> # a b 关系求交集 即 select xxx from a inner join b on a.key=b.key;
mysql> # a b 左表的全部加上ab的共有 即 a select xxx from a left join b on a.key=b.key;
mysql> # a b b的全部加上ab共有 右连接 即 b select xxx from a right join b on a.key=b.key;
mysql> # a b a的部分 即a表-ab共有 即 select xxx from a left join b on a.key=b.key where b.key=null;
mysql> # a b b的部分 即b表-ab共有 即 select xxx from a right join b on a.key=b.key where a.key=null;
mysql> # a b a的部分 即a表-ab共有 即 select xxx from a left join b on a.key=b.key where b.key is null;
mysql> # a b b的部分 即b表-ab共有 即 select xxx from a right join b on a.key=b.key where a.key is null;
mysql> # a b 求并集 即 select xxx from a outer join b on a.key=b.key;
mysql> # a b 求并集 即 select xxx from a full outer join b on a.key=b.key;
mysql> # a b 求ab共有的补集 即 select xxx from a full outer join b on a.key=b.key where a.key is null or b.key is null;
mysql> #7中sql的编写 
mysql> use test01;
Database changed
mysql> /*
   /*> Navicat MySQL Data Transfer
   /*> 
   /*> Source Server         : mysql
   /*> Source Database       : ssm_crud
   /*> 
   /*> Target Server Type    : MYSQL
   /*> Target Server Version : 80012
   /*> File Encoding         : 65001
   /*> 
   /*> Date: 2019-09-26 00:26:59
   /*> */
mysql> 
mysql> SET FOREIGN_KEY_CHECKS=0;
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> -- ----------------------------
mysql> -- Table structure for `tab_dept`
mysql> -- ----------------------------
mysql> DROP TABLE IF EXISTS `tab_dept`;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE TABLE `tab_dept` (
    ->   `dept_id` int(11) NOT NULL AUTO_INCREMENT,
    ->   `dept_name` varchar(255) NOT NULL,
    ->   `db_source` varchar(255) NOT NULL,
    ->   PRIMARY KEY (`dept_id`)
    -> ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.06 sec)

mysql> 
mysql> -- ----------------------------
mysql> -- Records of tab_dept
mysql> -- ----------------------------
mysql> INSERT INTO `tab_dept` VALUES ('1', '开发部', 'db_source1');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `tab_dept` VALUES ('4', '测试部', 'db_source1');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `tab_dept` VALUES ('6', '管理部', 'db_source1');
Query OK, 1 row affected (0.01 sec)

mysql> 
mysql> -- ----------------------------
mysql> -- Table structure for `tab_emp`
mysql> -- ----------------------------
mysql> DROP TABLE IF EXISTS `tab_emp`;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE TABLE `tab_emp` (
    ->   `emp_id` int(11) NOT NULL AUTO_INCREMENT,
    ->   `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    ->   `gender` tinyint(1) DEFAULT NULL,
    ->   `email` varchar(255) DEFAULT NULL,
    ->   `d_id` int(11) NOT NULL,
    ->   PRIMARY KEY (`emp_id`),
    ->   KEY `d_id` (`d_id`),
    ->   CONSTRAINT `tab_emp_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `tab_dept` (`dept_id`)
    -> ) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> -- ----------------------------
mysql> -- Records of tab_emp
mysql> -- ----------------------------
mysql> INSERT INTO `tab_emp` VALUES ('1', '小李', '1', '123@qq.com', '4');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('2', '小马', '1', '456@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('3', '小王', '1', '321@qq.com', '1');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `tab_emp` VALUES ('4', '046100', '1', '046100@qq.com', '4');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO `tab_emp` VALUES ('5', 'babf61', '1', 'babf61@qq.com', '4');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `tab_emp` VALUES ('6', '01fa12', '1', '01fa12@qq.com', '1');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `tab_emp` VALUES ('7', 'f8f6d3', '1', 'f8f6d3@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('8', 'aa5c34', '1', 'aa5c34@qq.com', '1');

mysql> INSERT INTO `tab_emp` VALUES ('403', '139eb399', '1', '139eb399@qq.com', '1');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO `tab_emp` VALUES ('404', 'd2750400', '1', 'd2750400@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('405', '93508401', '1', '93508401@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('406', 'edab3402', '1', 'edab3402@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('407', '95f35403', '1', '95f35403@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('408', 'a7030404', '1', 'a7030404@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('409', 'c41a1405', '1', 'c41a1405@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('410', '3e419406', '1', '3e419406@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('411', '3a7fb407', '1', '3a7fb407@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('412', 'ec638408', '1', 'ec638408@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('413', 'f2c83409', '1', 'f2c83409@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('414', 'f6265410', '1', 'f6265410@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('415', '506a8411', '1', '506a8411@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('416', '61cd5412', '1', '61cd5412@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('417', 'c7dc1413', '1', 'c7dc1413@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('418', '019fe414', '1', '019fe414@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('428', '38438424', '1', '38438424@qq.com', '1');
Query OK, 1 row affected (0.07 sec)

mysql> INSERT INTO `tab_emp` VALUES ('429', '11b75425', '1', '11b75425@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('430', '0b14e426', '1', '0b14e426@qq.com', '1');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO `tab_emp` VALUES ('431', 'e484f427', '1', 'e484f427@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('432', '4c93d428', '1', '4c93d428@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('433', '8f68b429', '1', '8f68b429@qq.com', '1');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO `tab_emp` VALUES ('434', '0d112430', '1', '0d112430@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('435', 'e6deb431', '1', 'e6deb431@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO `tab_emp` VALUES ('436', '78d5c432', '1', '78d5c432@qq.com', '1');
Query OK, 1 row affected (0.02 sec)

mysql> desc tab_dept;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| dept_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| dept_name | varchar(255) | NO   |     | NULL    |                |
| db_source | varchar(255) | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
3 rows in set (0.07 sec)

mysql> select * from tab_dept;
+---------+-----------+------------+
| dept_id | dept_name | db_source  |
+---------+-----------+------------+
|       1 | 开发部    | db_source1 |
|       4 | 测试部    | db_source1 |
|       6 | 管理部    | db_source1 |
+---------+-----------+------------+
3 rows in set (0.00 sec)

mysql> select * from tab_emp limit 10;
+--------+----------+--------+---------------+------+
| emp_id | emp_name | gender | email         | d_id |
+--------+----------+--------+---------------+------+
|      1 | 小李     |      1 | 123@qq.com    |    4 |
|      2 | 小马     |      1 | 456@qq.com    |    1 |
|      3 | 小王     |      1 | 321@qq.com    |    1 |
|      4 | 046100   |      1 | 046100@qq.com |    4 |
|      5 | babf61   |      1 | babf61@qq.com |    4 |
|      6 | 01fa12   |      1 | 01fa12@qq.com |    1 |
|      7 | f8f6d3   |      1 | f8f6d3@qq.com |    1 |
|      8 | aa5c34   |      1 | aa5c34@qq.com |    1 |
|      9 | 24cab5   |      1 | 24cab5@qq.com |    1 |
|     10 | f953c6   |      1 | f953c6@qq.com |    1 |
+--------+----------+--------+---------------+------+
10 rows in set (0.00 sec)

mysql> delete tab_emp where emp_id limit(100,800);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where emp_id limit(100,800)' at line 1
mysql> delete from  tab_emp where emp_id limit(100,800);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(100,800)' at line 1
mysql> delete from  tab_emp where order by emp_id  limit(100,800);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order by emp_id  limit(100,800)' at line 1
mysql> delete from  tab_emp where order by emp_id asc limit(100,800);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order by emp_id asc limit(100,800)' at line 1
mysql> delete from  tab_emp where order by emp_id desc limit 900 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order by emp_id desc limit 900' at line 1
mysql> delete from  select * form tab_emp order by  emp_id desc limit 100,800;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select * form tab_emp order by  emp_id desc limit 100,800' at line 1
mysql> delete from  tab_emp order by  emp_id desc limit 100,800;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '800' at line 1
mysql> delete from  tab_emp order by  emp_id desc limit(100,500);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(100,500)' at line 1
mysql> delete from  tab_emp where emp_id =500;
Query OK, 1 row affected (0.11 sec)

mysql> delete from  tab_emp  order by emp_id desc limit 200;
Query OK, 200 rows affected (0.33 sec)

mysql> delete from  tab_emp  order by emp_id desc limit 500;
Query OK, 500 rows affected (0.08 sec)

mysql> delete from  tab_emp  order by emp_id desc limit 100;
Query OK, 100 rows affected (0.07 sec)

mysql> select * from tab_emp;
+--------+----------+--------+-----------------+------+
| emp_id | emp_name | gender | email           | d_id |
+--------+----------+--------+-----------------+------+
|      1 | 小李     |      1 | 123@qq.com      |    4 |
|      2 | 小马     |      1 | 456@qq.com      |    1 |
|      3 | 小王     |      1 | 321@qq.com      |    1 |
|      4 | 046100   |      1 | 046100@qq.com   |    4 |
|      5 | babf61   |      1 | babf61@qq.com   |    4 |
|      6 | 01fa12   |      1 | 01fa12@qq.com   |    1 |
|      7 | f8f6d3   |      1 | f8f6d3@qq.com   |    1 |
|      8 | aa5c34   |      1 | aa5c34@qq.com   |    1 |
|      9 | 24cab5   |      1 | 24cab5@qq.com   |    1 |
|     10 | f953c6   |      1 | f953c6@qq.com   |    1 |
|     11 | 001b27   |      1 | 001b27@qq.com   |    1 |
|     12 | 73d828   |      1 | 73d828@qq.com   |    1 |
|     13 | 513239   |      1 | 513239@qq.com   |    1 |
|     14 | e56a710  |      1 | e56a710@qq.com  |    1 |
|     15 | d8a4511  |      1 | d8a4511@qq.com  |    1 |
|     16 | 4692e12  |      1 | 4692e12@qq.com  |    1 |
|     17 | bd7c813  |      1 | bd7c813@qq.com  |    1 |
|     18 | 1bc0114  |      1 | 1bc0114@qq.com  |    1 |
|     19 | 9b47615  |      0 | 9b47615@qq.com  |    6 |
|     20 | f29b616  |      1 | f29b616@qq.com  |    1 |
|     21 | 9676917  |      1 | 9676917@qq.com  |    1 |
|     22 | 563d918  |      1 | 563d918@qq.com  |    1 |
|     23 | 5dcdb19  |      1 | 5dcdb19@qq.com  |    1 |
|     24 | cd56020  |      0 | cd56020@qq.com  |    4 |
|     25 | c130321  |      1 | c130321@qq.com  |    1 |
|     26 | 5b51a22  |      1 | 5b51a22@qq.com  |    1 |
|     27 | 3384323  |      1 | 3384323@qq.com  |    1 |
|     28 | 7a78a24  |      1 | 7a78a24@qq.com  |    1 |
|     29 | d8cd925  |      1 | d8cd925@qq.com  |    1 |
|     30 | 1072c26  |      1 | 1072c26@qq.com  |    1 |
|     31 | 4a64f27  |      1 | 4a64f27@qq.com  |    1 |
|     32 | bd15428  |      1 | bd15428@qq.com  |    1 |
|     33 | 5f17b29  |      1 | 5f17b29@qq.com  |    1 |
|     34 | 7654130  |      1 | 7654130@qq.com  |    1 |
|     35 | 7a88931  |      1 | 7a88931@qq.com  |    1 |
|     36 | caf4532  |      1 | caf4532@qq.com  |    1 |
|     37 | fee1233  |      1 | fee1233@qq.com  |    1 |
|     38 | 16a3634  |      1 | 16a3634@qq.com  |    1 |
|     39 | f783d35  |      1 | f783d35@qq.com  |    1 |
|     40 | 849f336  |      1 | 849f336@qq.com  |    1 |
|     41 | 27d4837  |      1 | 27d4837@qq.com  |    1 |
|     42 | fc55e38  |      1 | fc55e38@qq.com  |    1 |
|     43 | cbb2839  |      1 | cbb2839@qq.com  |    1 |
|     44 | 758f740  |      1 | 758f740@qq.com  |    1 |
|     45 | 6883b41  |      1 | 6883b41@qq.com  |    1 |
|     46 | 5e84442  |      1 | 5e84442@qq.com  |    1 |
|     47 | 2fcf643  |      1 | 2fcf643@qq.com  |    1 |
|     48 | 591b044  |      1 | 591b044@qq.com  |    1 |
|     49 | c7ac245  |      1 | c7ac245@qq.com  |    1 |
|     50 | ed3ef46  |      1 | ed3ef46@qq.com  |    1 |
|     51 | ec2ea47  |      1 | ec2ea47@qq.com  |    1 |
|     52 | 1ea0b48  |      1 | 1ea0b48@qq.com  |    1 |
|     53 | 1ae8a49  |      1 | 1ae8a49@qq.com  |    1 |
|     54 | 5dc8950  |      1 | 5dc8950@qq.com  |    1 |
|     55 | 42ec851  |      1 | 42ec851@qq.com  |    1 |
|     56 | c1b1752  |      1 | c1b1752@qq.com  |    1 |
|     57 | 227ab53  |      0 | 227ab53@qq.com  |    1 |
|     58 | c342054  |      1 | c342054@qq.com  |    1 |
|     59 | 8260155  |      0 | 8260155@qq.com  |    1 |
|     60 | b9a8556  |      1 | b9a8556@qq.com  |    1 |
|     61 | 186a457  |      1 | 186a457@qq.com  |    1 |
|     62 | 9bf4f58  |      1 | 9bf4f58@qq.com  |    1 |
|     63 | 799f659  |      1 | 799f659@qq.com  |    1 |
|     64 | 67a6360  |      1 | 67a6360@qq.com  |    1 |
|     65 | f372961  |      1 | f372961@qq.com  |    1 |
|     66 | ecdaf62  |      1 | ecdaf62@qq.com  |    1 |
|     67 | 9e2ae63  |      1 | 9e2ae63@qq.com  |    1 |
|     68 | 8517c64  |      1 | 8517c64@qq.com  |    1 |
|     69 | b139a65  |      1 | b139a65@qq.com  |    1 |
|     70 | b8b1566  |      1 | b8b1566@qq.com  |    1 |
|     71 | 36cb267  |      1 | 36cb267@qq.com  |    1 |
|     72 | c723568  |      1 | c723568@qq.com  |    1 |
|     73 | 0ed4169  |      1 | 0ed4169@qq.com  |    1 |
|     74 | ec3f370  |      1 | ec3f370@qq.com  |    1 |
|     75 | 6b18f71  |      1 | 6b18f71@qq.com  |    1 |
|     76 | a999772  |      1 | a999772@qq.com  |    1 |
|     77 | e588b73  |      1 | e588b73@qq.com  |    1 |
|     78 | 6841b74  |      1 | 6841b74@qq.com  |    1 |
|     79 | f508975  |      1 | f508975@qq.com  |    1 |
|     80 | c060b76  |      1 | c060b76@qq.com  |    1 |
|     81 | c627d77  |      1 | c627d77@qq.com  |    1 |
|     82 | 786f678  |      1 | 786f678@qq.com  |    1 |
|     83 | 1cdbc79  |      1 | 1cdbc79@qq.com  |    1 |
|     84 | 38d3a80  |      1 | 38d3a80@qq.com  |    1 |
|     85 | 6a30881  |      1 | 6a30881@qq.com  |    1 |
|     86 | 6d91682  |      1 | 6d91682@qq.com  |    1 |
|     87 | c758283  |      1 | c758283@qq.com  |    1 |
|     88 | c8f2c84  |      1 | c8f2c84@qq.com  |    1 |
|     89 | 4884985  |      1 | 4884985@qq.com  |    1 |
|     90 | 1d6e286  |      1 | 1d6e286@qq.com  |    1 |
|     91 | b218487  |      1 | b218487@qq.com  |    1 |
|     92 | 6449388  |      1 | 6449388@qq.com  |    1 |
|     93 | b0e7489  |      1 | b0e7489@qq.com  |    1 |
|     94 | 8193890  |      1 | 8193890@qq.com  |    1 |
|     95 | 4707291  |      1 | 4707291@qq.com  |    1 |
|     96 | 6871592  |      1 | 6871592@qq.com  |    1 |
|     97 | 0ba6293  |      1 | 0ba6293@qq.com  |    1 |
|     98 | 687e494  |      1 | 687e494@qq.com  |    1 |
|     99 | b478c95  |      1 | b478c95@qq.com  |    1 |
|    100 | 7252f96  |      1 | 7252f96@qq.com  |    1 |
|    101 | dca2097  |      1 | dca2097@qq.com  |    1 |
|    102 | 296f898  |      1 | 296f898@qq.com  |    1 |
|    103 | 8eb2f99  |      1 | 8eb2f99@qq.com  |    1 |
|    104 | 26891100 |      1 | 26891100@qq.com |    1 |
|    105 | 318d9101 |      1 | 318d9101@qq.com |    1 |
|    106 | a531c102 |      1 | a531c102@qq.com |    1 |
|    107 | b84b6103 |      1 | b84b6103@qq.com |    1 |
|    108 | 0815d104 |      1 | 0815d104@qq.com |    1 |
|    109 | 61d3c105 |      1 | 61d3c105@qq.com |    1 |
|    110 | caa9f106 |      1 | caa9f106@qq.com |    1 |
|    111 | b4e56107 |      1 | b4e56107@qq.com |    1 |
|    112 | 3f89a108 |      1 | 3f89a108@qq.com |    1 |
|    113 | c877f109 |      1 | c877f109@qq.com |    1 |
|    114 | 64e4c110 |      1 | 64e4c110@qq.com |    1 |
|    115 | 198e3111 |      1 | 198e3111@qq.com |    1 |
|    116 | ebd34112 |      1 | ebd34112@qq.com |    1 |
|    117 | 8cb9c113 |      1 | 8cb9c113@qq.com |    1 |
|    118 | cabc0114 |      1 | cabc0114@qq.com |    1 |
|    119 | c612d115 |      1 | c612d115@qq.com |    1 |
|    120 | 3e3e5116 |      1 | 3e3e5116@qq.com |    1 |
|    121 | b9984117 |      1 | b9984117@qq.com |    1 |
|    122 | 425a8118 |      1 | 425a8118@qq.com |    1 |
|    123 | 32cfb119 |      1 | 32cfb119@qq.com |    1 |
|    124 | e5350120 |      1 | e5350120@qq.com |    1 |
|    125 | 4a4e5121 |      1 | 4a4e5121@qq.com |    1 |
|    126 | 60f15122 |      1 | 60f15122@qq.com |    1 |
|    127 | 9c44c123 |      1 | 9c44c123@qq.com |    1 |
|    128 | a90e5124 |      1 | a90e5124@qq.com |    1 |
|    129 | 9b422125 |      1 | 9b422125@qq.com |    1 |
|    130 | 85adc126 |      1 | 85adc126@qq.com |    1 |
|    131 | 9b5a3127 |      1 | 9b5a3127@qq.com |    1 |
|    132 | 8cfc8128 |      1 | 8cfc8128@qq.com |    1 |
|    133 | 4bd9b129 |      1 | 4bd9b129@qq.com |    1 |
|    134 | 1dd8a130 |      1 | 1dd8a130@qq.com |    1 |
|    135 | 8556d131 |      1 | 8556d131@qq.com |    1 |
|    136 | 0b8c7132 |      1 | 0b8c7132@qq.com |    1 |
|    137 | eee33133 |      1 | eee33133@qq.com |    1 |
|    138 | 2ba4a134 |      1 | 2ba4a134@qq.com |    1 |
|    139 | e4d9c135 |      1 | e4d9c135@qq.com |    1 |
|    140 | 746c2136 |      1 | 746c2136@qq.com |    1 |
|    141 | d2f3c137 |      1 | d2f3c137@qq.com |    1 |
|    142 | 47323138 |      1 | 47323138@qq.com |    1 |
|    143 | 588e1139 |      1 | 588e1139@qq.com |    1 |
|    144 | 03ed7140 |      1 | 03ed7140@qq.com |    1 |
|    145 | 94cc6141 |      1 | 94cc6141@qq.com |    1 |
|    146 | aba59142 |      1 | aba59142@qq.com |    1 |
|    147 | 190ec143 |      1 | 190ec143@qq.com |    1 |
|    148 | bea77144 |      1 | bea77144@qq.com |    1 |
|    149 | 3465a145 |      1 | 3465a145@qq.com |    1 |
|    150 | 21e13146 |      1 | 21e13146@qq.com |    1 |
|    151 | 87c0d147 |      1 | 87c0d147@qq.com |    1 |
|    152 | 58d3b148 |      1 | 58d3b148@qq.com |    1 |
|    153 | 6fb9b149 |      1 | 6fb9b149@qq.com |    1 |
|    154 | 0348b150 |      1 | 0348b150@qq.com |    1 |
|    155 | be602151 |      1 | be602151@qq.com |    1 |
|    156 | a3c0f152 |      1 | a3c0f152@qq.com |    1 |
|    157 | c924e153 |      1 | c924e153@qq.com |    1 |
|    158 | 67e53154 |      1 | 67e53154@qq.com |    1 |
|    159 | b7d74155 |      1 | b7d74155@qq.com |    1 |
|    160 | 1f51b156 |      1 | 1f51b156@qq.com |    1 |
|    161 | bee63157 |      1 | bee63157@qq.com |    1 |
|    162 | d1013158 |      1 | d1013158@qq.com |    1 |
|    163 | 55855159 |      1 | 55855159@qq.com |    1 |
|    164 | e1e7d160 |      1 | e1e7d160@qq.com |    1 |
|    165 | c8e13161 |      1 | c8e13161@qq.com |    1 |
|    166 | 7cfde162 |      1 | 7cfde162@qq.com |    1 |
|    167 | 4b043163 |      1 | 4b043163@qq.com |    1 |
|    168 | 35756164 |      1 | 35756164@qq.com |    1 |
|    169 | 6fcf2165 |      1 | 6fcf2165@qq.com |    1 |
|    170 | 139b0166 |      1 | 139b0166@qq.com |    1 |
|    171 | 981cb167 |      1 | 981cb167@qq.com |    1 |
|    172 | 0f387168 |      1 | 0f387168@qq.com |    1 |
|    173 | 722ab169 |      1 | 722ab169@qq.com |    1 |
|    174 | 0c293170 |      1 | 0c293170@qq.com |    1 |
|    175 | dce29171 |      1 | dce29171@qq.com |    1 |
|    176 | dcc70172 |      1 | dcc70172@qq.com |    1 |
|    177 | cc3af173 |      1 | cc3af173@qq.com |    1 |
|    178 | 9aeb9174 |      1 | 9aeb9174@qq.com |    1 |
|    179 | 6c8b7175 |      1 | 6c8b7175@qq.com |    1 |
|    180 | 3908a176 |      1 | 3908a176@qq.com |    1 |
|    181 | 798f6177 |      1 | 798f6177@qq.com |    1 |
|    182 | cf330178 |      1 | cf330178@qq.com |    1 |
|    183 | 71a30179 |      1 | 71a30179@qq.com |    1 |
|    184 | 29d53180 |      1 | 29d53180@qq.com |    1 |
|    185 | c5153181 |      1 | c5153181@qq.com |    1 |
|    186 | e02f3182 |      1 | e02f3182@qq.com |    1 |
|    187 | b7ae4183 |      1 | b7ae4183@qq.com |    1 |
|    188 | 6bbef184 |      1 | 6bbef184@qq.com |    1 |
|    189 | 71745185 |      1 | 71745185@qq.com |    1 |
|    190 | d1627186 |      1 | d1627186@qq.com |    1 |
|    191 | 15088187 |      1 | 15088187@qq.com |    1 |
|    192 | 3ea80188 |      1 | 3ea80188@qq.com |    1 |
|    193 | 77926189 |      1 | 77926189@qq.com |    1 |
|    194 | 73f07190 |      1 | 73f07190@qq.com |    1 |
|    195 | b9e11191 |      1 | b9e11191@qq.com |    1 |
|    196 | 98663192 |      1 | 98663192@qq.com |    1 |
|    197 | e5efe193 |      1 | e5efe193@qq.com |    1 |
|    198 | a4e1c194 |      1 | a4e1c194@qq.com |    1 |
|    199 | b2863195 |      1 | b2863195@qq.com |    1 |
|    200 | b44c2196 |      1 | b44c2196@qq.com |    1 |
|    201 | 90310197 |      1 | 90310197@qq.com |    1 |
|    202 | fca1e198 |      1 | fca1e198@qq.com |    1 |
|    203 | 7257b199 |      1 | 7257b199@qq.com |    1 |
|    204 | d5ce8200 |      1 | d5ce8200@qq.com |    1 |
|    205 | 48707201 |      1 | 48707201@qq.com |    1 |
|    206 | bb1e7202 |      1 | bb1e7202@qq.com |    1 |
|    207 | a251b203 |      1 | a251b203@qq.com |    1 |
|    208 | 0066d204 |      1 | 0066d204@qq.com |    1 |
+--------+----------+--------+-----------------+------+
208 rows in set (0.00 sec)

mysql> delete from  tab_emp  order by emp_id desc limit 100;
Query OK, 100 rows affected (0.01 sec)

mysql> select * from tab_emp;
+--------+----------+--------+-----------------+------+
| emp_id | emp_name | gender | email           | d_id |
+--------+----------+--------+-----------------+------+
|      1 | 小李     |      1 | 123@qq.com      |    4 |
|      2 | 小马     |      1 | 456@qq.com      |    1 |
|      3 | 小王     |      1 | 321@qq.com      |    1 |
|      4 | 046100   |      1 | 046100@qq.com   |    4 |
|      5 | babf61   |      1 | babf61@qq.com   |    4 |
|      6 | 01fa12   |      1 | 01fa12@qq.com   |    1 |
|      7 | f8f6d3   |      1 | f8f6d3@qq.com   |    1 |
|      8 | aa5c34   |      1 | aa5c34@qq.com   |    1 |
|      9 | 24cab5   |      1 | 24cab5@qq.com   |    1 |
|     10 | f953c6   |      1 | f953c6@qq.com   |    1 |
|     11 | 001b27   |      1 | 001b27@qq.com   |    1 |
|     12 | 73d828   |      1 | 73d828@qq.com   |    1 |
|     13 | 513239   |      1 | 513239@qq.com   |    1 |
|     14 | e56a710  |      1 | e56a710@qq.com  |    1 |
|     15 | d8a4511  |      1 | d8a4511@qq.com  |    1 |
|     16 | 4692e12  |      1 | 4692e12@qq.com  |    1 |
|     17 | bd7c813  |      1 | bd7c813@qq.com  |    1 |
|     18 | 1bc0114  |      1 | 1bc0114@qq.com  |    1 |
|     19 | 9b47615  |      0 | 9b47615@qq.com  |    6 |
|     20 | f29b616  |      1 | f29b616@qq.com  |    1 |
|     21 | 9676917  |      1 | 9676917@qq.com  |    1 |
|     22 | 563d918  |      1 | 563d918@qq.com  |    1 |
|     23 | 5dcdb19  |      1 | 5dcdb19@qq.com  |    1 |
|     24 | cd56020  |      0 | cd56020@qq.com  |    4 |
|     25 | c130321  |      1 | c130321@qq.com  |    1 |
|     26 | 5b51a22  |      1 | 5b51a22@qq.com  |    1 |
|     27 | 3384323  |      1 | 3384323@qq.com  |    1 |
|     28 | 7a78a24  |      1 | 7a78a24@qq.com  |    1 |
|     29 | d8cd925  |      1 | d8cd925@qq.com  |    1 |
|     30 | 1072c26  |      1 | 1072c26@qq.com  |    1 |
|     31 | 4a64f27  |      1 | 4a64f27@qq.com  |    1 |
|     32 | bd15428  |      1 | bd15428@qq.com  |    1 |
|     33 | 5f17b29  |      1 | 5f17b29@qq.com  |    1 |
|     34 | 7654130  |      1 | 7654130@qq.com  |    1 |
|     35 | 7a88931  |      1 | 7a88931@qq.com  |    1 |
|     36 | caf4532  |      1 | caf4532@qq.com  |    1 |
|     37 | fee1233  |      1 | fee1233@qq.com  |    1 |
|     38 | 16a3634  |      1 | 16a3634@qq.com  |    1 |
|     39 | f783d35  |      1 | f783d35@qq.com  |    1 |
|     40 | 849f336  |      1 | 849f336@qq.com  |    1 |
|     41 | 27d4837  |      1 | 27d4837@qq.com  |    1 |
|     42 | fc55e38  |      1 | fc55e38@qq.com  |    1 |
|     43 | cbb2839  |      1 | cbb2839@qq.com  |    1 |
|     44 | 758f740  |      1 | 758f740@qq.com  |    1 |
|     45 | 6883b41  |      1 | 6883b41@qq.com  |    1 |
|     46 | 5e84442  |      1 | 5e84442@qq.com  |    1 |
|     47 | 2fcf643  |      1 | 2fcf643@qq.com  |    1 |
|     48 | 591b044  |      1 | 591b044@qq.com  |    1 |
|     49 | c7ac245  |      1 | c7ac245@qq.com  |    1 |
|     50 | ed3ef46  |      1 | ed3ef46@qq.com  |    1 |
|     51 | ec2ea47  |      1 | ec2ea47@qq.com  |    1 |
|     52 | 1ea0b48  |      1 | 1ea0b48@qq.com  |    1 |
|     53 | 1ae8a49  |      1 | 1ae8a49@qq.com  |    1 |
|     54 | 5dc8950  |      1 | 5dc8950@qq.com  |    1 |
|     55 | 42ec851  |      1 | 42ec851@qq.com  |    1 |
|     56 | c1b1752  |      1 | c1b1752@qq.com  |    1 |
|     57 | 227ab53  |      0 | 227ab53@qq.com  |    1 |
|     58 | c342054  |      1 | c342054@qq.com  |    1 |
|     59 | 8260155  |      0 | 8260155@qq.com  |    1 |
|     60 | b9a8556  |      1 | b9a8556@qq.com  |    1 |
|     61 | 186a457  |      1 | 186a457@qq.com  |    1 |
|     62 | 9bf4f58  |      1 | 9bf4f58@qq.com  |    1 |
|     63 | 799f659  |      1 | 799f659@qq.com  |    1 |
|     64 | 67a6360  |      1 | 67a6360@qq.com  |    1 |
|     65 | f372961  |      1 | f372961@qq.com  |    1 |
|     66 | ecdaf62  |      1 | ecdaf62@qq.com  |    1 |
|     67 | 9e2ae63  |      1 | 9e2ae63@qq.com  |    1 |
|     68 | 8517c64  |      1 | 8517c64@qq.com  |    1 |
|     69 | b139a65  |      1 | b139a65@qq.com  |    1 |
|     70 | b8b1566  |      1 | b8b1566@qq.com  |    1 |
|     71 | 36cb267  |      1 | 36cb267@qq.com  |    1 |
|     72 | c723568  |      1 | c723568@qq.com  |    1 |
|     73 | 0ed4169  |      1 | 0ed4169@qq.com  |    1 |
|     74 | ec3f370  |      1 | ec3f370@qq.com  |    1 |
|     75 | 6b18f71  |      1 | 6b18f71@qq.com  |    1 |
|     76 | a999772  |      1 | a999772@qq.com  |    1 |
|     77 | e588b73  |      1 | e588b73@qq.com  |    1 |
|     78 | 6841b74  |      1 | 6841b74@qq.com  |    1 |
|     79 | f508975  |      1 | f508975@qq.com  |    1 |
|     80 | c060b76  |      1 | c060b76@qq.com  |    1 |
|     81 | c627d77  |      1 | c627d77@qq.com  |    1 |
|     82 | 786f678  |      1 | 786f678@qq.com  |    1 |
|     83 | 1cdbc79  |      1 | 1cdbc79@qq.com  |    1 |
|     84 | 38d3a80  |      1 | 38d3a80@qq.com  |    1 |
|     85 | 6a30881  |      1 | 6a30881@qq.com  |    1 |
|     86 | 6d91682  |      1 | 6d91682@qq.com  |    1 |
|     87 | c758283  |      1 | c758283@qq.com  |    1 |
|     88 | c8f2c84  |      1 | c8f2c84@qq.com  |    1 |
|     89 | 4884985  |      1 | 4884985@qq.com  |    1 |
|     90 | 1d6e286  |      1 | 1d6e286@qq.com  |    1 |
|     91 | b218487  |      1 | b218487@qq.com  |    1 |
|     92 | 6449388  |      1 | 6449388@qq.com  |    1 |
|     93 | b0e7489  |      1 | b0e7489@qq.com  |    1 |
|     94 | 8193890  |      1 | 8193890@qq.com  |    1 |
|     95 | 4707291  |      1 | 4707291@qq.com  |    1 |
|     96 | 6871592  |      1 | 6871592@qq.com  |    1 |
|     97 | 0ba6293  |      1 | 0ba6293@qq.com  |    1 |
|     98 | 687e494  |      1 | 687e494@qq.com  |    1 |
|     99 | b478c95  |      1 | b478c95@qq.com  |    1 |
|    100 | 7252f96  |      1 | 7252f96@qq.com  |    1 |
|    101 | dca2097  |      1 | dca2097@qq.com  |    1 |
|    102 | 296f898  |      1 | 296f898@qq.com  |    1 |
|    103 | 8eb2f99  |      1 | 8eb2f99@qq.com  |    1 |
|    104 | 26891100 |      1 | 26891100@qq.com |    1 |
|    105 | 318d9101 |      1 | 318d9101@qq.com |    1 |
|    106 | a531c102 |      1 | a531c102@qq.com |    1 |
|    107 | b84b6103 |      1 | b84b6103@qq.com |    1 |
|    108 | 0815d104 |      1 | 0815d104@qq.com |    1 |
+--------+----------+--------+-----------------+------+
108 rows in set (0.00 sec)

mysql> select * from tab_emp inner join tab_dept on tab_emp.d_id =tab_dept.dept_id;
+--------+----------+--------+-----------------+------+---------+-----------+------------+
| emp_id | emp_name | gender | email           | d_id | dept_id | dept_name | db_source  |
+--------+----------+--------+-----------------+------+---------+-----------+------------+
|      2 | 小马     |      1 | 456@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      3 | 小王     |      1 | 321@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      6 | 01fa12   |      1 | 01fa12@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      7 | f8f6d3   |      1 | f8f6d3@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      8 | aa5c34   |      1 | aa5c34@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      9 | 24cab5   |      1 | 24cab5@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     10 | f953c6   |      1 | f953c6@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     11 | 001b27   |      1 | 001b27@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     12 | 73d828   |      1 | 73d828@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     13 | 513239   |      1 | 513239@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     14 | e56a710  |      1 | e56a710@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     15 | d8a4511  |      1 | d8a4511@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     16 | 4692e12  |      1 | 4692e12@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     17 | bd7c813  |      1 | bd7c813@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     18 | 1bc0114  |      1 | 1bc0114@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     20 | f29b616  |      1 | f29b616@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     21 | 9676917  |      1 | 9676917@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     22 | 563d918  |      1 | 563d918@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     23 | 5dcdb19  |      1 | 5dcdb19@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     25 | c130321  |      1 | c130321@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     26 | 5b51a22  |      1 | 5b51a22@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     27 | 3384323  |      1 | 3384323@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     28 | 7a78a24  |      1 | 7a78a24@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     29 | d8cd925  |      1 | d8cd925@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     30 | 1072c26  |      1 | 1072c26@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     31 | 4a64f27  |      1 | 4a64f27@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     32 | bd15428  |      1 | bd15428@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     33 | 5f17b29  |      1 | 5f17b29@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     34 | 7654130  |      1 | 7654130@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     35 | 7a88931  |      1 | 7a88931@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     36 | caf4532  |      1 | caf4532@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     37 | fee1233  |      1 | fee1233@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     38 | 16a3634  |      1 | 16a3634@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     39 | f783d35  |      1 | f783d35@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     40 | 849f336  |      1 | 849f336@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     41 | 27d4837  |      1 | 27d4837@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     42 | fc55e38  |      1 | fc55e38@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     43 | cbb2839  |      1 | cbb2839@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     44 | 758f740  |      1 | 758f740@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     45 | 6883b41  |      1 | 6883b41@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     46 | 5e84442  |      1 | 5e84442@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     47 | 2fcf643  |      1 | 2fcf643@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     48 | 591b044  |      1 | 591b044@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     49 | c7ac245  |      1 | c7ac245@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     50 | ed3ef46  |      1 | ed3ef46@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     51 | ec2ea47  |      1 | ec2ea47@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     52 | 1ea0b48  |      1 | 1ea0b48@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     53 | 1ae8a49  |      1 | 1ae8a49@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     54 | 5dc8950  |      1 | 5dc8950@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     55 | 42ec851  |      1 | 42ec851@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     56 | c1b1752  |      1 | c1b1752@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     57 | 227ab53  |      0 | 227ab53@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     58 | c342054  |      1 | c342054@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     59 | 8260155  |      0 | 8260155@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     60 | b9a8556  |      1 | b9a8556@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     61 | 186a457  |      1 | 186a457@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     62 | 9bf4f58  |      1 | 9bf4f58@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     63 | 799f659  |      1 | 799f659@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     64 | 67a6360  |      1 | 67a6360@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     65 | f372961  |      1 | f372961@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     66 | ecdaf62  |      1 | ecdaf62@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     67 | 9e2ae63  |      1 | 9e2ae63@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     68 | 8517c64  |      1 | 8517c64@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     69 | b139a65  |      1 | b139a65@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     70 | b8b1566  |      1 | b8b1566@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     71 | 36cb267  |      1 | 36cb267@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     72 | c723568  |      1 | c723568@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     73 | 0ed4169  |      1 | 0ed4169@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     74 | ec3f370  |      1 | ec3f370@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     75 | 6b18f71  |      1 | 6b18f71@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     76 | a999772  |      1 | a999772@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     77 | e588b73  |      1 | e588b73@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     78 | 6841b74  |      1 | 6841b74@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     79 | f508975  |      1 | f508975@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     80 | c060b76  |      1 | c060b76@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     81 | c627d77  |      1 | c627d77@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     82 | 786f678  |      1 | 786f678@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     83 | 1cdbc79  |      1 | 1cdbc79@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     84 | 38d3a80  |      1 | 38d3a80@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     85 | 6a30881  |      1 | 6a30881@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     86 | 6d91682  |      1 | 6d91682@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     87 | c758283  |      1 | c758283@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     88 | c8f2c84  |      1 | c8f2c84@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     89 | 4884985  |      1 | 4884985@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     90 | 1d6e286  |      1 | 1d6e286@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     91 | b218487  |      1 | b218487@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     92 | 6449388  |      1 | 6449388@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     93 | b0e7489  |      1 | b0e7489@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     94 | 8193890  |      1 | 8193890@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     95 | 4707291  |      1 | 4707291@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     96 | 6871592  |      1 | 6871592@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     97 | 0ba6293  |      1 | 0ba6293@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     98 | 687e494  |      1 | 687e494@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     99 | b478c95  |      1 | b478c95@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    100 | 7252f96  |      1 | 7252f96@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    101 | dca2097  |      1 | dca2097@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    102 | 296f898  |      1 | 296f898@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    103 | 8eb2f99  |      1 | 8eb2f99@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    104 | 26891100 |      1 | 26891100@qq.com |    1 |       1 | 开发部    | db_source1 |
|    105 | 318d9101 |      1 | 318d9101@qq.com |    1 |       1 | 开发部    | db_source1 |
|    106 | a531c102 |      1 | a531c102@qq.com |    1 |       1 | 开发部    | db_source1 |
|    107 | b84b6103 |      1 | b84b6103@qq.com |    1 |       1 | 开发部    | db_source1 |
|    108 | 0815d104 |      1 | 0815d104@qq.com |    1 |       1 | 开发部    | db_source1 |
|      1 | 小李     |      1 | 123@qq.com      |    4 |       4 | 测试部    | db_source1 |
|      4 | 046100   |      1 | 046100@qq.com   |    4 |       4 | 测试部    | db_source1 |
|      5 | babf61   |      1 | babf61@qq.com   |    4 |       4 | 测试部    | db_source1 |
|     24 | cd56020  |      0 | cd56020@qq.com  |    4 |       4 | 测试部    | db_source1 |
|     19 | 9b47615  |      0 | 9b47615@qq.com  |    6 |       6 | 管理部    | db_source1 |
+--------+----------+--------+-----------------+------+---------+-----------+------------+
108 rows in set (0.09 sec)

mysql> #a b 求并集 即先左联再右连 就是全连接
mysql> insert into tab_dept values(34,"市场",'db2');
Query OK, 1 row affected (0.01 sec)

mysql> select * from tab_emp left join tab_dept on tab_emp.d_id =tab_dept.dept_id;
+--------+----------+--------+-----------------+------+---------+-----------+------------+
| emp_id | emp_name | gender | email           | d_id | dept_id | dept_name | db_source  |
+--------+----------+--------+-----------------+------+---------+-----------+------------+
|      1 | 小李     |      1 | 123@qq.com      |    4 |       4 | 测试部    | db_source1 |
|      2 | 小马     |      1 | 456@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      3 | 小王     |      1 | 321@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      4 | 046100   |      1 | 046100@qq.com   |    4 |       4 | 测试部    | db_source1 |
|      5 | babf61   |      1 | babf61@qq.com   |    4 |       4 | 测试部    | db_source1 |
|      6 | 01fa12   |      1 | 01fa12@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      7 | f8f6d3   |      1 | f8f6d3@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      8 | aa5c34   |      1 | aa5c34@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      9 | 24cab5   |      1 | 24cab5@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     10 | f953c6   |      1 | f953c6@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     11 | 001b27   |      1 | 001b27@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     12 | 73d828   |      1 | 73d828@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     13 | 513239   |      1 | 513239@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     14 | e56a710  |      1 | e56a710@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     15 | d8a4511  |      1 | d8a4511@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     16 | 4692e12  |      1 | 4692e12@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     17 | bd7c813  |      1 | bd7c813@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     18 | 1bc0114  |      1 | 1bc0114@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     19 | 9b47615  |      0 | 9b47615@qq.com  |    6 |       6 | 管理部    | db_source1 |
|     20 | f29b616  |      1 | f29b616@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     21 | 9676917  |      1 | 9676917@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     22 | 563d918  |      1 | 563d918@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     23 | 5dcdb19  |      1 | 5dcdb19@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     24 | cd56020  |      0 | cd56020@qq.com  |    4 |       4 | 测试部    | db_source1 |
|     25 | c130321  |      1 | c130321@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     26 | 5b51a22  |      1 | 5b51a22@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     27 | 3384323  |      1 | 3384323@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     28 | 7a78a24  |      1 | 7a78a24@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     29 | d8cd925  |      1 | d8cd925@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     30 | 1072c26  |      1 | 1072c26@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     31 | 4a64f27  |      1 | 4a64f27@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     32 | bd15428  |      1 | bd15428@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     33 | 5f17b29  |      1 | 5f17b29@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     34 | 7654130  |      1 | 7654130@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     35 | 7a88931  |      1 | 7a88931@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     36 | caf4532  |      1 | caf4532@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     37 | fee1233  |      1 | fee1233@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     38 | 16a3634  |      1 | 16a3634@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     39 | f783d35  |      1 | f783d35@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     40 | 849f336  |      1 | 849f336@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     41 | 27d4837  |      1 | 27d4837@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     42 | fc55e38  |      1 | fc55e38@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     43 | cbb2839  |      1 | cbb2839@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     44 | 758f740  |      1 | 758f740@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     45 | 6883b41  |      1 | 6883b41@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     46 | 5e84442  |      1 | 5e84442@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     47 | 2fcf643  |      1 | 2fcf643@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     48 | 591b044  |      1 | 591b044@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     49 | c7ac245  |      1 | c7ac245@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     50 | ed3ef46  |      1 | ed3ef46@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     51 | ec2ea47  |      1 | ec2ea47@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     52 | 1ea0b48  |      1 | 1ea0b48@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     53 | 1ae8a49  |      1 | 1ae8a49@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     54 | 5dc8950  |      1 | 5dc8950@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     55 | 42ec851  |      1 | 42ec851@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     56 | c1b1752  |      1 | c1b1752@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     57 | 227ab53  |      0 | 227ab53@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     58 | c342054  |      1 | c342054@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     59 | 8260155  |      0 | 8260155@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     60 | b9a8556  |      1 | b9a8556@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     61 | 186a457  |      1 | 186a457@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     62 | 9bf4f58  |      1 | 9bf4f58@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     63 | 799f659  |      1 | 799f659@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     64 | 67a6360  |      1 | 67a6360@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     65 | f372961  |      1 | f372961@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     66 | ecdaf62  |      1 | ecdaf62@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     67 | 9e2ae63  |      1 | 9e2ae63@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     68 | 8517c64  |      1 | 8517c64@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     69 | b139a65  |      1 | b139a65@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     70 | b8b1566  |      1 | b8b1566@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     71 | 36cb267  |      1 | 36cb267@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     72 | c723568  |      1 | c723568@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     73 | 0ed4169  |      1 | 0ed4169@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     74 | ec3f370  |      1 | ec3f370@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     75 | 6b18f71  |      1 | 6b18f71@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     76 | a999772  |      1 | a999772@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     77 | e588b73  |      1 | e588b73@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     78 | 6841b74  |      1 | 6841b74@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     79 | f508975  |      1 | f508975@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     80 | c060b76  |      1 | c060b76@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     81 | c627d77  |      1 | c627d77@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     82 | 786f678  |      1 | 786f678@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     83 | 1cdbc79  |      1 | 1cdbc79@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     84 | 38d3a80  |      1 | 38d3a80@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     85 | 6a30881  |      1 | 6a30881@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     86 | 6d91682  |      1 | 6d91682@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     87 | c758283  |      1 | c758283@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     88 | c8f2c84  |      1 | c8f2c84@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     89 | 4884985  |      1 | 4884985@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     90 | 1d6e286  |      1 | 1d6e286@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     91 | b218487  |      1 | b218487@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     92 | 6449388  |      1 | 6449388@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     93 | b0e7489  |      1 | b0e7489@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     94 | 8193890  |      1 | 8193890@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     95 | 4707291  |      1 | 4707291@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     96 | 6871592  |      1 | 6871592@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     97 | 0ba6293  |      1 | 0ba6293@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     98 | 687e494  |      1 | 687e494@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     99 | b478c95  |      1 | b478c95@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    100 | 7252f96  |      1 | 7252f96@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    101 | dca2097  |      1 | dca2097@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    102 | 296f898  |      1 | 296f898@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    103 | 8eb2f99  |      1 | 8eb2f99@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    104 | 26891100 |      1 | 26891100@qq.com |    1 |       1 | 开发部    | db_source1 |
|    105 | 318d9101 |      1 | 318d9101@qq.com |    1 |       1 | 开发部    | db_source1 |
|    106 | a531c102 |      1 | a531c102@qq.com |    1 |       1 | 开发部    | db_source1 |
|    107 | b84b6103 |      1 | b84b6103@qq.com |    1 |       1 | 开发部    | db_source1 |
|    108 | 0815d104 |      1 | 0815d104@qq.com |    1 |       1 | 开发部    | db_source1 |
+--------+----------+--------+-----------------+------+---------+-----------+------------+
108 rows in set (0.00 sec)

mysql> select * from tab_emp right join tab_dept on tab_emp.d_id =tab_dept.dept_id;
+--------+----------+--------+-----------------+------+---------+-----------+------------+
| emp_id | emp_name | gender | email           | d_id | dept_id | dept_name | db_source  |
+--------+----------+--------+-----------------+------+---------+-----------+------------+
|      2 | 小马     |      1 | 456@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      3 | 小王     |      1 | 321@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      6 | 01fa12   |      1 | 01fa12@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      7 | f8f6d3   |      1 | f8f6d3@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      8 | aa5c34   |      1 | aa5c34@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      9 | 24cab5   |      1 | 24cab5@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     10 | f953c6   |      1 | f953c6@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     11 | 001b27   |      1 | 001b27@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     12 | 73d828   |      1 | 73d828@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     13 | 513239   |      1 | 513239@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     14 | e56a710  |      1 | e56a710@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     15 | d8a4511  |      1 | d8a4511@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     16 | 4692e12  |      1 | 4692e12@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     17 | bd7c813  |      1 | bd7c813@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     18 | 1bc0114  |      1 | 1bc0114@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     20 | f29b616  |      1 | f29b616@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     21 | 9676917  |      1 | 9676917@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     22 | 563d918  |      1 | 563d918@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     23 | 5dcdb19  |      1 | 5dcdb19@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     25 | c130321  |      1 | c130321@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     26 | 5b51a22  |      1 | 5b51a22@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     27 | 3384323  |      1 | 3384323@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     28 | 7a78a24  |      1 | 7a78a24@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     29 | d8cd925  |      1 | d8cd925@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     30 | 1072c26  |      1 | 1072c26@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     31 | 4a64f27  |      1 | 4a64f27@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     32 | bd15428  |      1 | bd15428@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     33 | 5f17b29  |      1 | 5f17b29@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     34 | 7654130  |      1 | 7654130@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     35 | 7a88931  |      1 | 7a88931@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     36 | caf4532  |      1 | caf4532@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     37 | fee1233  |      1 | fee1233@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     38 | 16a3634  |      1 | 16a3634@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     39 | f783d35  |      1 | f783d35@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     40 | 849f336  |      1 | 849f336@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     41 | 27d4837  |      1 | 27d4837@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     42 | fc55e38  |      1 | fc55e38@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     43 | cbb2839  |      1 | cbb2839@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     44 | 758f740  |      1 | 758f740@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     45 | 6883b41  |      1 | 6883b41@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     46 | 5e84442  |      1 | 5e84442@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     47 | 2fcf643  |      1 | 2fcf643@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     48 | 591b044  |      1 | 591b044@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     49 | c7ac245  |      1 | c7ac245@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     50 | ed3ef46  |      1 | ed3ef46@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     51 | ec2ea47  |      1 | ec2ea47@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     52 | 1ea0b48  |      1 | 1ea0b48@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     53 | 1ae8a49  |      1 | 1ae8a49@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     54 | 5dc8950  |      1 | 5dc8950@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     55 | 42ec851  |      1 | 42ec851@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     56 | c1b1752  |      1 | c1b1752@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     57 | 227ab53  |      0 | 227ab53@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     58 | c342054  |      1 | c342054@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     59 | 8260155  |      0 | 8260155@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     60 | b9a8556  |      1 | b9a8556@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     61 | 186a457  |      1 | 186a457@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     62 | 9bf4f58  |      1 | 9bf4f58@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     63 | 799f659  |      1 | 799f659@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     64 | 67a6360  |      1 | 67a6360@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     65 | f372961  |      1 | f372961@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     66 | ecdaf62  |      1 | ecdaf62@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     67 | 9e2ae63  |      1 | 9e2ae63@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     68 | 8517c64  |      1 | 8517c64@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     69 | b139a65  |      1 | b139a65@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     70 | b8b1566  |      1 | b8b1566@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     71 | 36cb267  |      1 | 36cb267@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     72 | c723568  |      1 | c723568@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     73 | 0ed4169  |      1 | 0ed4169@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     74 | ec3f370  |      1 | ec3f370@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     75 | 6b18f71  |      1 | 6b18f71@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     76 | a999772  |      1 | a999772@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     77 | e588b73  |      1 | e588b73@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     78 | 6841b74  |      1 | 6841b74@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     79 | f508975  |      1 | f508975@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     80 | c060b76  |      1 | c060b76@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     81 | c627d77  |      1 | c627d77@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     82 | 786f678  |      1 | 786f678@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     83 | 1cdbc79  |      1 | 1cdbc79@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     84 | 38d3a80  |      1 | 38d3a80@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     85 | 6a30881  |      1 | 6a30881@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     86 | 6d91682  |      1 | 6d91682@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     87 | c758283  |      1 | c758283@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     88 | c8f2c84  |      1 | c8f2c84@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     89 | 4884985  |      1 | 4884985@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     90 | 1d6e286  |      1 | 1d6e286@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     91 | b218487  |      1 | b218487@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     92 | 6449388  |      1 | 6449388@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     93 | b0e7489  |      1 | b0e7489@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     94 | 8193890  |      1 | 8193890@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     95 | 4707291  |      1 | 4707291@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     96 | 6871592  |      1 | 6871592@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     97 | 0ba6293  |      1 | 0ba6293@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     98 | 687e494  |      1 | 687e494@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     99 | b478c95  |      1 | b478c95@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    100 | 7252f96  |      1 | 7252f96@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    101 | dca2097  |      1 | dca2097@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    102 | 296f898  |      1 | 296f898@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    103 | 8eb2f99  |      1 | 8eb2f99@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    104 | 26891100 |      1 | 26891100@qq.com |    1 |       1 | 开发部    | db_source1 |
|    105 | 318d9101 |      1 | 318d9101@qq.com |    1 |       1 | 开发部    | db_source1 |
|    106 | a531c102 |      1 | a531c102@qq.com |    1 |       1 | 开发部    | db_source1 |
|    107 | b84b6103 |      1 | b84b6103@qq.com |    1 |       1 | 开发部    | db_source1 |
|    108 | 0815d104 |      1 | 0815d104@qq.com |    1 |       1 | 开发部    | db_source1 |
|      1 | 小李     |      1 | 123@qq.com      |    4 |       4 | 测试部    | db_source1 |
|      4 | 046100   |      1 | 046100@qq.com   |    4 |       4 | 测试部    | db_source1 |
|      5 | babf61   |      1 | babf61@qq.com   |    4 |       4 | 测试部    | db_source1 |
|     24 | cd56020  |      0 | cd56020@qq.com  |    4 |       4 | 测试部    | db_source1 |
|     19 | 9b47615  |      0 | 9b47615@qq.com  |    6 |       6 | 管理部    | db_source1 |
|   NULL | NULL     |   NULL | NULL            | NULL |      34 | 市场      | db2        |
+--------+----------+--------+-----------------+------+---------+-----------+------------+
109 rows in set (0.00 sec)

mysql> (select * from tab_emp left join tab_dept on tab_emp.d_id =tab_dept.dept_id) union (select * from tab_emp right join tab_dept on tab_emp.d_id =tab_dept.dept_id);
+--------+----------+--------+-----------------+------+---------+-----------+------------+
| emp_id | emp_name | gender | email           | d_id | dept_id | dept_name | db_source  |
+--------+----------+--------+-----------------+------+---------+-----------+------------+
|      1 | 小李     |      1 | 123@qq.com      |    4 |       4 | 测试部    | db_source1 |
|      2 | 小马     |      1 | 456@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      3 | 小王     |      1 | 321@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      4 | 046100   |      1 | 046100@qq.com   |    4 |       4 | 测试部    | db_source1 |
|      5 | babf61   |      1 | babf61@qq.com   |    4 |       4 | 测试部    | db_source1 |
|      6 | 01fa12   |      1 | 01fa12@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      7 | f8f6d3   |      1 | f8f6d3@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      8 | aa5c34   |      1 | aa5c34@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      9 | 24cab5   |      1 | 24cab5@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     10 | f953c6   |      1 | f953c6@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     11 | 001b27   |      1 | 001b27@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     12 | 73d828   |      1 | 73d828@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     13 | 513239   |      1 | 513239@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     14 | e56a710  |      1 | e56a710@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     15 | d8a4511  |      1 | d8a4511@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     16 | 4692e12  |      1 | 4692e12@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     17 | bd7c813  |      1 | bd7c813@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     18 | 1bc0114  |      1 | 1bc0114@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     19 | 9b47615  |      0 | 9b47615@qq.com  |    6 |       6 | 管理部    | db_source1 |
|     20 | f29b616  |      1 | f29b616@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     21 | 9676917  |      1 | 9676917@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     22 | 563d918  |      1 | 563d918@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     23 | 5dcdb19  |      1 | 5dcdb19@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     24 | cd56020  |      0 | cd56020@qq.com  |    4 |       4 | 测试部    | db_source1 |
|     25 | c130321  |      1 | c130321@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     26 | 5b51a22  |      1 | 5b51a22@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     27 | 3384323  |      1 | 3384323@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     28 | 7a78a24  |      1 | 7a78a24@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     29 | d8cd925  |      1 | d8cd925@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     30 | 1072c26  |      1 | 1072c26@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     31 | 4a64f27  |      1 | 4a64f27@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     32 | bd15428  |      1 | bd15428@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     33 | 5f17b29  |      1 | 5f17b29@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     34 | 7654130  |      1 | 7654130@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     35 | 7a88931  |      1 | 7a88931@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     36 | caf4532  |      1 | caf4532@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     37 | fee1233  |      1 | fee1233@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     38 | 16a3634  |      1 | 16a3634@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     39 | f783d35  |      1 | f783d35@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     40 | 849f336  |      1 | 849f336@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     41 | 27d4837  |      1 | 27d4837@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     42 | fc55e38  |      1 | fc55e38@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     43 | cbb2839  |      1 | cbb2839@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     44 | 758f740  |      1 | 758f740@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     45 | 6883b41  |      1 | 6883b41@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     46 | 5e84442  |      1 | 5e84442@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     47 | 2fcf643  |      1 | 2fcf643@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     48 | 591b044  |      1 | 591b044@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     49 | c7ac245  |      1 | c7ac245@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     50 | ed3ef46  |      1 | ed3ef46@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     51 | ec2ea47  |      1 | ec2ea47@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     52 | 1ea0b48  |      1 | 1ea0b48@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     53 | 1ae8a49  |      1 | 1ae8a49@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     54 | 5dc8950  |      1 | 5dc8950@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     55 | 42ec851  |      1 | 42ec851@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     56 | c1b1752  |      1 | c1b1752@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     57 | 227ab53  |      0 | 227ab53@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     58 | c342054  |      1 | c342054@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     59 | 8260155  |      0 | 8260155@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     60 | b9a8556  |      1 | b9a8556@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     61 | 186a457  |      1 | 186a457@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     62 | 9bf4f58  |      1 | 9bf4f58@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     63 | 799f659  |      1 | 799f659@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     64 | 67a6360  |      1 | 67a6360@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     65 | f372961  |      1 | f372961@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     66 | ecdaf62  |      1 | ecdaf62@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     67 | 9e2ae63  |      1 | 9e2ae63@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     68 | 8517c64  |      1 | 8517c64@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     69 | b139a65  |      1 | b139a65@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     70 | b8b1566  |      1 | b8b1566@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     71 | 36cb267  |      1 | 36cb267@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     72 | c723568  |      1 | c723568@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     73 | 0ed4169  |      1 | 0ed4169@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     74 | ec3f370  |      1 | ec3f370@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     75 | 6b18f71  |      1 | 6b18f71@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     76 | a999772  |      1 | a999772@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     77 | e588b73  |      1 | e588b73@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     78 | 6841b74  |      1 | 6841b74@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     79 | f508975  |      1 | f508975@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     80 | c060b76  |      1 | c060b76@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     81 | c627d77  |      1 | c627d77@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     82 | 786f678  |      1 | 786f678@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     83 | 1cdbc79  |      1 | 1cdbc79@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     84 | 38d3a80  |      1 | 38d3a80@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     85 | 6a30881  |      1 | 6a30881@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     86 | 6d91682  |      1 | 6d91682@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     87 | c758283  |      1 | c758283@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     88 | c8f2c84  |      1 | c8f2c84@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     89 | 4884985  |      1 | 4884985@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     90 | 1d6e286  |      1 | 1d6e286@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     91 | b218487  |      1 | b218487@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     92 | 6449388  |      1 | 6449388@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     93 | b0e7489  |      1 | b0e7489@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     94 | 8193890  |      1 | 8193890@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     95 | 4707291  |      1 | 4707291@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     96 | 6871592  |      1 | 6871592@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     97 | 0ba6293  |      1 | 0ba6293@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     98 | 687e494  |      1 | 687e494@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     99 | b478c95  |      1 | b478c95@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    100 | 7252f96  |      1 | 7252f96@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    101 | dca2097  |      1 | dca2097@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    102 | 296f898  |      1 | 296f898@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    103 | 8eb2f99  |      1 | 8eb2f99@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    104 | 26891100 |      1 | 26891100@qq.com |    1 |       1 | 开发部    | db_source1 |
|    105 | 318d9101 |      1 | 318d9101@qq.com |    1 |       1 | 开发部    | db_source1 |
|    106 | a531c102 |      1 | a531c102@qq.com |    1 |       1 | 开发部    | db_source1 |
|    107 | b84b6103 |      1 | b84b6103@qq.com |    1 |       1 | 开发部    | db_source1 |
|    108 | 0815d104 |      1 | 0815d104@qq.com |    1 |       1 | 开发部    | db_source1 |
|   NULL | NULL     |   NULL | NULL            | NULL |      34 | 市场      | db2        |
+--------+----------+--------+-----------------+------+---------+-----------+------------+
109 rows in set (0.08 sec)

mysql> insert into tab_emp(null,emp_name,gender,email,d_id) values('哈哈哈哈哈',0,'12@163.com',100);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'null,emp_name,gender,email,d_id) values('哈哈哈哈哈',0,'12@163.com',100)' at line 1
mysql> insert into tab_emp(emp_name,gender,email,d_id) values('哈哈哈哈哈',0,'12@163.com',100);
Query OK, 1 row affected (0.00 sec)

mysql> select * from tab_emp;
+--------+-----------------+--------+-----------------+------+
| emp_id | emp_name        | gender | email           | d_id |
+--------+-----------------+--------+-----------------+------+
|      1 | 小李            |      1 | 123@qq.com      |    4 |
|      2 | 小马            |      1 | 456@qq.com      |    1 |
|      3 | 小王            |      1 | 321@qq.com      |    1 |
|      4 | 046100          |      1 | 046100@qq.com   |    4 |
|      5 | babf61          |      1 | babf61@qq.com   |    4 |
|      6 | 01fa12          |      1 | 01fa12@qq.com   |    1 |
|      7 | f8f6d3          |      1 | f8f6d3@qq.com   |    1 |
|      8 | aa5c34          |      1 | aa5c34@qq.com   |    1 |
|      9 | 24cab5          |      1 | 24cab5@qq.com   |    1 |
|     10 | f953c6          |      1 | f953c6@qq.com   |    1 |
|     11 | 001b27          |      1 | 001b27@qq.com   |    1 |
|     12 | 73d828          |      1 | 73d828@qq.com   |    1 |
|     13 | 513239          |      1 | 513239@qq.com   |    1 |
|     14 | e56a710         |      1 | e56a710@qq.com  |    1 |
|     15 | d8a4511         |      1 | d8a4511@qq.com  |    1 |
|     16 | 4692e12         |      1 | 4692e12@qq.com  |    1 |
|     17 | bd7c813         |      1 | bd7c813@qq.com  |    1 |
|     18 | 1bc0114         |      1 | 1bc0114@qq.com  |    1 |
|     19 | 9b47615         |      0 | 9b47615@qq.com  |    6 |
|     20 | f29b616         |      1 | f29b616@qq.com  |    1 |
|     21 | 9676917         |      1 | 9676917@qq.com  |    1 |
|     22 | 563d918         |      1 | 563d918@qq.com  |    1 |
|     23 | 5dcdb19         |      1 | 5dcdb19@qq.com  |    1 |
|     24 | cd56020         |      0 | cd56020@qq.com  |    4 |
|     25 | c130321         |      1 | c130321@qq.com  |    1 |
|     26 | 5b51a22         |      1 | 5b51a22@qq.com  |    1 |
|     27 | 3384323         |      1 | 3384323@qq.com  |    1 |
|     28 | 7a78a24         |      1 | 7a78a24@qq.com  |    1 |
|     29 | d8cd925         |      1 | d8cd925@qq.com  |    1 |
|     30 | 1072c26         |      1 | 1072c26@qq.com  |    1 |
|     31 | 4a64f27         |      1 | 4a64f27@qq.com  |    1 |
|     32 | bd15428         |      1 | bd15428@qq.com  |    1 |
|     33 | 5f17b29         |      1 | 5f17b29@qq.com  |    1 |
|     34 | 7654130         |      1 | 7654130@qq.com  |    1 |
|     35 | 7a88931         |      1 | 7a88931@qq.com  |    1 |
|     36 | caf4532         |      1 | caf4532@qq.com  |    1 |
|     37 | fee1233         |      1 | fee1233@qq.com  |    1 |
|     38 | 16a3634         |      1 | 16a3634@qq.com  |    1 |
|     39 | f783d35         |      1 | f783d35@qq.com  |    1 |
|     40 | 849f336         |      1 | 849f336@qq.com  |    1 |
|     41 | 27d4837         |      1 | 27d4837@qq.com  |    1 |
|     42 | fc55e38         |      1 | fc55e38@qq.com  |    1 |
|     43 | cbb2839         |      1 | cbb2839@qq.com  |    1 |
|     44 | 758f740         |      1 | 758f740@qq.com  |    1 |
|     45 | 6883b41         |      1 | 6883b41@qq.com  |    1 |
|     46 | 5e84442         |      1 | 5e84442@qq.com  |    1 |
|     47 | 2fcf643         |      1 | 2fcf643@qq.com  |    1 |
|     48 | 591b044         |      1 | 591b044@qq.com  |    1 |
|     49 | c7ac245         |      1 | c7ac245@qq.com  |    1 |
|     50 | ed3ef46         |      1 | ed3ef46@qq.com  |    1 |
|     51 | ec2ea47         |      1 | ec2ea47@qq.com  |    1 |
|     52 | 1ea0b48         |      1 | 1ea0b48@qq.com  |    1 |
|     53 | 1ae8a49         |      1 | 1ae8a49@qq.com  |    1 |
|     54 | 5dc8950         |      1 | 5dc8950@qq.com  |    1 |
|     55 | 42ec851         |      1 | 42ec851@qq.com  |    1 |
|     56 | c1b1752         |      1 | c1b1752@qq.com  |    1 |
|     57 | 227ab53         |      0 | 227ab53@qq.com  |    1 |
|     58 | c342054         |      1 | c342054@qq.com  |    1 |
|     59 | 8260155         |      0 | 8260155@qq.com  |    1 |
|     60 | b9a8556         |      1 | b9a8556@qq.com  |    1 |
|     61 | 186a457         |      1 | 186a457@qq.com  |    1 |
|     62 | 9bf4f58         |      1 | 9bf4f58@qq.com  |    1 |
|     63 | 799f659         |      1 | 799f659@qq.com  |    1 |
|     64 | 67a6360         |      1 | 67a6360@qq.com  |    1 |
|     65 | f372961         |      1 | f372961@qq.com  |    1 |
|     66 | ecdaf62         |      1 | ecdaf62@qq.com  |    1 |
|     67 | 9e2ae63         |      1 | 9e2ae63@qq.com  |    1 |
|     68 | 8517c64         |      1 | 8517c64@qq.com  |    1 |
|     69 | b139a65         |      1 | b139a65@qq.com  |    1 |
|     70 | b8b1566         |      1 | b8b1566@qq.com  |    1 |
|     71 | 36cb267         |      1 | 36cb267@qq.com  |    1 |
|     72 | c723568         |      1 | c723568@qq.com  |    1 |
|     73 | 0ed4169         |      1 | 0ed4169@qq.com  |    1 |
|     74 | ec3f370         |      1 | ec3f370@qq.com  |    1 |
|     75 | 6b18f71         |      1 | 6b18f71@qq.com  |    1 |
|     76 | a999772         |      1 | a999772@qq.com  |    1 |
|     77 | e588b73         |      1 | e588b73@qq.com  |    1 |
|     78 | 6841b74         |      1 | 6841b74@qq.com  |    1 |
|     79 | f508975         |      1 | f508975@qq.com  |    1 |
|     80 | c060b76         |      1 | c060b76@qq.com  |    1 |
|     81 | c627d77         |      1 | c627d77@qq.com  |    1 |
|     82 | 786f678         |      1 | 786f678@qq.com  |    1 |
|     83 | 1cdbc79         |      1 | 1cdbc79@qq.com  |    1 |
|     84 | 38d3a80         |      1 | 38d3a80@qq.com  |    1 |
|     85 | 6a30881         |      1 | 6a30881@qq.com  |    1 |
|     86 | 6d91682         |      1 | 6d91682@qq.com  |    1 |
|     87 | c758283         |      1 | c758283@qq.com  |    1 |
|     88 | c8f2c84         |      1 | c8f2c84@qq.com  |    1 |
|     89 | 4884985         |      1 | 4884985@qq.com  |    1 |
|     90 | 1d6e286         |      1 | 1d6e286@qq.com  |    1 |
|     91 | b218487         |      1 | b218487@qq.com  |    1 |
|     92 | 6449388         |      1 | 6449388@qq.com  |    1 |
|     93 | b0e7489         |      1 | b0e7489@qq.com  |    1 |
|     94 | 8193890         |      1 | 8193890@qq.com  |    1 |
|     95 | 4707291         |      1 | 4707291@qq.com  |    1 |
|     96 | 6871592         |      1 | 6871592@qq.com  |    1 |
|     97 | 0ba6293         |      1 | 0ba6293@qq.com  |    1 |
|     98 | 687e494         |      1 | 687e494@qq.com  |    1 |
|     99 | b478c95         |      1 | b478c95@qq.com  |    1 |
|    100 | 7252f96         |      1 | 7252f96@qq.com  |    1 |
|    101 | dca2097         |      1 | dca2097@qq.com  |    1 |
|    102 | 296f898         |      1 | 296f898@qq.com  |    1 |
|    103 | 8eb2f99         |      1 | 8eb2f99@qq.com  |    1 |
|    104 | 26891100        |      1 | 26891100@qq.com |    1 |
|    105 | 318d9101        |      1 | 318d9101@qq.com |    1 |
|    106 | a531c102        |      1 | a531c102@qq.com |    1 |
|    107 | b84b6103        |      1 | b84b6103@qq.com |    1 |
|    108 | 0815d104        |      1 | 0815d104@qq.com |    1 |
|   1026 | 哈哈哈哈哈      |      0 | 12@163.com      |  100 |
+--------+-----------------+--------+-----------------+------+
109 rows in set (0.00 sec)

mysql> (select * from tab_emp left join tab_dept on tab_emp.d_id =tab_dept.dept_id) union (select * from tab_emp right join tab_dept on tab_emp.d_id =tab_dept.dept_id);
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
| emp_id | emp_name        | gender | email           | d_id | dept_id | dept_name | db_source  |
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
|      1 | 小李            |      1 | 123@qq.com      |    4 |       4 | 测试部    | db_source1 |
|      2 | 小马            |      1 | 456@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      3 | 小王            |      1 | 321@qq.com      |    1 |       1 | 开发部    | db_source1 |
|      4 | 046100          |      1 | 046100@qq.com   |    4 |       4 | 测试部    | db_source1 |
|      5 | babf61          |      1 | babf61@qq.com   |    4 |       4 | 测试部    | db_source1 |
|      6 | 01fa12          |      1 | 01fa12@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      7 | f8f6d3          |      1 | f8f6d3@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      8 | aa5c34          |      1 | aa5c34@qq.com   |    1 |       1 | 开发部    | db_source1 |
|      9 | 24cab5          |      1 | 24cab5@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     10 | f953c6          |      1 | f953c6@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     11 | 001b27          |      1 | 001b27@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     12 | 73d828          |      1 | 73d828@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     13 | 513239          |      1 | 513239@qq.com   |    1 |       1 | 开发部    | db_source1 |
|     14 | e56a710         |      1 | e56a710@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     15 | d8a4511         |      1 | d8a4511@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     16 | 4692e12         |      1 | 4692e12@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     17 | bd7c813         |      1 | bd7c813@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     18 | 1bc0114         |      1 | 1bc0114@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     19 | 9b47615         |      0 | 9b47615@qq.com  |    6 |       6 | 管理部    | db_source1 |
|     20 | f29b616         |      1 | f29b616@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     21 | 9676917         |      1 | 9676917@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     22 | 563d918         |      1 | 563d918@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     23 | 5dcdb19         |      1 | 5dcdb19@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     24 | cd56020         |      0 | cd56020@qq.com  |    4 |       4 | 测试部    | db_source1 |
|     25 | c130321         |      1 | c130321@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     26 | 5b51a22         |      1 | 5b51a22@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     27 | 3384323         |      1 | 3384323@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     28 | 7a78a24         |      1 | 7a78a24@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     29 | d8cd925         |      1 | d8cd925@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     30 | 1072c26         |      1 | 1072c26@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     31 | 4a64f27         |      1 | 4a64f27@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     32 | bd15428         |      1 | bd15428@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     33 | 5f17b29         |      1 | 5f17b29@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     34 | 7654130         |      1 | 7654130@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     35 | 7a88931         |      1 | 7a88931@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     36 | caf4532         |      1 | caf4532@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     37 | fee1233         |      1 | fee1233@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     38 | 16a3634         |      1 | 16a3634@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     39 | f783d35         |      1 | f783d35@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     40 | 849f336         |      1 | 849f336@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     41 | 27d4837         |      1 | 27d4837@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     42 | fc55e38         |      1 | fc55e38@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     43 | cbb2839         |      1 | cbb2839@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     44 | 758f740         |      1 | 758f740@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     45 | 6883b41         |      1 | 6883b41@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     46 | 5e84442         |      1 | 5e84442@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     47 | 2fcf643         |      1 | 2fcf643@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     48 | 591b044         |      1 | 591b044@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     49 | c7ac245         |      1 | c7ac245@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     50 | ed3ef46         |      1 | ed3ef46@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     51 | ec2ea47         |      1 | ec2ea47@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     52 | 1ea0b48         |      1 | 1ea0b48@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     53 | 1ae8a49         |      1 | 1ae8a49@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     54 | 5dc8950         |      1 | 5dc8950@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     55 | 42ec851         |      1 | 42ec851@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     56 | c1b1752         |      1 | c1b1752@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     57 | 227ab53         |      0 | 227ab53@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     58 | c342054         |      1 | c342054@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     59 | 8260155         |      0 | 8260155@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     60 | b9a8556         |      1 | b9a8556@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     61 | 186a457         |      1 | 186a457@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     62 | 9bf4f58         |      1 | 9bf4f58@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     63 | 799f659         |      1 | 799f659@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     64 | 67a6360         |      1 | 67a6360@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     65 | f372961         |      1 | f372961@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     66 | ecdaf62         |      1 | ecdaf62@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     67 | 9e2ae63         |      1 | 9e2ae63@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     68 | 8517c64         |      1 | 8517c64@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     69 | b139a65         |      1 | b139a65@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     70 | b8b1566         |      1 | b8b1566@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     71 | 36cb267         |      1 | 36cb267@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     72 | c723568         |      1 | c723568@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     73 | 0ed4169         |      1 | 0ed4169@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     74 | ec3f370         |      1 | ec3f370@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     75 | 6b18f71         |      1 | 6b18f71@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     76 | a999772         |      1 | a999772@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     77 | e588b73         |      1 | e588b73@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     78 | 6841b74         |      1 | 6841b74@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     79 | f508975         |      1 | f508975@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     80 | c060b76         |      1 | c060b76@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     81 | c627d77         |      1 | c627d77@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     82 | 786f678         |      1 | 786f678@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     83 | 1cdbc79         |      1 | 1cdbc79@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     84 | 38d3a80         |      1 | 38d3a80@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     85 | 6a30881         |      1 | 6a30881@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     86 | 6d91682         |      1 | 6d91682@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     87 | c758283         |      1 | c758283@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     88 | c8f2c84         |      1 | c8f2c84@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     89 | 4884985         |      1 | 4884985@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     90 | 1d6e286         |      1 | 1d6e286@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     91 | b218487         |      1 | b218487@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     92 | 6449388         |      1 | 6449388@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     93 | b0e7489         |      1 | b0e7489@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     94 | 8193890         |      1 | 8193890@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     95 | 4707291         |      1 | 4707291@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     96 | 6871592         |      1 | 6871592@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     97 | 0ba6293         |      1 | 0ba6293@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     98 | 687e494         |      1 | 687e494@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     99 | b478c95         |      1 | b478c95@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    100 | 7252f96         |      1 | 7252f96@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    101 | dca2097         |      1 | dca2097@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    102 | 296f898         |      1 | 296f898@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    103 | 8eb2f99         |      1 | 8eb2f99@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    104 | 26891100        |      1 | 26891100@qq.com |    1 |       1 | 开发部    | db_source1 |
|    105 | 318d9101        |      1 | 318d9101@qq.com |    1 |       1 | 开发部    | db_source1 |
|    106 | a531c102        |      1 | a531c102@qq.com |    1 |       1 | 开发部    | db_source1 |
|    107 | b84b6103        |      1 | b84b6103@qq.com |    1 |       1 | 开发部    | db_source1 |
|    108 | 0815d104        |      1 | 0815d104@qq.com |    1 |       1 | 开发部    | db_source1 |
|   1026 | 哈哈哈哈哈      |      0 | 12@163.com      |  100 |    NULL | NULL      | NULL       |
|   NULL | NULL            |   NULL | NULL            | NULL |      34 | 市场      | db2        |
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
110 rows in set (0.00 sec)

mysql> delete from tab_emp order by emp_id asc limit(0,50);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(0,50)' at line 1
mysql> delete from tab_emp order by emp_id asc limit(1,50);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(1,50)' at line 1
mysql> delete from tab_emp order by emp_id asc limit(1,50);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(1,50)' at line 1
mysql> delete from tab_emp order by emp_id asc limit 50;
Query OK, 50 rows affected (0.00 sec)

mysql> (select * from tab_emp left join tab_dept on tab_emp.d_id =tab_dept.dept_id) union (select * from tab_emp right join tab_dept on tab_emp.d_id =tab_dept.dept_id);
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
| emp_id | emp_name        | gender | email           | d_id | dept_id | dept_name | db_source  |
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
|     51 | ec2ea47         |      1 | ec2ea47@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     52 | 1ea0b48         |      1 | 1ea0b48@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     53 | 1ae8a49         |      1 | 1ae8a49@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     54 | 5dc8950         |      1 | 5dc8950@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     55 | 42ec851         |      1 | 42ec851@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     56 | c1b1752         |      1 | c1b1752@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     57 | 227ab53         |      0 | 227ab53@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     58 | c342054         |      1 | c342054@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     59 | 8260155         |      0 | 8260155@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     60 | b9a8556         |      1 | b9a8556@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     61 | 186a457         |      1 | 186a457@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     62 | 9bf4f58         |      1 | 9bf4f58@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     63 | 799f659         |      1 | 799f659@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     64 | 67a6360         |      1 | 67a6360@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     65 | f372961         |      1 | f372961@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     66 | ecdaf62         |      1 | ecdaf62@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     67 | 9e2ae63         |      1 | 9e2ae63@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     68 | 8517c64         |      1 | 8517c64@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     69 | b139a65         |      1 | b139a65@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     70 | b8b1566         |      1 | b8b1566@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     71 | 36cb267         |      1 | 36cb267@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     72 | c723568         |      1 | c723568@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     73 | 0ed4169         |      1 | 0ed4169@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     74 | ec3f370         |      1 | ec3f370@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     75 | 6b18f71         |      1 | 6b18f71@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     76 | a999772         |      1 | a999772@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     77 | e588b73         |      1 | e588b73@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     78 | 6841b74         |      1 | 6841b74@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     79 | f508975         |      1 | f508975@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     80 | c060b76         |      1 | c060b76@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     81 | c627d77         |      1 | c627d77@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     82 | 786f678         |      1 | 786f678@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     83 | 1cdbc79         |      1 | 1cdbc79@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     84 | 38d3a80         |      1 | 38d3a80@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     85 | 6a30881         |      1 | 6a30881@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     86 | 6d91682         |      1 | 6d91682@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     87 | c758283         |      1 | c758283@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     88 | c8f2c84         |      1 | c8f2c84@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     89 | 4884985         |      1 | 4884985@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     90 | 1d6e286         |      1 | 1d6e286@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     91 | b218487         |      1 | b218487@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     92 | 6449388         |      1 | 6449388@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     93 | b0e7489         |      1 | b0e7489@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     94 | 8193890         |      1 | 8193890@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     95 | 4707291         |      1 | 4707291@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     96 | 6871592         |      1 | 6871592@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     97 | 0ba6293         |      1 | 0ba6293@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     98 | 687e494         |      1 | 687e494@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     99 | b478c95         |      1 | b478c95@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    100 | 7252f96         |      1 | 7252f96@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    101 | dca2097         |      1 | dca2097@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    102 | 296f898         |      1 | 296f898@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    103 | 8eb2f99         |      1 | 8eb2f99@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    104 | 26891100        |      1 | 26891100@qq.com |    1 |       1 | 开发部    | db_source1 |
|    105 | 318d9101        |      1 | 318d9101@qq.com |    1 |       1 | 开发部    | db_source1 |
|    106 | a531c102        |      1 | a531c102@qq.com |    1 |       1 | 开发部    | db_source1 |
|    107 | b84b6103        |      1 | b84b6103@qq.com |    1 |       1 | 开发部    | db_source1 |
|    108 | 0815d104        |      1 | 0815d104@qq.com |    1 |       1 | 开发部    | db_source1 |
|   1026 | 哈哈哈哈哈      |      0 | 12@163.com      |  100 |    NULL | NULL      | NULL       |
|   NULL | NULL            |   NULL | NULL            | NULL |       4 | 测试部    | db_source1 |
|   NULL | NULL            |   NULL | NULL            | NULL |       6 | 管理部    | db_source1 |
|   NULL | NULL            |   NULL | NULL            | NULL |      34 | 市场      | db2        |
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
62 rows in set (0.01 sec)

mysql> delete from tab_emp order by emp_id asc limit 20;
Query OK, 20 rows affected (0.02 sec)

mysql> (select * from tab_emp left join tab_dept on tab_emp.d_id =tab_dept.dept_id) union (select * from tab_emp right join tab_dept on tab_emp.d_id =tab_dept.dept_id);
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
| emp_id | emp_name        | gender | email           | d_id | dept_id | dept_name | db_source  |
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
|     71 | 36cb267         |      1 | 36cb267@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     72 | c723568         |      1 | c723568@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     73 | 0ed4169         |      1 | 0ed4169@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     74 | ec3f370         |      1 | ec3f370@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     75 | 6b18f71         |      1 | 6b18f71@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     76 | a999772         |      1 | a999772@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     77 | e588b73         |      1 | e588b73@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     78 | 6841b74         |      1 | 6841b74@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     79 | f508975         |      1 | f508975@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     80 | c060b76         |      1 | c060b76@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     81 | c627d77         |      1 | c627d77@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     82 | 786f678         |      1 | 786f678@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     83 | 1cdbc79         |      1 | 1cdbc79@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     84 | 38d3a80         |      1 | 38d3a80@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     85 | 6a30881         |      1 | 6a30881@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     86 | 6d91682         |      1 | 6d91682@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     87 | c758283         |      1 | c758283@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     88 | c8f2c84         |      1 | c8f2c84@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     89 | 4884985         |      1 | 4884985@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     90 | 1d6e286         |      1 | 1d6e286@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     91 | b218487         |      1 | b218487@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     92 | 6449388         |      1 | 6449388@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     93 | b0e7489         |      1 | b0e7489@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     94 | 8193890         |      1 | 8193890@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     95 | 4707291         |      1 | 4707291@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     96 | 6871592         |      1 | 6871592@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     97 | 0ba6293         |      1 | 0ba6293@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     98 | 687e494         |      1 | 687e494@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     99 | b478c95         |      1 | b478c95@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    100 | 7252f96         |      1 | 7252f96@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    101 | dca2097         |      1 | dca2097@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    102 | 296f898         |      1 | 296f898@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    103 | 8eb2f99         |      1 | 8eb2f99@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    104 | 26891100        |      1 | 26891100@qq.com |    1 |       1 | 开发部    | db_source1 |
|    105 | 318d9101        |      1 | 318d9101@qq.com |    1 |       1 | 开发部    | db_source1 |
|    106 | a531c102        |      1 | a531c102@qq.com |    1 |       1 | 开发部    | db_source1 |
|    107 | b84b6103        |      1 | b84b6103@qq.com |    1 |       1 | 开发部    | db_source1 |
|    108 | 0815d104        |      1 | 0815d104@qq.com |    1 |       1 | 开发部    | db_source1 |
|   1026 | 哈哈哈哈哈      |      0 | 12@163.com      |  100 |    NULL | NULL      | NULL       |
|   NULL | NULL            |   NULL | NULL            | NULL |       4 | 测试部    | db_source1 |
|   NULL | NULL            |   NULL | NULL            | NULL |       6 | 管理部    | db_source1 |
|   NULL | NULL            |   NULL | NULL            | NULL |      34 | 市场      | db2        |
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
42 rows in set (0.00 sec)

mysql> delete from tab_emp order by emp_id asc limit 20;
Query OK, 20 rows affected (0.01 sec)

mysql> (select * from tab_emp left join tab_dept on tab_emp.d_id =tab_dept.dept_id) union (select * from tab_emp right join tab_dept on tab_emp.d_id =tab_dept.dept_id);
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
| emp_id | emp_name        | gender | email           | d_id | dept_id | dept_name | db_source  |
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
|     91 | b218487         |      1 | b218487@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     92 | 6449388         |      1 | 6449388@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     93 | b0e7489         |      1 | b0e7489@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     94 | 8193890         |      1 | 8193890@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     95 | 4707291         |      1 | 4707291@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     96 | 6871592         |      1 | 6871592@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     97 | 0ba6293         |      1 | 0ba6293@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     98 | 687e494         |      1 | 687e494@qq.com  |    1 |       1 | 开发部    | db_source1 |
|     99 | b478c95         |      1 | b478c95@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    100 | 7252f96         |      1 | 7252f96@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    101 | dca2097         |      1 | dca2097@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    102 | 296f898         |      1 | 296f898@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    103 | 8eb2f99         |      1 | 8eb2f99@qq.com  |    1 |       1 | 开发部    | db_source1 |
|    104 | 26891100        |      1 | 26891100@qq.com |    1 |       1 | 开发部    | db_source1 |
|    105 | 318d9101        |      1 | 318d9101@qq.com |    1 |       1 | 开发部    | db_source1 |
|    106 | a531c102        |      1 | a531c102@qq.com |    1 |       1 | 开发部    | db_source1 |
|    107 | b84b6103        |      1 | b84b6103@qq.com |    1 |       1 | 开发部    | db_source1 |
|    108 | 0815d104        |      1 | 0815d104@qq.com |    1 |       1 | 开发部    | db_source1 |
|   1026 | 哈哈哈哈哈      |      0 | 12@163.com      |  100 |    NULL | NULL      | NULL       |
|   NULL | NULL            |   NULL | NULL            | NULL |       4 | 测试部    | db_source1 |
|   NULL | NULL            |   NULL | NULL            | NULL |       6 | 管理部    | db_source1 |
|   NULL | NULL            |   NULL | NULL            | NULL |      34 | 市场      | db2        |
+--------+-----------------+--------+-----------------+------+---------+-----------+------------+
22 rows in set (0.00 sec)

mysql> # 取a b 的各个部分 即
mysql> (select * from tab_emp a left join tab_dept b on a.d_id=b.dept_id where b.dept_id is null) union (select * from tab_emp a right join tab_dept b on a.d_id=b.dept_id where a.d_id is null);
+--------+-----------------+--------+------------+------+---------+-----------+------------+
| emp_id | emp_name        | gender | email      | d_id | dept_id | dept_name | db_source  |
+--------+-----------------+--------+------------+------+---------+-----------+------------+
|   1026 | 哈哈哈哈哈      |      0 | 12@163.com |  100 |    NULL | NULL      | NULL       |
|   NULL | NULL            |   NULL | NULL       | NULL |       4 | 测试部    | db_source1 |
|   NULL | NULL            |   NULL | NULL       | NULL |       6 | 管理部    | db_source1 |
|   NULL | NULL            |   NULL | NULL       | NULL |      34 | 市场      | db2        |
+--------+-----------------+--------+------------+------+---------+-----------+------------+
4 rows in set (0.00 sec)

mysql> # 索引: 
mysql> exit
mysql> #索引 面试题: 索引是什么 索引是帮助mysql高效获取数据的数据结构,索引的本质就是数据结构
mysql> # 索引的目的是提高查询效率,可以类比字典
mysql> # 可以理解为: 排好序的快速查找数据结构
mysql> # 详解: 在数据之外,数据库系统还维护着满足特定查找算法的数据结构,这些数据结构以某种方式引用指向数据
mysql> #这样就可以在在这些数据结构上实现查找算法,这种数据结构就是索引.
mysql> # 结论: 数据本身之外,数据库还维护着一个满足特定查找算法的数据结构,这些数据结构以某种方式指向数据,这样就可以在这些数据结构的基础上实现查找算法,这种数据结构就是索引.
mysql> #索引本身也很大,不可能全部保存在内存中,因此索引往往以索引文件的形式存储在磁盘上
mysql> # 索引的优势和劣势 
mysql> # 提高检索效率,降低数据库的io成本
mysql> # 通过索引对数据进行排序,降低数据排序成本,降低cpu的消耗
mysql> # 劣势: 实际上索引也是一张表,该表保存了主键与索引字段,并指向实体表的记录,所以索引也是要占用空间的
mysql> # 虽然索引加大了查询速度,同时会降低更新表的速度,如对表的insert update 和delete 因为更新表时,mysql不仅要保存数据,还要保存一下u索引文件每次更新添加索引列的字段,都会调整因为更新带来的键值变化后的索引信息
mysql> # 索引只是提高效率的一个因素,如果你的mysql有大量数据的表,就需要化时间研究建立最优秀的索引,或优化查询
mysql> # 索引的分类
mysql> # 单值索引 即一个索引只包含单个列,一个表可以有多个单列索引
mysql> # 唯一索引 即索引列的值必须唯一,但允许有空值,
mysql> # 复合索引 即一个索引包含多个列
mysql> # 语法: create (unique) index  indexname on table(colomn(lengh));
mysql> # alter 表名 add (unique) indexx
mysql> # alter 表名 add (unique) index indexname on(columnname(length));
mysql> # 删除 drop index indexname on 表名;
mysql> # show index from 表\G
mysql> # 语法: create (unique) index  indexname on 表名(colomnname(length));
mysql> show index from tab_emp;
ERROR 1046 (3D000): No database selected
mysql> use test01;
Database changed
mysql> show index from tab_emp;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| tab_emp |          0 | PRIMARY  |            1 | emp_id      | A         |          19 |     NULL | NULL   |      | BTREE      |         |               |
| tab_emp |          1 | d_id     |            1 | d_id        | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.08 sec)

mysql> # 用四种方式添加数据库的索引:
mysql> # alter table tab_name add primary key(column_list)
mysql> # 上面是添加主键,即索引值必须是唯一且不能为空
mysql> # alter table tab_name add unique index_name(column_list) 这条语句创建索引的值唯一(除了nulll之外,null可能会出现多次)
mysql> # alter table tab_name add index index_name(column_list) 添加普通索引,索引值可出现多次
mysql> # alter table tab_name add fulltext index_name(column_list)该语句指定索引为fulltext 用于全文索引
mysql> # 索引结构  btree full-text r-tree
mysql> #索引原理: 哪些情况下建立索引:1  主键自动建立唯一索引,2 频繁作为查询条件的字段应该创建索引  3 查询中与其他表关联的字段,外键关系建立索引:
mysql> # 4频繁更新的字段不适合创建索引,5 where条件里用不到的字段不创建索引,6 单键/组合索引的选择问题 who? (在高并发下倾向建组合索引) 
mysql> # 7 查询中排序的字段,排序字段若通过索引去访问将大大提高排序速度
mysql> 8 查询中统计或者分组字段
    -> \c
mysql> # 哪些情况不适合: 1 频繁变更的值不适合做索引,即一个索引其字段的数量/索引的数量越接近1 效率就越高
mysql> # 性能分析: nysql查询优化器: 提供他认为最优的执行计划
mysql> # explain 执行计划: 模拟执行查询分析
mysql> # 语法 explain+sql语句
mysql> # 表的读取数据 数据读取操作的操作类型 哪些索引可以使用 哪些索引实际使用 表之间的引用 每张表有多少行被优化器查询
mysql> # id select_type table type possible_keys key key_len ref rows 
mysql> # id select_type table type possible_keys key key_len ref rows extra
mysql> # id 查询的序列号: 包含一组数字,表示查询执行子句或操作表的顺序 id相同: 执行顺序由上而下.如果是子查询, id不同,id的值越大,优先级越高.越先执行
mysql> # id相同不同,id如果相同,可以认为是一组,从上往下顺序执行,在所有组中,id值越大,优先级越高,越先执行
mysql> # 衍生=derived
mysql> # select_type  常见的值 simple primary subquery derived union union result 
mysql> # select_type  常见的值 simple, primary, subquery, derived, union ,(union result) 
mysql> # 查询的类型,用于区别普通查询,联合查询,子查询等复杂查询
mysql> # simple 简单的select查询,查询中不包含子查询或者union,primary最外层查询被标记为primary
mysql> # subquery 在select或where 列表包含子查询, derived 在from列表中包含的子查询被标记为derived,mysql会递归执行,把结果放在临时表中.union
mysql> # union 若第二个select出现在union后,则会标记为union,若union包含在from子句的查询中,外层select将被标记为derived,union result从nuion获取结果的select
mysql> # type 访问类型 值: all index range ref eq_ref const,system null 
mysql> # 从最好到最差 : system>const>eq_ref>ref>range>index>all system 表示表只有一行记录(等于系统表),是const的特例,const 表示索引一次就能取出来const用于比较primary和unique索引,因为只匹配一行数据,所以很快,如将主键至于where中,mysql就能将该查询转换为一个常量
mysql> #eq_ref 唯一性索引扫描,对于每一个索引键,表中只有一条记录与之匹配,常见与主键或唯一索引扫描.ref 非唯一性索引扫描,返回匹配某个值的所有行.range 只检索给定范围的行,使用一个索引来选择行,key列显示使用哪个索引.一般在where语句中出现between in 等的查询
mysql> # index full index scan index与all区别是index类型只遍历索引树,通常比all快,因为索引文件比数据文件小..... all
mysql> # all full table scan
mysql> # possible_keys 显示应用在这张表的索引,一个或多个.但不一定被查询实际用到.keys真正用到的索引,key_len 同样结果下,key_len越小越好,ref显示索引的哪一列被使用.如果可能的话为一个const常量.rows优化器查询找到所需的行数,extra十分重要的额外信息 using filesort 使用了文件内排序,需要及时优化,using temporar用了临时表,using index 表示相应的select用到了覆盖索引,避免访问了表的数据行,效率不错.索引覆盖: select只在索引中就查到不需要去查数据表.using where 用了where过滤 ,using join buffer 调缓冲,impossible where where子句为false,不能获取数据.. 
mysql> exit
mysql> use test01;
Database changed
mysql> explain select dept_id from tab_dept;
+----+-------------+----------+-------+---------------+---------+---------+------+------+-------------+
| id | select_type | table    | type  | possible_keys | key     | key_len | ref  | rows | Extra       |
+----+-------------+----------+-------+---------------+---------+---------+------+------+-------------+
|  1 | SIMPLE      | tab_dept | index | NULL          | PRIMARY | 4       | NULL |    4 | Using index |
+----+-------------+----------+-------+---------------+---------+---------+------+------+-------------+
1 row in set (0.13 sec)

mysql> explain select dept_name  from tab_dept;
+----+-------------+----------+------+---------------+------+---------+------+------+-------+
| id | select_type | table    | type | possible_keys | key  | key_len | ref  | rows | Extra |
+----+-------------+----------+------+---------------+------+---------+------+------+-------+
|  1 | SIMPLE      | tab_dept | ALL  | NULL          | NULL | NULL    | NULL |    4 |       |
+----+-------------+----------+------+---------------+------+---------+------+------+-------+
1 row in set (0.00 sec)

mysql> exit
mysql> # 有范围会引起索引失效: 故 where后的条件应该精确,
mysql> # 单表分析: 如select article_id from article where category_id=1 and comments=1 order by views desc limit 1 
mysql> # 单表分析: 如select article_id from article where category_id=1 and comments>1 order by views desc limit 1 
mysql> # 此语句建立索引如 create index idx_acticle_ccs on article(category_id,comments,views);会导致有了using filesort ,
mysql> # 需要重新建立索引 drop index idx_article_ccs from article ;  create index idx_article_cv on article(category_id,views);
mysql> # 使用新的索引能够保证不会有using filesort ,ref有const是理想情况
mysql> #两表优化案例:
mysql> # # 删除索引是drop index indexname on 表;
mysql> # alter table 表名 add index indexname (字段);
mysql> # 左连接右表建索引,右连接左表建索引
mysql> # 三表优化案例:
mysql> # 索引最好设置在要经常查询的字段中
mysql> # 永远用小表驱动大表
mysql> # 索引的优化 : 索引的失效
mysql> # 索引失效的原因:1 全值匹配我最爱,2 最佳左前缀法则,即如果索引了多列,要遵守最佳左前缀法则,
mysql> exit
mysql> # 最佳左前缀法则,建的第一个索引的字段不能丢失
mysql> # 查询从索引的最左前列开始并且不跳过索引的列
mysql> 3 不在索引列上作任何的操作(计算,函数,自动or手动 类型转换,会导致索引失效而转向全表扫描)
    -> \c
mysql> 4 存储引擎不能使用索引中范围条件右边的值
    -> 4 存储引擎不能使用索引中范围条件右边的列
    -> \c
mysql> # 5 尽量使用覆盖索引(只访问索引的查询(索引列和查询列一致,减少select*))
mysql> 例 3条 : seleect * from staffs where name='12' and age=12 and pos='12' 
    -> \c
mysql> # 例 3条 : seleect * from staffs where name='12' and age>12 and pos='12' 使用age>12会使后边的索引失效
mysql> # 例 3 条 select * from staffs where pos='123'; 这会导致全表扫描
mysql> # 例 3条 : select * from staffs where name='zhang' and pos='23' 中间兄弟不能断
mysql> # 例 3条 : select * from staffs where name='zhang' and pos='23' 中间兄弟不能断 只用到了name索引
mysql> # 例5 select * from staffs where name="zds" and age=23 and pos="manager";
mysql> # select name,age,pos from staffs where name="zds" and age=23 and pos="manager"; 这种比上一种要好
mysql> # 6 mysql
mysql> # 6 mysql 在使用不等于(!=或者<>)的时候无法使用索引而导致全表扫描
mysql> # 7 is null is not null也会导致索引失效而全表扫描
mysql> # 7 is null is not null也无法使用索引
mysql> # 8 like以通配符开头('%abc..')
mysql> 
mysql> # 8 like以通配符开头('%abc..')mysql 索引会失效而变成全表扫描的操作
mysql> create staffs(id int,name varchar(20),age int,pos varchar(50),add_time datetime default now());
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'staffs(id int,name varchar(20),age int,pos varchar(50),add_time datetime default' at line 1
mysql> create table staffs(id int ,name varchar(20),age int,pos varchar(50),add_time datetime default now());
ERROR 1046 (3D000): No database selected
mysql> use tets01;
ERROR 1049 (42000): Unknown database 'tets01'
mysql> use test01;
Database changed
mysql> create table staffs(id int ,name varchar(20),age int,pos varchar(50),add_time datetime default now());
ERROR 1067 (42000): Invalid default value for 'add_time'
mysql> create table staffs(id int ,name varchar(20),age int,pos varchar(50),add_time datetime default now());
ERROR 1067 (42000): Invalid default value for 'add_time'
mysql> create table staffs(id int ,name varchar(20),age int,pos varchar(50),add_time datetime default now());
ERROR 1067 (42000): Invalid default value for 'add_time'
mysql> exit
mysql> insert into staffs(id,name,age,pos) values(1,'zhangsan',12,'manager'),(2,'韩梅梅',23,'staff'),(3,'lisi',90,'ceo');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from staffs;
+------+-----------+------+---------+----------+
| id   | name      | age  | pos     | add_time |
+------+-----------+------+---------+----------+
|    1 | zhangsan  |   12 | manager | NULL     |
|    2 | 韩梅梅    |   23 | staff   | NULL     |
|    3 | lisi      |   90 | ceo     | NULL     |
+------+-----------+------+---------+----------+
3 rows in set (0.00 sec)

mysql> # 例 
mysql> # 创建索引:
mysql> create index idx_staffs_nameagepos on staffs(name,age,pos);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show index from staffs;
+--------+------------+-----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name              | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+-----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| staffs |          1 | idx_staffs_nameagepos |            1 | name        | A         |           3 |     NULL | NULL   | YES  | BTREE      |         |               |
| staffs |          1 | idx_staffs_nameagepos |            2 | age         | A         |           3 |     NULL | NULL   | YES  | BTREE      |         |               |
| staffs |          1 | idx_staffs_nameagepos |            3 | pos         | A         |           3 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+-----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
3 rows in set (0.00 sec)

mysql> # 例
mysql> 
mysql> explain select * from staffs where name='zhangsan' and age=12 and pos='manager'; 
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+-------------+
| id | select_type | table  | type | possible_keys         | key                   | key_len | ref               | rows | Extra       |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+-------------+
|  1 | SIMPLE      | staffs | ref  | idx_staffs_nameagepos | idx_staffs_nameagepos | 221     | const,const,const |    1 | Using where |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+-------------+
1 row in set (0.00 sec)

mysql> explain select name,age,pos from staffs where name='zhangsan' and age=12 and pos='manager'; 
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+--------------------------+
| id | select_type | table  | type | possible_keys         | key                   | key_len | ref               | rows | Extra                    |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+--------------------------+
|  1 | SIMPLE      | staffs | ref  | idx_staffs_nameagepos | idx_staffs_nameagepos | 221     | const,const,const |    1 | Using where; Using index |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+--------------------------+
1 row in set (0.00 sec)

mysql> insert into staffs(id,name,age,pos) values(5,'xiaoma',23,'manager'),(4,'韩梅梅',25,'staff'),(6,'xiaohu',90,'staff');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> explain select name,age,pos from staffs where name='zhangsan' and age=12 and pos='manager'; 
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+--------------------------+
| id | select_type | table  | type | possible_keys         | key                   | key_len | ref               | rows | Extra                    |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+--------------------------+
|  1 | SIMPLE      | staffs | ref  | idx_staffs_nameagepos | idx_staffs_nameagepos | 221     | const,const,const |    1 | Using where; Using index |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+--------------------------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name='zhangsan' and age=12 and pos='manager'; 
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+-------------+
| id | select_type | table  | type | possible_keys         | key                   | key_len | ref               | rows | Extra       |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+-------------+
|  1 | SIMPLE      | staffs | ref  | idx_staffs_nameagepos | idx_staffs_nameagepos | 221     | const,const,const |    1 | Using where |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------------------+------+-------------+
1 row in set (0.00 sec)

mysql> # 例 有范围会导致索引失效
mysql> explain select * from staffs where name='zhangsan' and age>12 and pos='manager'; 
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
| id | select_type | table  | type  | possible_keys         | key                   | key_len | ref  | rows | Extra       |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | range | idx_staffs_nameagepos | idx_staffs_nameagepos | 68      | NULL |    1 | Using where |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> select * from staffs;
+------+-----------+------+---------+----------+
| id   | name      | age  | pos     | add_time |
+------+-----------+------+---------+----------+
|    1 | zhangsan  |   12 | manager | NULL     |
|    2 | 韩梅梅    |   23 | staff   | NULL     |
|    3 | lisi      |   90 | ceo     | NULL     |
|    5 | xiaoma    |   23 | manager | NULL     |
|    4 | 韩梅梅    |   25 | staff   | NULL     |
|    6 | xiaohu    |   90 | staff   | NULL     |
+------+-----------+------+---------+----------+
6 rows in set (0.00 sec)

mysql> insert into staffs(id,name,age,pos) values(7,'xiao',12,'manager'),(8,'张',45,'staff'),(9,'ma',20,'ceo');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> # 例 is null is not null也会导致索引失效
mysql> explain select * from staffs where name is null; 
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
| id | select_type | table  | type | possible_keys         | key                   | key_len | ref   | rows | Extra       |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
|  1 | SIMPLE      | staffs | ref  | idx_staffs_nameagepos | idx_staffs_nameagepos | 63      | const |    1 | Using where |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name is not null; 
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys         | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | ALL  | idx_staffs_nameagepos | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> # 例使用不等于会导致索引失效
mysql> explain select * from staffs where name!='zhangsan'; 
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys         | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | ALL  | idx_staffs_nameagepos | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> # like 会导致索引失效
mysql>  select * from staffs where name like'%zhangsan%'; 
+------+----------+------+---------+----------+
| id   | name     | age  | pos     | add_time |
+------+----------+------+---------+----------+
|    1 | zhangsan |   12 | manager | NULL     |
+------+----------+------+---------+----------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name like'%zhangsan%'; 
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name like'%zhangsan'; 
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name like'zhangsan%'; 
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
| id | select_type | table  | type  | possible_keys         | key                   | key_len | ref  | rows | Extra       |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | range | idx_staffs_nameagepos | idx_staffs_nameagepos | 63      | NULL |    1 | Using where |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> # %最好加右边
mysql> # like是范围级别
mysql> # 面试: 解决like '%字符串%'时索引不被使用的方法? 
mysql> # 创建主键索引: 
mysql> alter table staffs add primary key(id);
Query OK, 9 rows affected (0.03 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> show index from staffs;
+--------+------------+-----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name              | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+-----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| staffs |          0 | PRIMARY               |            1 | id          | A         |           9 |     NULL | NULL   |      | BTREE      |         |               |
| staffs |          1 | idx_staffs_nameagepos |            1 | name        | A         |           9 |     NULL | NULL   | YES  | BTREE      |         |               |
| staffs |          1 | idx_staffs_nameagepos |            2 | age         | A         |           9 |     NULL | NULL   | YES  | BTREE      |         |               |
| staffs |          1 | idx_staffs_nameagepos |            3 | pos         | A         |           9 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+-----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
4 rows in set (0.00 sec)

mysql> explain select * from staffs where name is null; 
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
| id | select_type | table  | type | possible_keys         | key                   | key_len | ref   | rows | Extra       |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
|  1 | SIMPLE      | staffs | ref  | idx_staffs_nameagepos | idx_staffs_nameagepos | 63      | const |    1 | Using where |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
1 row in set (0.00 sec)

mysql> # 面试: 解决like '%字符串%'时索引不被使用的方法? 
mysql> # 两边%%解决用 建立覆盖索引可解决
mysql> # 字符串不加单引号索引失效
mysql> select * from staffs where name='zhangsan';
+----+----------+------+---------+----------+
| id | name     | age  | pos     | add_time |
+----+----------+------+---------+----------+
|  1 | zhangsan |   12 | manager | NULL     |
+----+----------+------+---------+----------+
1 row in set (0.00 sec)

mysql> select * from staffs where name=zhangsan;
ERROR 1054 (42S22): Unknown column 'zhangsan' in 'where clause'
mysql> select * from staffs where name=lisi;
ERROR 1054 (42S22): Unknown column 'lisi' in 'where clause'
mysql> select * from staffs;
+----+-----------+------+---------+----------+
| id | name      | age  | pos     | add_time |
+----+-----------+------+---------+----------+
|  1 | zhangsan  |   12 | manager | NULL     |
|  2 | 韩梅梅    |   23 | staff   | NULL     |
|  3 | lisi      |   90 | ceo     | NULL     |
|  4 | 韩梅梅    |   25 | staff   | NULL     |
|  5 | xiaoma    |   23 | manager | NULL     |
|  6 | xiaohu    |   90 | staff   | NULL     |
|  7 | xiao      |   12 | manager | NULL     |
|  8 | 张        |   45 | staff   | NULL     |
|  9 | ma        |   20 | ceo     | NULL     |
+----+-----------+------+---------+----------+
9 rows in set (0.00 sec)

mysql> alter table staffs modify add_time datetime not null default now();
ERROR 1067 (42000): Invalid default value for 'add_time'
mysql> update staffs set add_time=now() where id in(1,2,3,4,5,6,7,8,9);
Query OK, 9 rows affected (0.01 sec)
Rows matched: 9  Changed: 9  Warnings: 0

mysql> select * from staffs;
+----+-----------+------+---------+---------------------+
| id | name      | age  | pos     | add_time            |
+----+-----------+------+---------+---------------------+
|  1 | zhangsan  |   12 | manager | 2019-10-19 11:33:10 |
|  2 | 韩梅梅    |   23 | staff   | 2019-10-19 11:33:10 |
|  3 | lisi      |   90 | ceo     | 2019-10-19 11:33:10 |
|  4 | 韩梅梅    |   25 | staff   | 2019-10-19 11:33:10 |
|  5 | xiaoma    |   23 | manager | 2019-10-19 11:33:10 |
|  6 | xiaohu    |   90 | staff   | 2019-10-19 11:33:10 |
|  7 | xiao      |   12 | manager | 2019-10-19 11:33:10 |
|  8 | 张        |   45 | staff   | 2019-10-19 11:33:10 |
|  9 | ma        |   20 | ceo     | 2019-10-19 11:33:10 |
+----+-----------+------+---------+---------------------+
9 rows in set (0.00 sec)

mysql> insert into staffs values(10,2000,23,'c',now());
Query OK, 1 row affected (0.00 sec)

mysql> select * from staffs;
+----+-----------+------+---------+---------------------+
| id | name      | age  | pos     | add_time            |
+----+-----------+------+---------+---------------------+
|  1 | zhangsan  |   12 | manager | 2019-10-19 11:33:10 |
|  2 | 韩梅梅    |   23 | staff   | 2019-10-19 11:33:10 |
|  3 | lisi      |   90 | ceo     | 2019-10-19 11:33:10 |
|  4 | 韩梅梅    |   25 | staff   | 2019-10-19 11:33:10 |
|  5 | xiaoma    |   23 | manager | 2019-10-19 11:33:10 |
|  6 | xiaohu    |   90 | staff   | 2019-10-19 11:33:10 |
|  7 | xiao      |   12 | manager | 2019-10-19 11:33:10 |
|  8 | 张        |   45 | staff   | 2019-10-19 11:33:10 |
|  9 | ma        |   20 | ceo     | 2019-10-19 11:33:10 |
| 10 | 2000      |   23 | c       | 2019-10-19 11:34:20 |
+----+-----------+------+---------+---------------------+
10 rows in set (0.00 sec)

mysql> # 字符串不加单引号索引失效
mysql> select * from staffs where name=2000;
+----+------+------+------+---------------------+
| id | name | age  | pos  | add_time            |
+----+------+------+------+---------------------+
| 10 | 2000 |   23 | c    | 2019-10-19 11:34:20 |
+----+------+------+------+---------------------+
1 row in set, 8 warnings (0.06 sec)

mysql> select * from staffs where name='2000';
+----+------+------+------+---------------------+
| id | name | age  | pos  | add_time            |
+----+------+------+------+---------------------+
| 10 | 2000 |   23 | c    | 2019-10-19 11:34:20 |
+----+------+------+------+---------------------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name='2000';
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
| id | select_type | table  | type | possible_keys         | key                   | key_len | ref   | rows | Extra       |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
|  1 | SIMPLE      | staffs | ref  | idx_staffs_nameagepos | idx_staffs_nameagepos | 63      | const |    1 | Using where |
+----+-------------+--------+------+-----------------------+-----------------------+---------+-------+------+-------------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name=2000;
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys         | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | ALL  | idx_staffs_nameagepos | NULL | NULL    | NULL |   10 | Using where |
+----+-------------+--------+------+-----------------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> # 少用
mysql> # 少用or 用他来连接会索引失效
mysql> explain select * from staffs where name='zhansan' or name='lisi';
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
| id | select_type | table  | type  | possible_keys         | key                   | key_len | ref  | rows | Extra       |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | range | idx_staffs_nameagepos | idx_staffs_nameagepos | 63      | NULL |    2 | Using where |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name='zhansan' or name='li';
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
| id | select_type | table  | type  | possible_keys         | key                   | key_len | ref  | rows | Extra       |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | range | idx_staffs_nameagepos | idx_staffs_nameagepos | 63      | NULL |    2 | Using where |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> explain select * from staffs where name='zhansan' or name='sjdi';
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
| id | select_type | table  | type  | possible_keys         | key                   | key_len | ref  | rows | Extra       |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | range | idx_staffs_nameagepos | idx_staffs_nameagepos | 63      | NULL |    2 | Using where |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
1 row in set (0.01 sec)

mysql>  select * from staffs where name='zhansan' or name='lisi';
+----+------+------+------+---------------------+
| id | name | age  | pos  | add_time            |
+----+------+------+------+---------------------+
|  3 | lisi |   90 | ceo  | 2019-10-19 11:33:10 |
+----+------+------+------+---------------------+
1 row in set (0.00 sec)

mysql>  select * from staffs where name='zhangsan' or name='lisi';
+----+----------+------+---------+---------------------+
| id | name     | age  | pos     | add_time            |
+----+----------+------+---------+---------------------+
|  3 | lisi     |   90 | ceo     | 2019-10-19 11:33:10 |
|  1 | zhangsan |   12 | manager | 2019-10-19 11:33:10 |
+----+----------+------+---------+---------------------+
2 rows in set (0.00 sec)

mysql> explain select * from staffs where name='zhangsan' or name='lisi';
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
| id | select_type | table  | type  | possible_keys         | key                   | key_len | ref  | rows | Extra       |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
|  1 | SIMPLE      | staffs | range | idx_staffs_nameagepos | idx_staffs_nameagepos | 63      | NULL |    2 | Using where |
+----+-------------+--------+-------+-----------------------+-----------------------+---------+------+------+-------------+
1 row in set (0.00 sec)

mysql> # 口诀 带头大哥不能死,中间兄弟不能断,符合最佳左前缀,索引列上无计算,like%加右边,范围之后全失效,字符串里有引号.
mysql> # 索引面试题: 例 select * from test where c1='c1'and c2='c2' and c4='c4' order by c3; 此时c3用于排序没有用来查找.用到了两个 c1和才
mysql> # 才
mysql> 
mysql> # c2
mysql> # 例 select * from test where c1='c1' and c2='c2' order by c4 会导致文件内排序
mysql> # 例 select * from test where c1='c1' and c5='c5' order by c2,c3 会导º
mysql> # 例 select * from test where c1='c1' and c5='c5' order by c2,c3 只有一个c1索引 ,但是才
mysql> # 例 select * from test where c1='c1' and c5='c5' order by c2,c3 只有一个c1索引 ,但是c2 ,c3用于排序,无filesort
mysql> #建的索引index(c1,c2,c3,c4);
mysql> # 例 select * from test where c1='c1' and c5='c5' order by c3,c2 只有一个c1索引 ,有filesort;
mysql> exit
mysql> # 例 select * from test where c1='c1'and c4='c4' group by c2,c3; 用了一个索引
mysql> # 例 select * from test where c1='c1'and c4='c4' group by c3,c2; 出现using temparetory
mysql> # 分组之前必排序,即order by是给定范围,group by基本上都需要进行排序,会有临时表产生
mysql> # 对于单值索引,尽量选择针对当前query过滤性更好的索引
mysql> # 在选择组合索引的时候,当前query中过滤性最好的字段在索引字段顺序中,位置越靠前越好
mysql> # 在选择组合索引的时候,尽量选择可以能够包含当前query中的where子句中更多字段的索引
mysql> # 尽可能通过分析统计信息和调整query的写法来达到选择合适索引的目的
mysql> # 小表驱动大表
mysql> #  explain
mysql> # 1 观察,2 开启慢查询日志,设置阈值 3 explain +慢sql分析 4 show profile 5 运维经理或dba进行sql服务器的参数调优 
mysql> # 永远小表驱动大表 
mysql> # order by 优化
mysql> create table tblA(id int primary key not null auto_increment,age int,brith timestamp not null);
ERROR 1046 (3D000): No database selected
mysql> use test01;
Database changed
mysql> create table tblA(id int primary key not null auto_increment,age int,brith timestamp not null);
Query OK, 0 rows affected (0.51 sec)

mysql> insert into tblA(age,brith)values(22,now()),(23,now()),(24,now());
Query OK, 3 rows affected (0.10 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> create index idx_tblA_agebrith on tabA(age,brith);
ERROR 1146 (42S02): Table 'test01.tabA' doesn't exist
mysql> create index idx_tblA_agebrith on tblA(age,brith);
Query OK, 0 rows affected (0.26 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from tbl_A;
ERROR 1146 (42S02): Table 'test01.tbl_A' doesn't exist
mysql> select * from tblA;
+----+------+---------------------+
| id | age  | brith               |
+----+------+---------------------+
|  1 |   22 | 2019-10-19 20:39:40 |
|  2 |   23 | 2019-10-19 20:39:40 |
|  3 |   24 | 2019-10-19 20:39:40 |
+----+------+---------------------+
3 rows in set (0.08 sec)

mysql> # 关注order by
mysql> explain select * from tblA where age>20 order by age;
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+--------------------------+
| id | select_type | table | type  | possible_keys     | key               | key_len | ref  | rows | Extra                    |
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+--------------------------+
|  1 | SIMPLE      | tblA  | index | idx_tblA_agebrith | idx_tblA_agebrith | 9       | NULL |    3 | Using where; Using index |
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+--------------------------+
1 row in set (0.07 sec)

mysql> explain select * from tblA where age>20 order by age,brith;
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+--------------------------+
| id | select_type | table | type  | possible_keys     | key               | key_len | ref  | rows | Extra                    |
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+--------------------------+
|  1 | SIMPLE      | tblA  | index | idx_tblA_agebrith | idx_tblA_agebrith | 9       | NULL |    3 | Using where; Using index |
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+--------------------------+
1 row in set (0.01 sec)

mysql> explain select * from tblA where age>20 order by brith;
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+------------------------------------------+
| id | select_type | table | type  | possible_keys     | key               | key_len | ref  | rows | Extra                                    |
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+------------------------------------------+
|  1 | SIMPLE      | tblA  | index | idx_tblA_agebrith | idx_tblA_agebrith | 9       | NULL |    3 | Using where; Using index; Using filesort |
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+------------------------------------------+
1 row in set (0.00 sec)

mysql> # 此时产生了filesort 
mysql> explain select * from tblA where age>20 order by brith,age;
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+------------------------------------------+
| id | select_type | table | type  | possible_keys     | key               | key_len | ref  | rows | Extra                                    |
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+------------------------------------------+
|  1 | SIMPLE      | tblA  | index | idx_tblA_agebrith | idx_tblA_agebrith | 9       | NULL |    3 | Using where; Using index; Using filesort |
+----+-------------+-------+-------+-------------------+-------------------+---------+------+------+------------------------------------------+
1 row in set (0.01 sec)

mysql> # 产生了filesort
mysql> explain select * from tblA  order by age asc ,birth desc;
ERROR 1054 (42S22): Unknown column 'birth' in 'order clause'
mysql> explain select * from tblA  order by age asc,brith desc;
+----+-------------+-------+-------+---------------+-------------------+---------+------+------+-----------------------------+
| id | select_type | table | type  | possible_keys | key               | key_len | ref  | rows | Extra                       |
+----+-------------+-------+-------+---------------+-------------------+---------+------+------+-----------------------------+
|  1 | SIMPLE      | tblA  | index | NULL          | idx_tblA_agebrith | 9       | NULL |    3 | Using index; Using filesort |
+----+-------------+-------+-------+---------------+-------------------+---------+------+------+-----------------------------+
1 row in set (0.00 sec)

mysql> #出现了filesort
mysql> order by使用最左前列法则
    -> \c
mysql> exit
mysql> # order by 如果不在索引列上,filesort有两种算法,mysql就要启动双路排序和单路排序
mysql> # 双路排序:4.1之前使用双路排序,两次扫描磁盘,最终得到数据,读取行指针和order by的列,对他们进行排序,然后扫描已经排好的列表,按照列表中的值重新对列表中读取对应的数据
mysql> # 单路排序:从磁盘读取查询需要的所有列,按照order by列在buffer对他们进行排序,然后扫描排序的列表进行输出
mysql> # 增大buffer参数的设置
mysql> # max_length_for_sort_data参数
mysql> # key(a,b,c) order by a,order by a,b;order by a,b,c;order by a desc,b desc,c desc;成立
mysql> # where a=const order by b,c; where a=const and c=const order by c;where a=const and b>const order by b,c;成立
mysql> # 不能使用索引的情况: order by a asc ,b desc,c desc; where g=const order by b,c;where a=const order by c; where a=const order by a,d;
mysql> #where a in(...) order by b,c;相当于范围查询.
mysql> # group by 优化
mysql> # group by相当于先排序后分组,遵循最佳左前缀法则
mysql> #where高于having 能在where限定的条件不要去having限定;
mysql> # 慢查询日志
mysql> # mysql的慢查询日志是mysql的一种日志记录,默认是没有开启慢查询,需要手动开启,如果不是调优需要的话,不建议启动该参数.
mysql> # 是否开启
mysql> select variables like '%slow_query_log%';
ERROR 1054 (42S22): Unknown column 'variables' in 'field list'
mysql> show variables like '%slow_query_log%';
+---------------------+-------------------------------------+
| Variable_name       | Value                               |
+---------------------+-------------------------------------+
| slow_query_log      | OFF                                 |
| slow_query_log_file | /usr/local/mysql/data/root-slow.log |
+---------------------+-------------------------------------+
2 rows in set (0.06 sec)

mysql> # 开启
mysql> set global slow_query_log=1;
Query OK, 0 rows affected (0.08 sec)

mysql> show variables like '%slow_query_log%';
+---------------------+-------------------------------------+
| Variable_name       | Value                               |
+---------------------+-------------------------------------+
| slow_query_log      | ON                                  |
| slow_query_log_file | /usr/local/mysql/data/root-slow.log |
+---------------------+-------------------------------------+
2 rows in set (0.00 sec)

mysql> # 默认时间参数
mysql> show variables like '%long_query_time%';
+-----------------+-----------+
| Variable_name   | Value     |
+-----------------+-----------+
| long_query_time | 10.000000 |
+-----------------+-----------+
1 row in set (0.00 sec)

mysql> # 10是大于而非大于等于
mysql> #设置时间
mysql> set global long_query_time=3;
Query OK, 0 rows affected (0.00 sec)

mysql> show variables like '%long_query_time%';
+-----------------+-----------+
| Variable_name   | Value     |
+-----------------+-----------+
| long_query_time | 10.000000 |
+-----------------+-----------+
1 row in set (0.00 sec)

mysql> select sleep(4)
    -> ;
+----------+
| sleep(4) |
+----------+
|        0 |
+----------+
1 row in set (4.02 sec)

mysql> select sleep(4);
+----------+
| sleep(4) |
+----------+
|        0 |
+----------+
1 row in set (4.00 sec)

mysql> show global variables like 'long_query_time';
+-----------------+----------+
| Variable_name   | Value    |
+-----------------+----------+
| long_query_time | 3.000000 |
+-----------------+----------+
1 row in set (0.00 sec)

mysql> select sleep(4);
+----------+
| sleep(4) |
+----------+
|        0 |
+----------+
1 row in set (4.00 sec)

mysql> show status like '%slow_queries%';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Slow_queries  | 0     |
+---------------+-------+
1 row in set (0.00 sec)

mysql> select sleep(4);
+----------+
| sleep(4) |
+----------+
|        0 |
+----------+
1 row in set (4.00 sec)

mysql> select sleep(4);
+----------+
| sleep(4) |
+----------+
|        0 |
+----------+
1 row in set (4.01 sec)

mysql> show status like '%slow_queries%';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Slow_queries  | 0     |
+---------------+-------+
1 row in set (0.00 sec)

mysql> select sleep(6);
+----------+
| sleep(6) |
+----------+
|        0 |
+----------+
1 row in set (6.00 sec)

mysql> show status like '%slow_queries%';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Slow_queries  | 0     |
+---------------+-------+
1 row in set (0.00 sec)

mysql> show globalstatus like '%slow_queries%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'globalstatus like '%slow_queries%'' at line 1
mysql> show global status like '%slow_queries%';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Slow_queries  | 0     |
+---------------+-------+
1 row in set (0.00 sec)

mysql> show variables like 'character%';
+--------------------------+------------------------------------------------------------+
| Variable_name            | Value                                                      |
+--------------------------+------------------------------------------------------------+
| character_set_client     | utf8                                                       |
| character_set_connection | utf8                                                       |
| character_set_database   | utf8                                                       |
| character_set_filesystem | binary                                                     |
| character_set_results    | utf8                                                       |
| character_set_server     | utf8                                                       |
| character_set_system     | utf8                                                       |
| character_sets_dir       | /opt/mysql5.5/mysql-5.5.46-linux2.6-x86_64/share/charsets/ |
+--------------------------+------------------------------------------------------------+
8 rows in set (0.05 sec)

mysql> exit
