-- �̳̣�https://www.yiibai.com/mysql/create-user.html
/*
��MySQL�У���������ָ��˭�������ӵ����ݿ��������������ָ���û����ӵ���������ˣ�MySQL�е��û��ʺ����û������Լ�ʹ��@�ַ��ָ�����������ɡ�
���磬���admin�û���localhost�������ӵ�MySQL���ݿ�����������û��ʻ�����д��ʽ�ǣ�admin@localhost������@������һ���̶��ķָ���//ԭ�ĳ��ԡ��װٽ̡̳�����ҵת������ϵ���߻����Ȩ������ҵ�뱣��ԭ�����ӣ�https://www.yiibai.com/mysql/create-user.html
*/
#�����û�
CREATE USER testUser IDENTIFIED BY "Xiaocai123456";
INSERT INTO mysql.user(Host, User,  authentication_string, ssl_cipher, x509_issuer, x509_subject) VALUES ('hostname', 'username', PASSWORD('password'), '', '', '');
#�鿴����Ĺ�ϣֵ
select Password("Xiaocai123456");
#ɾ���û�
drop user testUser;
#�޸��û���
RENAME USER <���û�> TO <���û�>
#�鿴�û�Ȩ��
SHOW GRANTS FOR 'username'@'hostname';
SHOW GRANTS FOR testUser;
###############################################################
# #�û���Ȩ
GRANT priv_type [(column_list)] ON database.table
TO user [IDENTIFIED BY [PASSWORD] 'password']
[, user[IDENTIFIED BY [PASSWORD] 'password']] ...
[WITH with_option [with_option]...]

priv_type ������ʾȨ�����ͣ�
columns_list ������ʾȨ����������Щ���ϣ�ʡ�Ըò���ʱ����ʾ������������
database.table ����ָ��Ȩ�޵ļ���
user ������ʾ�û��˻������û��������������ɣ���ʽ�ǡ�'username'@'hostname'����
IDENTIFIED BY ��������Ϊ�û��������룻
password �������û��������롣

#����
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
# #�鿴�û���Ϣ
select * from user;





