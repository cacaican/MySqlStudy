
#创建存储过程\
# 1.准备数据
INSERT INTO test.student (name, sex, id) VALUES ('xiaocai', '男', 1);
INSERT INTO test.student (name, sex, id) VALUES ('xiaomei', '女', 2);
INSERT INTO test.customer (name, sex, id) VALUES ('xiaocai', '男', 1);
INSERT INTO test.customer (name, sex, id) VALUES ('xiaomei', '女', 2);

drop table customer;
drop table  student;
create database db1;
use db1;
create table student as select * from test.student;
create table customer  as select * from test.customer;
# create table student as select * from db1.student;
# create table customer  as select * from db1.customer;
DELETE FROM customer
   WHERE id = '1';
# 2.写过程体
#将语句的结束符号从分号;临时改为两个//(可以是自定义) 在datagrip中不好使
delimiter //　　
create procedure deleteCusById(IN  p_id int)
begin
    delete FROM customer   WHERE id = p_id;
end;
delimiter;
delimiter //　　
create procedure deleteStuById(IN  p_id int)
begin
    delete FROM student   WHERE id = p_id;
end;
delimiter;

#调用call sp_name[(传参)];
call deleteCusById(1);
call deleteStuById(1);
call deleteStuById(2);

