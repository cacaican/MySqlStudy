
MySQL 数值型函数
函数名称	作 用
ABS	求绝对值
SQRT	求二次方根
MOD	求余数
CEIL 和 CEILING	两个函数功能相同，都是返回不小于参数的最小整数，即向上取整
FLOOR	向下取整，返回值转化为一个BIGINT
RAND	生成一个0~1之间的随机数，传入整数参数是，用来产生重复序列
ROUND	对所传参数进行四舍五入
SIGN	返回参数的符号
POW 和 POWER	两个函数的功能相同，都是所传参数的次方的结果值
SIN	求正弦值
ASIN	求反正弦值，与函数 SIN 互为反函数
COS	求余弦值
ACOS	求反余弦值，与函数 COS 互为反函数
TAN	求正切值
ATAN	求反正切值，与函数 TAN 互为反函数
COT	求余切值


MySQL 字符串函数
函数名称	作 用
LENGTH	计算字符串长度函数，返回字符串的字节长度
CONCAT	合并字符串函数，返回结果为连接参数产生的字符串，参数可以使一个或多个
INSERT	替换字符串函数
LOWER	将字符串中的字母转换为小写
UPPER	将字符串中的字母转换为大写
LEFT	从左侧字截取符串，返回字符串左边的若干个字符
RIGHT	从右侧字截取符串，返回字符串右边的若干个字符
TRIM	删除字符串左右两侧的空格
REPLACE	字符串替换函数，返回替换后的新字符串
SUBSTRING	截取字符串，返回从指定位置开始的指定长度的字符换
REVERSE	字符串反转（逆序）函数，返回与原始字符串顺序相反的字符串

MySQL 日期和时间函数
函数名称	作 用
CURDATE 和 CURRENT_DATE	两个函数作用相同，返回当前系统的日期值
CURTIME 和 CURRENT_TIME	两个函数作用相同，返回当前系统的时间值
NOW 和  SYSDATE	两个函数作用相同，返回当前系统的日期和时间值
UNIX_TIMESTAMP	获取UNIX时间戳函数，返回一个以 UNIX 时间戳为基础的无符号整数
FROM_UNIXTIME	将 UNIX 时间戳转换为时间格式，与UNIX_TIMESTAMP互为反函数
MONTH	获取指定日期中的月份
MONTHNAME	获取指定日期中的月份英文名称
DAYNAME	获取指定曰期对应的星期几的英文名称
DAYOFWEEK	获取指定日期对应的一周的索引位置值
WEEK	获取指定日期是一年中的第几周，返回值的范围是否为 0〜52 或 1〜53
DAYOFYEAR	获取指定曰期是一年中的第几天，返回值范围是1~366
DAYOFMONTH	获取指定日期是一个月中是第几天，返回值范围是1~31
YEAR	获取年份，返回值范围是 1970〜2069
TIME_TO_SEC	将时间参数转换为秒数
SEC_TO_TIME	将秒数转换为时间，与TIME_TO_SEC 互为反函数
DATE_ADD 和 ADDDATE	两个函数功能相同，都是向日期添加指定的时间间隔
DATE_SUB 和 SUBDATE	两个函数功能相同，都是向日期减去指定的时间间隔
ADDTIME	时间加法运算，在原始时间上添加指定的时间
SUBTIME	时间减法运算，在原始时间上减去指定的时间
DATEDIFF	获取两个日期之间间隔，返回参数 1 减去参数 2 的值
DATE_FORMAT	格式化指定的日期，根据参数返回指定格式的值
WEEKDAY	获取指定日期在一周内的对应的工作日索引


MySQL 聚合函数
函数名称	作用
MAX	查询指定列的最大值
MIN	查询指定列的最小值
COUNT	统计查询结果的行数
SUM	求和，返回指定列的总和
AVG	求平均值，返回指定列数据的平均值


MySQL 流程控制函数
函数名称	作用
IF	判断，流程控制
IFNULL	判断是否为空
CASE	搜索语句

类型转换函数
SELECT str_to_date('01,5,2013','%d,%m,%Y');
SELECT str_to_date('a09:30:17','a%h:%i:%s');
SELECT str_to_date('09:30:17a','%h:%i:%s');
SELECT time_format('22:23:01', '%H.%i.%s');
SELECT date_format('2009-10-04 22:23:00', '%W %M %Y');

