select * from dual;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Xc123456';
# 创建数据库
create database test;

#创建用户
create user 'testUser'@'localhost' identified with mysql_native_password by 'Tu123456';
#用户授权
GRANT ALL PRIVILEGES ON *.* TO 'testUser'@'localhost';
# 刷新权限：
FLUSH PRIVILEGES;

# mysql查看所有用户
SELECT   * FROM   mysql.user;
select user,authentication_string,host from mysql.user;
# 查看所有表
# SHOW TABLES
# 查看表中所有字段
# SHOW COLUMNS FROM 数据表
#查看表中索引
# SHOW INDEX FROM 数据表

# 创建表
create table books
(
	book_id int(5) primary key	auto_increment,
	title varchar(200),
	category varchar(100)
);
INSERT INTO `books` (`book_id`, `title`, `category`) VALUES
	(1, '123', 'qwe'),
	(2, '456', 'asd'),
	(3, '789', 'zxc');

select * from  books;

create table  car
(
    id int(20) primary key auto_increment,
    brand varchar(225) ,
    color varchar(225) ,
    seats int(5) ,
    price numeric(18,2) ,
    createDate timestamp(6) default CURRENT_TIMESTAMP(6)
);
select * from Car;
alter table car modify  column createDate datetime (6)   not null default CURRENT_TIMESTAMP  ;


create table  driver
(
    id int(20) primary key auto_increment,
    car_id int(20),
    name varchar(225) ,
    license varchar(225) ,
    createDate timestamp(6)
);
alter table driver add column car_id int(20) comment '车辆id';
alter table driver add column car_brand varchar(225) comment '车辆品牌';

select * from driver;
select * from driver  d join car c
            on d.car_brand=c.brand
        where d.name ='xiaocai'


