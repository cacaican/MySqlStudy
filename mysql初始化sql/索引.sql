
-- 创建索引
CREATE INDEX indexName ON table_name (column_name)
-- 修改表结构(添加索引)
ALTER table tableName ADD INDEX indexName(columnName)
-- 创建表的时候直接指定
CREATE TABLE mytable(
ID INT NOT NULL,
username VARCHAR(16) NOT NULL,
INDEX [indexName] (username(length))
);
-- 删除索引的语法
DROP INDEX [indexName] ON mytable;
ALTER TABLE testalter_tbl DROP PRIMARY KEY;
-- :该语句指定了索引为 FULLTEXT ，用于全文索引。
ALTER TABLE tbl_name ADD FULLTEXT index_name (column_list)

-- 查询索引
SHOW INDEX FROM table_name