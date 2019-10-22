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
5 rows in set (0.11 sec)

mysql> use teat01
ERROR 1049 (42000): Unknown database 'teat01'
mysql> use test01
Database changed
mysql> show variables like '%slow_query%'
    -> ;
+---------------------+-------------------------------------+
| Variable_name       | Value                               |
+---------------------+-------------------------------------+
| slow_query_log      | ON                                  |
| slow_query_log_file | /usr/local/mysql/data/root-slow.log |
+---------------------+-------------------------------------+
2 rows in set (0.00 sec)

mysql> mysqldumpslow --halp
    -> mysqldumpslow --help;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysqldumpslow --halp
mysqldumpslow --help' at line 1
mysql>  mysqldumpslow --help;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysqldumpslow --help' at line 1
mysql>  mysqldumpslow --help
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysqldumpslow --help' at line 1
mysql> \c
mysql> # 得到返回集最多的10个sql
mysql> exit
mysql> # 得到返回集最多的10个sql
mysql> # mysqldumpslow -s -r -t 10 /usr/local/mysql/data/root-slow.log
mysql> create database bigdata;
Query OK, 1 row affected (0.07 sec)

mysql> use bigdatal
ERROR 1049 (42000): Unknown database 'bigdatal'
mysql> use bigdata;
Database changed
mysql> create table dept(id int unsigned primary key auto_increment,deptno mediumint unsigned not null default 0,dname varchar(20) not  null default "",loc varchar(13) not null default "")engine=innodb default charset=utf-8;
ERROR 1115 (42000): Unknown character set: 'utf'
mysql> create table dept(id int unsigned primary key auto_increment,deptno mediumint unsigned not null default 0,dname varchar(20) not  null default "",loc varchar(13) not null default "")engine=innodb default charset=utf8;
Query OK, 0 rows affected (0.17 sec)

mysql> create table emp(id int not null unsigned primary key auto_increment,empno varchar(20) not null default "",job varchar(9) not null default "",mgr mediumint unsigned not null default 0,hiredate date not null,sal decimal(7,2) not null,comm decimal(7,2) not null,deptno mediumint unsigned not null default 0 )engine=innodb default charset=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unsigned primary key auto_increment,empno varchar(20) not null default "",job va' at line 1
mysql> create table emp(id int not null unsigned primary key auto_increment,empno varchar(20) not null default "",job varchar(9) not null default "",mgr mediumint unsigned not null default 0,hiredate date not null,sal decimal(7,2) not null,comm decimal(7,2) not null,deptno mediumint unsigned not null default 0 )engine=innodb default charset=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unsigned primary key auto_increment,empno varchar(20) not null default "",job va' at line 1
mysql> create table emp(id int not null unsigned primary key auto_increment,empno varchar(20) not null default "",ename varchar(20) not null default "",job varchar(9) not null default "",mgr mediumint unsigned not null default 0,hiredate date not null,sal decimal(7,2) not null,comm decimal(7,2) not null,deptno mediumint unsigned not null default 0 )engine=innodb default charset=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unsigned primary key auto_increment,empno varchar(20) not null default "",ename ' at line 1
mysql> show tables;
+-------------------+
| Tables_in_bigdata |
+-------------------+
| dept              |
| emp               |
+-------------------+
2 rows in set (0.00 sec)

mysql> #设置参数
mysql> show variables like 'log_bin_trust_function_creators';
+---------------------------------+-------+
| Variable_name                   | Value |
+---------------------------------+-------+
| log_bin_trust_function_creators | OFF   |
+---------------------------------+-------+
1 row in set (0.04 sec)

mysql> set global log_bin_trust_function_creators=1;
Query OK, 0 rows affected (0.00 sec)

mysql> show variables like 'log_bin_trust_function_creators';
+---------------------------------+-------+
| Variable_name                   | Value |
+---------------------------------+-------+
| log_bin_trust_function_creators | ON    |
+---------------------------------+-------+
1 row in set (0.00 sec)

mysql> create FUNCTION rand_num() RETURNS int(5)
    -> BEGIN
    -> DECLARE i int default 0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> set i =FLOOR(100+RAND()*10);
ERROR 1193 (HY000): Unknown system variable 'i'
mysql> RETURN i;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'RETURN i' at line 1
mysql> END $
    -> 
    -> 
    -> \c
mysql> delimter $
    -> delimter $;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'delimter $
delimter $' at line 1
mysql>  delimter $;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'delimter $' at line 1
mysql>  delimter $
    -> \c
mysql> delimiter $ 
mysql> create FUNCTION rand_num() RETURNS int(5)
    -> BEGIN
    -> DECLARE i int default 0;
    -> set i =FLOOR(100+RAND()*10);
    -> RETURN i;
    -> END $
Query OK, 0 rows affected (0.00 sec)

mysql> delimiter $
mysql> 
mysql> CREATE PROCEDURE insert_emp(int START int(10),IN max_num INT(10))
    -> 
    -> BEGIN
    -> DECLARE i int DEFAULT 0;
    -> set autocommit=0;
    -> REPEAT
    -> set i =i+1;
    -> insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) VALUES ((START+i),rand_string(6),'salesman',0001,CURDATE(),2000,400,rand_num());
    -> UNTIL i=max_num
    -> end REPEAT;
    -> COMMIT;
    -> END $
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int START int(10),IN max_num INT(10))

BEGIN
DECLARE i int DEFAULT 0;
set autoco' at line 1
mysql> delimiter ;
mysql> call insert_dept(100,10);
Query OK, 0 rows affected (0.09 sec)

mysql> select * from dept;
+----+--------+------------+--------+
| id | deptno | dname      | loc    |
+----+--------+------------+--------+
|  1 |    101 | TDZscbNELR | gDHJSy |
|  2 |    102 | xPaNgnQiaT | gOvdZP |
|  3 |    103 | JNvgtTPOds | zdtSkQ |
|  4 |    104 | QwTZITNtWx | xFONVS |
|  5 |    105 | JCiNcoRkqr | dqlAns |
|  6 |    106 | AJqEGdLRfY | afOQRl |
|  7 |    107 | qqqqrgoePg | lNFXpg |
|  8 |    108 | GyaPGKLDpA | VENoBs |
|  9 |    109 | fOEACmIHwS | ETdnUS |
| 10 |    110 | PjQRhGqDUV | JdFeMG |
+----+--------+------------+--------+
10 rows in set (0.00 sec)

mysql> call insert_emp(100001,500000);
Query OK, 0 rows affected (29.94 sec)

mysql> select * from emp;
500000 rows in set (0.61 sec)

mysql> show variables like 'profiling';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| profiling     | OFF   |
+---------------+-------+
1 row in set (0.00 sec)

mysql> set global profilling=on
    -> ;
ERROR 1193 (HY000): Unknown system variable 'profilling'
mysql> set  profilling=on;
ERROR 1193 (HY000): Unknown system variable 'profilling'
mysql> set  profiling=on;
Query OK, 0 rows affected (0.01 sec)

mysql> show variables like 'profiling';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| profiling     | ON    |
+---------------+-------+
1 row in set (0.00 sec)

mysql> select * from emp group by id%10 limit 150000;
+----+--------+--------+----------+-----+------------+---------+--------+--------+
| id | empno  | ename  | job      | mgr | hiredate   | sal     | comm   | deptno |
+----+--------+--------+----------+-----+------------+---------+--------+--------+
| 10 | 100011 | rwBUgQ | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    107 |
|  1 | 100002 | BcsZAZ | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    102 |
|  2 | 100003 | APkYqg | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    103 |
|  3 | 100004 | SScXdQ | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    108 |
|  4 | 100005 | TvvKZX | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    108 |
|  5 | 100006 | EpgKji | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    107 |
|  6 | 100007 | pDpIOv | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    101 |
|  7 | 100008 | jflMKf | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    107 |
|  8 | 100009 | ovINBG | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    100 |
|  9 | 100010 | BRNuGm | salesman |   1 | 2019-10-20 | 2000.00 | 400.00 |    101 |
+----+--------+--------+----------+-----+------------+---------+--------+--------+
10 rows in set (0.40 sec)

mysql> show profiles;
+----------+------------+-----------------------------------------------+
| Query_ID | Duration   | Query                                         |
+----------+------------+-----------------------------------------------+
|        1 | 0.00032925 | show variables like 'profiling'               |
|        2 | 0.40991375 | select * from emp group by id%10 limit 150000 |
+----------+------------+-----------------------------------------------+
2 rows in set (0.00 sec)

