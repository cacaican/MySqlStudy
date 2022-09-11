# 查看建表语句
SHOW CREATE TABLE student \G;




# 另一种完整复制表的方法:
CREATE TABLE targetTable LIKE sourceTable;
INSERT INTO targetTable SELECT * FROM sourceTable;
# 其他:
# 可以拷贝一个表中其中的一些字段:
CREATE TABLE newadmin AS
(
    SELECT username, password FROM admin
)
# 可以将新建的表的字段改名:
CREATE TABLE newadmin AS
(
    SELECT id, username AS uname, password AS pass FROM admin
)
# 可以拷贝一部分数据:
CREATE TABLE newadmin AS
(
    SELECT * FROM admin WHERE LEFT(username,1) = 's'
)
# 可以在创建表的同时定义表中的字段信息:
CREATE TABLE newadmin
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
)
AS
(
    SELECT * FROM admin
)