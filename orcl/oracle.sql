lock table EMP in row share mode nowait;                -- 行共享(RS)：共享表锁
lock table t in share update mode nowait;             -- 行共享(RS)：共享表锁
lock table t in row exclusive mode nowait;            -- 行专用(RX)：用于行的修改
lock table t in share mode nowait;                    -- 共享锁(S)：阻止其他DML操作
lock table t in share row exclusive mode nowait;      -- 共享行专用(SRX)：阻止其他事务操作
lock table t in exclusive mode nowait;                -- 专用(X)：独立访问使用

-- 试了lock table t in share row exclusive mode nowait;这条命令，执行完后，其它会话便无法对t表进行insert操作了。
-- 原文链接：https://blog.csdn.net/killvoon/article/details/46646583

SELECT * FROM v$lock;
SELECT * FROM v$sqlarea;
SELECT * FROM v$session;
SELECT * FROM v$process ;
SELECT * FROM v$locked_object;
SELECT * FROM all_objects;
SELECT * FROM v$session_wait;

--1.查出锁定object的session的信息以及被锁定的object名
SELECT l.session_id sid, s.serial# as serial#, l.locked_mode,l.oracle_username,
l.os_user_name,s.machine, s.terminal, o.object_name, s.logon_time
FROM v$locked_object l, all_objects o, v$session s
WHERE l.object_id = o.object_id
AND l.session_id = s.sid
ORDER BY sid, s.serial# ;

--2.查出锁定表的session的sid, serial#,os_user_name, machine name, terminal和执行的语句
--比上面那段多出sql_text和action
SELECT l.session_id sid, s.serial#, l.locked_mode, l.oracle_username, s.user#,
l.os_user_name,s.machine, s.terminal,a.sql_text, a.action
FROM v$sqlarea a,v$session s, v$locked_object l
WHERE l.session_id = s.sid
AND s.prev_sql_addr = a.address
ORDER BY sid, s.serial#;

--3.查出锁定表的sid, serial#,os_user_name, machine_name, terminal，锁的type,mode
SELECT s.sid, s.serial#, s.username, s.schemaname, s.osuser, s.process, s.machine,
s.terminal, s.logon_time, l.type
FROM v$session s, v$lock l
WHERE s.sid = l.sid
AND s.username IS NOT NULL
ORDER BY sid;
-- 原文链接：https://blog.csdn.net/weixin_32021519/article/details/112045799
--这个语句将查找到数据库中所有的DML语句产生的锁，还可以发现，
--任何DML语句其实产生了两个锁，一个是表锁，一个是行锁。