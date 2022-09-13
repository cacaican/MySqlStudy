-- 教程：https://www.yiibai.com/mysql/create-user.html
/*
在MySQL中，不仅可以指定谁可以连接到数据库服务器，还可以指定用户连接的主机。因此，MySQL中的用户帐号由用户名，以及使用@字符分隔的主机名组成。
例如，如果admin用户从localhost主机连接到MySQL数据库服务器，则用户帐户是书写形式是：admin@localhost，其中@符号是一个固定的分隔符//原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/mysql/create-user.html
*/
#创建用户
CREATE USER testUser IDENTIFIED BY "Xiaocai123456";
INSERT INTO mysql.user(Host, User,  authentication_string, ssl_cipher, x509_issuer, x509_subject) VALUES ('hostname', 'username', PASSWORD('password'), '', '', '');
#查看密码的哈希值
select Password("Xiaocai123456");
#删除用户
drop user testUser;
#修改用户名
RENAME USER <旧用户> TO <新用户>
#查看用户权限
SHOW GRANTS FOR 'username'@'hostname';
SHOW GRANTS FOR testUser;
###############################################################
# #用户授权
GRANT priv_type [(column_list)] ON database.table
TO user [IDENTIFIED BY [PASSWORD] 'password']
[, user[IDENTIFIED BY [PASSWORD] 'password']] ...
[WITH with_option [with_option]...]

priv_type 参数表示权限类型；
columns_list 参数表示权限作用于哪些列上，省略该参数时，表示作用于整个表；
database.table 用于指定权限的级别；
user 参数表示用户账户，由用户名和主机名构成，格式是“'username'@'hostname'”；
IDENTIFIED BY 参数用来为用户设置密码；
password 参数是用户的新密码。

#样例
grant select,insert,delete,drop,update,alter,references,create,index,SHOW VIEW
    on test.*
    to testUser
    identified by 'TestUser123456'
    with grant option ;
grant all
    on test.*
    to testUser
    identified by 'TestUser123456'
    with grant option ;
################
# #查看用户信息
select * from user;





