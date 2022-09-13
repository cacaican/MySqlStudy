-- oracle事务隔离级别查看方法
-- oracle比较麻烦点，执行以下语句
-- 1）：让当前session处于一个事务中
declare
trans_id Varchar2(100);
begin
trans_id := dbms_transaction.local_transaction_id( TRUE );
end;
-- 2）：查询隔离级别
SELECT s.sid, s.serial#,CASE BITAND(t.flag, POWER(2, 28))
WHEN 0 THEN 'READ COMMITTED'
ELSE 'SERIALIZABLE' END AS isolation_level
FROM v$transaction t
JOIN v$session s ON t.addr = s.taddr AND s.sid = sys_context('USERENV', 'SID');