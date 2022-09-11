--数据文件

--增加· ················-++++++++
    alter tablespace USERS add datafile 'D:\DB\Oracle\oradata\orcl\temp002.DBF' SIZE 10M;
    --设置数据文件的为自动增长方式
    alter tablespaces user add DATAFILE 'D:\DB\Oracle\oradata\orcl\temp003.DBF' size 10M autoextend on next 512k maxsize 50m;
    --没有最大值限制可以设其为unlimited
    alter tablespaces user add DATAFILE 'D:\DB\Oracle\oradata\orcl\temp003.DBF' size 10M autoextend on next 512k maxsize unlimited;
    --设置数据文件的工作模式：脱机/联机状态 


--归档模式下改变数据文件的可用性
      alter database datafile 'D:\DB\Oracle\oradata\orcl\temp002.DBF' offline;
      --ORA-01145: 除非启用了介质恢复, 否则不允许立即脱机
      alter database datafile 'D:\DB\Oracle\oradata\orcl\temp002.DBF' online;

--改变数据文件的位置和名称
      --数据文件在同一个表空间中
      alter tablespaces rename datafile ... to ...
      --数据文件在不同表空间中
       alter database rename file ... to ...



--控制文件


--重做日志文件