mysql> show profile cpu,block io for query 2; 
+----------------------+----------+----------+------------+--------------+---------------+
| Status               | Duration | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+----------+----------+------------+--------------+---------------+
| starting             | 0.000150 | 0.000150 |   0.000000 |            0 |             0 |
| checking permissions | 0.000009 | 0.000008 |   0.000000 |            0 |             0 |
| Opening tables       | 0.000037 | 0.000038 |   0.000000 |            0 |             0 |
| System lock          | 0.000033 | 0.000032 |   0.000000 |            0 |             0 |
| init                 | 0.000062 | 0.000062 |   0.000000 |            0 |             0 |
| optimizing           | 0.000006 | 0.000005 |   0.000000 |            0 |             0 |
| statistics           | 0.000055 | 0.000055 |   0.000000 |            0 |             0 |
| preparing            | 0.000032 | 0.000032 |   0.000000 |            0 |             0 |
| Creating tmp table   | 0.000046 | 0.000046 |   0.000000 |            0 |             0 |
| executing            | 0.000004 | 0.000003 |   0.000000 |            0 |             0 |
| Copying to tmp table | 0.408802 | 0.404978 |   0.000000 |            0 |             0 |
| Sorting result       | 0.000021 | 0.000018 |   0.000000 |            0 |             0 |
| Sending data         | 0.000019 | 0.000019 |   0.000000 |            0 |             0 |
| end                  | 0.000003 | 0.000002 |   0.000000 |            0 |             0 |
| removing tmp table   | 0.000005 | 0.000005 |   0.000000 |            0 |             0 |
| end                  | 0.000003 | 0.000003 |   0.000000 |            0 |             0 |
| query end            | 0.000179 | 0.000179 |   0.000000 |            0 |             0 |
| closing tables       | 0.000007 | 0.000007 |   0.000000 |            0 |             0 |
| freeing items        | 0.000438 | 0.000085 |   0.000000 |            0 |             0 |
| logging slow query   | 0.000004 | 0.000004 |   0.000000 |            0 |             0 |
| cleaning up          | 0.000003 | 0.000003 |   0.000000 |            0 |             0 |
+----------------------+----------+----------+------------+--------------+---------------+
21 rows in set (0.00 sec)

mysql> # 若有 converting heap to myisam 查询结果太大,
mysql> exit
mysql> # 有creating temp table创建临时表
mysql> # coping to temp table on disk
mysql> # locked
mysql> # 全局查询日志
mysql> #测试时候启动
mysql> set global general_log=1;
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> select * from dept;
ERROR 1046 (3D000): No database selected
mysql> use bigdata;
Database changed
mysql> select * from dept;
+----+--------+------------+--------+
| id | deptno | dname      | loc    |
+----+--------+------------+--------+
|  1 |    101 | TDZscbNELR | gDHJSy |
|  2 |    102 | xPaNgnQiaT | gOvdZP |
|  3 |    103 | JNvgtTPOds | zdtSkQ |
|  4 |    104 | QwTZITNtWx | xFONVS |
|  5 |    105 | JCiNcoRkqr | dqlAns |
|  6 |    106 | AJqEGdLRfY | afOQRl |
|  7 |    107 | qqqqrgoePg | lNFXpg |
|  8 |    108 | GyaPGKLDpA | VENoBs |
|  9 |    109 | fOEACmIHwS | ETdnUS |
| 10 |    110 | PjQRhGqDUV | JdFeMG |
+----+--------+------------+--------+
10 rows in set (0.00 sec)

mysql> select * from mysql.general_log;
Empty set (0.00 sec)

mysql> # mysql 锁理论
mysql> #锁
mysql> # 读锁,即共享锁,针对同一份数据,多个读操作可以同时进行而不会互相影响
mysql> # 写锁,当前写操作没有完成前,它会阻断其他写锁和读锁
mysql> # 偏向myisam存储引擎开销小,加锁快,无死锁,锁定粒度大,发生锁冲突的概率最高,并发度最低
mysql> # 表锁:  ----->
mysql> create table mylock(id int primary key auto_increment,name varchar(20))engine myisam;
ERROR 1046 (3D000): No database selected
mysql> use test01
Database changed
mysql> create table mylock(id int primary key auto_increment,name varchar(20))engine myisam;
Query OK, 0 rows affected (0.01 sec)

mysql> insert into mylock(name) values('a'),('b'),('c'),('d'),('e');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from mylock;
+----+------+
| id | name |
+----+------+
|  1 | a    |
|  2 | b    |
|  3 | c    |
|  4 | d    |
|  5 | e    |
+----+------+
5 rows in set (0.00 sec)

mysql> mysql> # 给book表加读锁或写锁
mysql> show open tables;
+--------------------+----------------------------------------------+--------+-------------+
| Database           | Table                                        | In_use | Name_locked |
+--------------------+----------------------------------------------+--------+-------------+
| mysql              | time_zone_transition_type                    |      0 |           0 |
| performance_schema | events_waits_summary_global_by_event_name    |      0 |           0 |
| test01             | mylock                                       |      0 |           0 |
| performance_schema | events_waits_history_long                    |      0 |           0 |
| test01             | tab_emp                                      |      0 |           0 |
| mysql              | proxies_priv                                 |      0 |           0 |
| performance_schema | events_waits_summary_by_instance             |      0 |           0 |
| performance_schema | setup_consumers                              |      0 |           0 |
| performance_schema | setup_instruments                            |      0 |           0 |
| mysql              | func                                         |      0 |           0 |
| mysql              | host                                         |      0 |           0 |
| mysql              | time_zone_name                               |      0 |           0 |
| mysql              | user                                         |      0 |           0 |
| mysql              | slow_log                                     |      0 |           0 |
| performance_schema | file_instances                               |      0 |           0 |
| performance_schema | cond_instances                               |      0 |           0 |
| mysql              | plugin                                       |      0 |           0 |
| mysql              | proc                                         |      0 |           0 |
| test01             | staffs                                       |      0 |           0 |
| bigdata            | emp                                          |      0 |           0 |
| performance_schema | rwlock_instances                             |      0 |           0 |
| mysql              | time_zone_leap_second                        |      0 |           0 |
| mysql              | event                                        |      0 |           0 |
| mysql              | columns_priv                                 |      0 |           0 |
| test01             | tab_dept                                     |      0 |           0 |
| performance_schema | threads                                      |      0 |           0 |
| mysql              | general_log                                  |      0 |           0 |
| performance_schema | events_waits_summary_by_thread_by_event_name |      0 |           0 |
| performance_schema | file_summary_by_event_name                   |      0 |           0 |
| test01             | user                                         |      0 |           0 |
| performance_schema | file_summary_by_instance                     |      0 |           0 |
| bigdata            | dept                                         |      0 |           0 |
| mysql              | servers                                      |      0 |           0 |
| mysql              | db                                           |      0 |           0 |
| test01             | tblA                                         |      0 |           0 |
| performance_schema | performance_timers                           |      0 |           0 |
| mysql              | time_zone_transition                         |      0 |           0 |
| performance_schema | mutex_instances                              |      0 |           0 |
| performance_schema | events_waits_current                         |      0 |           0 |
| mysql              | tables_priv                                  |      0 |           0 |
| mysql              | procs_priv                                   |      0 |           0 |
| mysql              | time_zone                                    |      0 |           0 |
| performance_schema | events_waits_history                         |      0 |           0 |
| performance_schema | setup_timers                                 |      0 |           0 |
+--------------------+----------------------------------------------+--------+-------------+
44 rows in set (0.09 sec)

mysql> show tables;
+------------------+
| Tables_in_test01 |
+------------------+
| mylock           |
| staffs           |
| tab_dept         |
| tab_emp          |
| tblA             |
| user             |
+------------------+
6 rows in set (0.01 sec)

mysql> # lock table mylock read,mylock write;
mysql> lock table mylock read;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from mylock;
+----+------+
| id | name |
+----+------+
|  1 | a    |
|  2 | b    |
|  3 | c    |
|  4 | d    |
|  5 | e    |
+----+------+
5 rows in set (0.00 sec)

mysql> update mylock set name='a2' where id=1;
ERROR 1099 (HY000): Table 'mylock' was locked with a READ lock and can't be updated
mysql> select * from user;
ERROR 1100 (HY000): Table 'user' was not locked with LOCK TABLES
mysql> unlock tables;
Query OK, 0 rows affected (0.05 sec)

mysql> # 加写锁
mysql> unlock tables;
Query OK, 0 rows affected (0.00 sec)

mysql> lock table mylock write;
Query OK, 0 rows affected (0.07 sec)

