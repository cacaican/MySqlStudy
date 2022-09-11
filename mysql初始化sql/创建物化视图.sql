/*参考文档：
https://help.aliyun.com/document_detail/200653.html#:~:text=%E9%BB%98%E8%AE%A4%E6%83%85%E5%86%B5%E4%B8%8B%EF%BC%8C%E4%B8%80%E4%B8%AA%20AnalyticDB%20MySQL%E7%89%88%20%E9%9B%86%E7%BE%A4%E6%94%AF%E6%8C%81%E5%88%9B%E5%BB%BA%E7%9A%84%E7%89%A9%E5%8C%96%E8%A7%86%E5%9B%BE%E4%B8%8A%E9%99%90%E5%A6%82%E4%B8%8B%EF%BC%9A%20%E9%9B%86%E7%BE%A4%E7%89%88%E6%9C%AC%E5%B0%8F%E4%BA%8E3.1.4.7%EF%BC%9A%E6%9C%80%E5%A4%9A%E6%94%AF%E6%8C%81%E5%88%9B%E5%BB%BA8%E4%B8%AA%E7%89%A9%E5%8C%96%E8%A7%86%E5%9B%BE%E3%80%82,%E9%9B%86%E7%BE%A4%E7%89%88%E6%9C%AC%E7%AD%89%E4%BA%8E%E6%88%96%E5%A4%A7%E4%BA%8E3.1.4.7%EF%BC%9A%E6%9C%80%E5%A4%9A%E6%94%AF%E6%8C%81%E5%88%9B%E5%BB%BA64%E4%B8%AA%E7%89%A9%E5%8C%96%E8%A7%86%E5%9B%BE%E3%80%82%20%E8%AF%B4%E6%98%8E%20%E8%8B%A5%E6%82%A8%E9%9C%80%E8%A6%81%E5%88%9B%E5%BB%BA%E6%9B%B4%E5%A4%9A%E7%89%A9%E5%8C%96%E8%A7%86%E5%9B%BE%EF%BC%8C%E8%AF%B7%20%E6%8F%90%E4%BA%A4%E5%B7%A5%E5%8D%95%20%E8%81%94%E7%B3%BB%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81%E3%80%82
*/
#5.0版本没有物化视图，只有视图
# 每五分钟刷新一次
CREATE MATERIALIZED VIEW myview
REFRESH NEXT now() + interval 5 minute
AS
SELECT count(*) as cnt FROM customer;

# 每周一晚上2点刷新
CREATE MATERIALIZED VIEW myview
REFRESH
 START WITH DATE_FORMAT(now() + interval 7 - weekday(now()) day, '%Y-%m-%d 02:00:00')
 NEXT DATE_FORMAT(now() + interval 7 - weekday(now()) day, '%Y-%m-%d 02:00:00')
AS
SELECT count(*) as cnt FROM base;

# 每天凌晨2点刷新
CREATE MATERIALIZED VIEW myview
REFRESH
 START WITH DATE_FORMAT(now() + interval 1 day, '%Y-%m-%d 02:00:00')
 NEXT DATE_FORMAT(now() + interval 1 day, '%Y-%m-%d 02:00:00')
AS
SELECT count(*) as cnt FROM base;

# 每个月第一天凌晨2点刷新
CREATE MATERIALIZED VIEW myview
REFRESH NEXT DATE_FORMAT(last_day(now()) + interval 1 day, '%Y-%m-%d 02:00:00')
AS
SELECT count(*) as cnt FROM base;

# 只刷一次
CREATE MATERIALIZED VIEW myview
REFRESH START WITH now() + interval 1 day
AS
SELECT count(*) as cnt FROM base;

# 不自动刷新，完全依靠手动刷新
CREATE MATERIALIZED VIEW myview (
  PRIMARY KEY (id)
) DISTRIBUTED BY HASH (id)
AS
SELECT id, name FROM base;

# 指定列建立索引，默认全部列建立索引
CREATE MATERIALIZED VIEW myview (
  INDEX (name),
  PRIMARY KEY (id)
) DISTRIBUTED BY HASH (id)
AS
SELECT id, name, age FROM base;

# 指定分区键和注释
CREATE MATERIALIZED VIEW c (
  name varchar(10),
  value double,
  KEY INDEX_ID(id) COMMENT 'id',
  CLUSTERED KEY INDEX(name, value),
  PRIMARY KEY(id)
)
DISTRIBUTED BY hash(id)
PARTITION BY value(date_format(dat, "%Y%m%d")) LIFECYCLE 30
COMMENT 'MATERIALIZED VIEW c'
AS
SELECT * FROM base;

