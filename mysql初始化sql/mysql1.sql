
set password= password('Xiaocai123456');
show databases ;
create database test;
use test;

create table student (
    name varchar(50) ,
    sex varchar(50)
);
show tables;

CREATE USER  'testUser'@'%'  IDENTIFIED BY  'Tu123456';
# drop user 'testUser'@'host' 删除用户语句
# user_name：要创建用户的名字。
# host：表示要这个新创建的用户允许从哪台机登陆，如果只允许从本机登陆，则 填　'localhost' ，如果允许从远程登陆，则填 '%'
# password：新创建用户的登陆数据库密码，如果没密码可以不写。
# CREATE USER  'aaa'@'localhost' IDENTIFED BY '123456'；         //表示创建的新用户，名为aaa，这个新用户密码为123456，只允许本机登陆
# CREATE USER  'bbb'@'%' IDENTIFED BY '123456'；//表示新创建的用户，名为bbb，这个用户密码为123456，可以从其他电脑远程登陆mysql所在服务器
# CREATE USER  'ccc'@'%' ；//表示新创建的用户ccc，没有密码，可以从其他电脑远程登陆mysql服务器
# 查看用户列表：
select * from mysql.user;
GRANT ALL ON  test.*  TO  'testUser'@'%';
GRANT ALL ON  db1.*  TO  'testUser'@'%';

revoke ALL ON  test.*  FROM  'testUser'@'%';
FLUSH PRIVILEGES;
show grants for testUser;

REVOKE ALL PRIVILEGES ON database_name.* FROM 'user_name'@'host'; #取消权限
# 命令：GRANT privileges ON  databasename.tablename  TO  'username'@'host'
# privileges：表示要授予什么权力，例如可以有 select ， insert ，delete，update等，如果要授予全部权力，则填 ALL
# databasename.tablename：表示用户的权限能用在哪个库的哪个表中，如果想要用户的权限很作用于所有的数据库所有的表，则填 *.*，*是一个通配符，表示全部。
# 'username'@'host'：表示授权给哪个用户。
# 例：
# GRANT  select，insert  ON  zje.zje  TO 'aaa'@'%'；         //表示给用户aaa授权，让aaa能给zje库中的zje表 实行 insert 和 select。
# GRANT  ALL  ON  *.*  TO  'aaa'@'%'；//表示给用户aaa授权，让aaa能给所有库所有表实行所有的权力。
#


select * from student;
insert into student (name ,sex) value ('xiaocai','男');

# DELETE FROM test.student WHERE name LIKE 'xiaocai' ESCAPE '#' AND sex LIKE '男' ESCAPE '#'
#表示模糊匹配时候escape 中的字符后，通配符不再起作用，及#注释的内容不作为删除时的条件

alter table student comment '学生表';
# 添加主键
alter table student
	add id int not null comment '主键';
alter table student
	add constraint student_pk
		primary key (id);

# 查看表结构：
desc student;

select * from  car where brand like '%凤%';

















# ---mysql查询所有表和字段信息的方法：
# 1、根据库名获取所有表的信息
SELECT
    *
FROM
    information_schema.`TABLES`
WHERE
      #根据库名查询
    TABLE_SCHEMA like 'test'
and TABLE_NAME like  '%student%'
;

select * from information_schema.tables where table_schema = 'STUDENT';
# 2、根据库名获取所有表名称和表说明

SELECT
    TABLE_NAME,
    TABLE_COMMENT
FROM
    information_schema.`TABLES`
WHERE
    TABLE_SCHEMA = 'student';
# 3.3、根据库名获取所有的字段信息
SELECT
    TABLE_SCHEMA AS '库名',
    TABLE_NAME AS '表名',
    COLUMN_NAME AS '列名',
    ORDINAL_POSITION AS '列的排列顺序',
    COLUMN_DEFAULT AS '默认值',
    IS_NULLABLE AS '是否为空',
    DATA_TYPE AS '数据类型',
    CHARACTER_MAXIMUM_LENGTH AS '字符最大长度',
    NUMERIC_PRECISION AS '数值精度(最大位数)',
    NUMERIC_SCALE AS '小数精度',
    COLUMN_TYPE AS 列类型,
    COLUMN_KEY 'KEY',
    EXTRA AS '额外说明',
    COLUMN_COMMENT AS '注释'
FROM
    information_schema.`COLUMNS`
WHERE
    TABLE_SCHEMA = 'test'
ORDER BY
    TABLE_NAME,
    ORDINAL_POSITION;