mysql> select * from mylock;
+----+------+
| id | name |
+----+------+
|  1 | a1   |
|  2 | b    |
|  3 | c    |
|  4 | d    |
|  5 | e    |
+----+------+
5 rows in set (0.01 sec)

mysql> update mylock set name='a2' where id=1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from user;
ERROR 1100 (HY000): Table 'user' was not locked with LOCK TABLES
mysql> # 不能读其他的表
mysql> unlock tables;
Query OK, 0 rows affected (0.00 sec)

mysql> # 加写锁,当前session1可以读写,其他session阻塞
mysql> # 加读锁,不会阻塞其他进程对同一表的
mysql> # 读请求,但会阻塞对同一表的写请求,只有当读锁释放后,才会执行其他进程的写请求
mysql> # # 即读锁会阻塞写,但是不会阻塞读,写锁会阻塞读和写
mysql> myisam
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'myisam' at line 1
mysql> # myisam
mysql> # 表锁分析
mysql> show status like 'table%';
+-----------------------+--------+
| Variable_name         | Value  |
+-----------------------+--------+
| Table_locks_immediate | 501262 |
| Table_locks_waited    | 1      |
+-----------------------+--------+
2 rows in set (0.07 sec)

mysql> # myisam 的读写锁是写优先,这也是myisam不适合做写为主表的引擎,因为写锁后,其他线程不能做任何操作,大量的更新会使查询很难得到锁,从而造成永久阻塞
mysql> # table_locks_waited偏高指存在较高的锁竞争的情况
mysql> # 表锁(偏读)
mysql> #行锁
mysql> # 偏向于innodb存储引擎,开销大,会出现死锁,锁定粒度小,发生锁冲突的概率最低,并发度也高
mysql> # myisam与innodb的不同,1 支持事务,2 支持行锁
mysql> # 事务,Transaction acid
mysql> # 原子性,事务是原子操作单元,要么全部执行,要么都不执行,一致性,在事务开始和结束,数据 都必须保持一致,
mysql> # 隔离性,数据库系统提供一定的隔离机制,保证事务在不受外部并发操作的影响独立执行,即事务在执行过程中都是对外不可见的
mysql> # 持久性,即数据的修改时永久性的,即使出现故障也能够保持
mysql> # 更新丢失,即事务更新覆盖
mysql> # 脏读,事务a读到了事务b已更新但是未提交的数据,# 不可重复读,事务a读取到事务b的已经提交的修改数据,不符合隔离性
mysql> # 幻读 事务a读取到事务b提交的新增数据,不符合隔离性,脏读是事务
mysql> # b修改了数据,幻读是事务b增加了数据.
mysql> show variables like 'tx_isolation';
+---------------+-----------------+
| Variable_name | Value           |
+---------------+-----------------+
| tx_isolation  | REPEATABLE-READ |
+---------------+-----------------+
1 row in set (0.09 sec)

mysql> # myslq
mysql> # mysql的默认隔离级别是可重复读
mysql> create table test_innodb_lock(a int(11),b varchar(16))engine=innodb;
Query OK, 0 rows affected (0.26 sec)

