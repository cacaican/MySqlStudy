--�����ļ�

--���ӡ� ��������������������������������-++++++++
    alter tablespace USERS add datafile 'D:\DB\Oracle\oradata\orcl\temp002.DBF' SIZE 10M;
    --���������ļ���Ϊ�Զ�������ʽ
    alter tablespaces user add DATAFILE 'D:\DB\Oracle\oradata\orcl\temp003.DBF' size 10M autoextend on next 512k maxsize 50m;
    --û�����ֵ���ƿ�������Ϊunlimited
    alter tablespaces user add DATAFILE 'D:\DB\Oracle\oradata\orcl\temp003.DBF' size 10M autoextend on next 512k maxsize unlimited;
    --���������ļ��Ĺ���ģʽ���ѻ�/����״̬ 


--�鵵ģʽ�¸ı������ļ��Ŀ�����
      alter database datafile 'D:\DB\Oracle\oradata\orcl\temp002.DBF' offline;
      --ORA-01145: ���������˽��ʻָ�, �������������ѻ�
      alter database datafile 'D:\DB\Oracle\oradata\orcl\temp002.DBF' online;

--�ı������ļ���λ�ú�����
      --�����ļ���ͬһ����ռ���
      alter tablespaces rename datafile ... to ...
      --�����ļ��ڲ�ͬ��ռ���
       alter database rename file ... to ...



--�����ļ�


--������־�ļ�
