-- 单参数用法

/* 查询前5条数据 */
SELECT * FROM Student LIMIT 5;

-- 双参数用法
-- 当指定两个参数时，需要注意偏移量的取值是从0开始的，此时可以有两种写法：

/* 查询第1-10条数据 */
SELECT * FROM Student LIMIT 0,10;
/* 查询第11-20条数据 */
SELECT * FROM Student LIMIT 10 OFFSET 10;

/*2. 分页公式
总页数计算
在进行分页之前，我们需要先根据数据总量来得出总页数，这需要用到COUNT函数和向上取整函数CEIL，SQL如下：*/

/* 获得数据总条数 */
SELECT COUNT(*) FROM Student;
/* 假设每页显示10条，则直接进行除法运算，然后向上取整 */
SELECT CEIL(COUNT(*) / 10) AS pageTotal FROM Student;
/*复制
核心信息
当前页：pageNumber
每页数据量：pageSize
在实际操作中，我们能够得到的信息有当前所在页以及每页的数据量，同时要注意一下是否超出了最大页数。以每页10条为例，则前三页的数据应为：

第1页：第1~10条，SQL写法：LIMIT 0,10
第2页：第11~20条，SQL写法：LIMIT 10,10
第3页：第21~30条，SQL写法：LIMIT 20,10
据此我们可以总结出，LIMIT所需要的两个参数计算公式如下：

offset：(pageNumber - 1) * pageSize
rows：pageSize*/