mysql> alter table test_innodb_lock modify column a int(11) not null unsigned primary key auto_increment;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unsigned primary key auto_increment' at line 1
mysql> alter table test_innodb_lock modify column a int(11)  unsigned primary key auto_increment;
Query OK, 0 rows affected (0.22 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into test_innodb_lock(b)values('b2'),('4000'),('3434'),('3232'),('2324'),('545');
Query OK, 6 rows affected (0.05 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> alter table test_innodb_lock modify column a int(11);
Query OK, 6 rows affected (0.11 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from test_innodb_lock ;
+---+------+
| a | b    |
+---+------+
| 1 | b2   |
| 2 | 4000 |
| 3 | 3434 |
| 4 | 3232 |
| 5 | 2324 |
| 6 | 545  |
+---+------+
6 rows in set (0.00 sec)

mysql> create index idx_test_innodb_lock_a on test_innodb_lock(a);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create index idx_test_innodb_lock_b on test_innodb_lock(b);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> # 行表锁
mysql> set autocommit=0;
Query OK, 0 rows affected (0.06 sec)

mysql> update test_innodb_lock set b='4001' where a=1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from test_innodb_lock ;
+---+------+
| a | b    |
+---+------+
| 5 | 2324 |
| 4 | 3232 |
| 3 | 3434 |
| 2 | 4000 |
| 1 | 4001 |
| 6 | 545  |
+---+------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

mysql> # 索引失效导致行锁变表锁
mysql> #间隙锁
mysql> # 当我们用范围条件检索数据,并请求共享或排他锁时,innodb会给符合条件的索引项加锁,对于键值在条件范围内但并不存在的记录,叫做间隙(gap)
mysql> # 如何锁定一行
mysql> begin;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from test_innodb_lock where id=6 for update;
ERROR 1054 (42S22): Unknown column 'id' in 'where clause'
mysql> select * from test_innodb_lock where a=6 for update;
+---+------+
| a | b    |
+---+------+
| 6 | 545  |
+---+------+
1 row in set (0.05 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from test_innodb_lock;
+---+------+
| a | b    |
+---+------+
| 5 | 2324 |
| 4 | 3232 |
| 3 | 3434 |
| 2 | 4000 |
| 1 | 4001 |
| 6 | xxx  |
+---+------+
6 rows in set (0.00 sec)

mysql> # 行锁总结  行锁性能监控,行锁损耗更高一些,但是在整体并发处理能力方面远远优于myisam表锁
mysql> # 缺点,当我们使用不当的时候,会使行锁变表锁.即索引失效会导致行锁变表锁
mysql> # 行锁监控: 
mysql> show variables like 'innodb_roe_lock%';
Empty set (0.00 sec)

mysql> show variables like 'innodb_row_lock%';
Empty set (0.00 sec)

mysql> show status like 'innodb_row_lock%';
+-------------------------------+-------+
| Variable_name                 | Value |
+-------------------------------+-------+
| Innodb_row_lock_current_waits | 0     |
| Innodb_row_lock_time          | 11925 |
| Innodb_row_lock_time_avg      | 11925 |
| Innodb_row_lock_time_max      | 11925 |
| Innodb_row_lock_waits         | 1     |
+-------------------------------+-------+
5 rows in set (0.00 sec)

mysql> # 1 当前正在等待锁定的数量,4 系统启动到现在总共等待的次数
mysql> # 1 当前正在等待锁定的数量,5 系统启动到现在总共等待的次数
mysql> 比较重要的是: innodb_row_lock_time_avg 等待平均时间,innodb_row_lock_waits 等待总次数,innodb_row_lock_time 等待总时长; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '比较重要的是: innodb_row_lock_time_avg 等待平均时间,innodb_row_lock_' at line 1
mysql> # 比较重要的是: innodb_row_lock_time_avg 等待平均时间,innodb_row_lock_waits 等待总次数,innodb_row_lock_time 等待总时长; 
mysql> 建议: 尽可能通过索引查数据,避免无索引行锁升级为表锁
    -> \c
mysql> # 建议: 尽可能通过索引查数据,避免无索引行锁升级为表锁 
mysql> # 合理设计索引,尽量缩小锁的范围
mysql> # 尽可能减少检索条件,避免间隙锁
mysql> # 控制事务大小,减少锁定资源和时间长度
mysql> # 低级别事务隔离
mysql> # 页锁
mysql> # 主从复制
mysql> #mysql主从复制
mysql> # 一堆配置
mysql> exit
mysql> # 插入50万数据的sql
mysql> use test01;
Database changed
mysql> show procedure status;
+---------+-------------+-----------+---------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db      | Name        | Type      | Definer | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+---------+-------------+-----------+---------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| bigdata | insert_dept | PROCEDURE | root@%  | 2019-10-20 12:01:01 | 2019-10-20 12:01:01 | DEFINER       |         | utf8                 | utf8_general_ci      | utf8_general_ci    |
| bigdata | insert_emp  | PROCEDURE | root@%  | 2019-10-20 11:58:06 | 2019-10-20 11:58:06 | DEFINER       |         | utf8                 | utf8_general_ci      | utf8_general_ci    |
+---------+-------------+-----------+---------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
2 rows in set (0.05 sec)

mysql> show procedure proc_name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'proc_name' at line 1
mysql> show create procedure proc_name;
ERROR 1305 (42000): PROCEDURE proc_name does not exist
mysql> show create procedure insert_dept;
ERROR 1305 (42000): PROCEDURE insert_dept does not exist
mysql> use bigdata;
Database changed
mysql> show create procedure insert_dept;
+-------------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| Procedure   | sql_mode | Create Procedure                                                                                                                                                                                                                                                                                            | character_set_client | collation_connection | Database Collation |
+-------------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| insert_dept |          | CREATE DEFINER=`root`@`%` PROCEDURE `insert_dept`(in START int(10),IN max_num INT(10))
BEGIN
	DECLARE i int DEFAULT 0;
	set autocommit=0;
	REPEAT
		set i =i+1;
		insert into dept(deptno,dname,loc) VALUES ((START+i),rand_string(10),rand_string(6));
	UNTIL i=max_num
	end REPEAT;
	COMMIT;
END | utf8                 | utf8_general_ci      | utf8_general_ci    |
+-------------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
1 row in set (0.05 sec)

mysql> show create procedure insert_emp
    -> ;
+------------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| Procedure  | sql_mode | Create Procedure                                                                                                                                                                                                                                                                                                                                                    | character_set_client | collation_connection | Database Collation |
+------------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| insert_emp |          | CREATE DEFINER=`root`@`%` PROCEDURE `insert_emp`(IN START int(10),IN max_num INT(10))
BEGIN
	DECLARE i int DEFAULT 0;
	set autocommit=0;
	REPEAT
		set i =i+1;
		insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) VALUES ((START+i),rand_string(6),'salesman',0001,CURDATE(),2000,400,rand_num());
	UNTIL i=max_num
	end REPEAT;
	COMMIT;
END | utf8                 | utf8_general_ci      | utf8_general_ci    |
+------------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
1 row in set (0.00 sec)

mysql> show create function;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> show function status
    -> ;
+---------+-------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db      | Name        | Type     | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+---------+-------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| bigdata | rand_num    | FUNCTION | root@localhost | 2019-10-20 11:46:28 | 2019-10-20 11:46:28 | DEFINER       |         | utf8                 | utf8_general_ci      | utf8_general_ci    |
| bigdata | rand_string | FUNCTION | root@%         | 2019-10-20 11:34:39 | 2019-10-20 11:34:39 | DEFINER       |         | utf8                 | utf8_general_ci      | utf8_general_ci    |
+---------+-------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
2 rows in set (0.00 sec)

mysql> show create function rand_num;
+----------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| Function | sql_mode | Create Function                                                                                                                                  | character_set_client | collation_connection | Database Collation |
+----------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| rand_num |          | CREATE DEFINER=`root`@`localhost` FUNCTION `rand_num`() RETURNS int(5)
BEGIN
DECLARE i int default 0;
set i =FLOOR(100+RAND()*10);
RETURN i;
END | utf8                 | utf8_general_ci      | utf8_general_ci    |
+----------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
1 row in set (0.00 sec)

mysql> show create function rand_string;
+-------------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| Function    | sql_mode | Create Function                                                                                                                                                                                                                                                                                                                                                                                                                 | character_set_client | collation_connection | Database Collation |
+-------------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| rand_string |          | CREATE DEFINER=`root`@`%` FUNCTION `rand_string`(n int) RETURNS varchar(255) CHARSET utf8
BEGIN
	DECLARE chars_str VARCHAR(100) default 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
	DECLARE return_str VARCHAR(255) default '';
	DECLARE i int DEFAULT 0;
	WHILE i<n DO
		set return_str=CONCAT(return_str,SUBSTRING(chars_str,FLOOR(1+RAND()*52),1));
		set i=i+1;
		END WHILE;
		RETURN return_str;
END | utf8                 | utf8_general_ci      | utf8_general_ci    |
+-------------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
1 row in set (0.00 sec)

mysql> show create table dept;
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                                  |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| dept  | CREATE TABLE `dept` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deptno` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dname` varchar(20) NOT NULL DEFAULT '',
  `loc` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> show create table emp;
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| emp   | CREATE TABLE `emp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empno` varchar(20) NOT NULL DEFAULT '',
  `ename` varchar(20) NOT NULL DEFAULT '',
  `job` varchar(9) NOT NULL DEFAULT '',
  `mgr` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hiredate` date NOT NULL,
  `sal` decimal(7,2) NOT NULL,
  `comm` decimal(7,2) NOT NULL,
  `deptno` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=500001 DEFAULT CHARSET=utf8 |
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> exit
