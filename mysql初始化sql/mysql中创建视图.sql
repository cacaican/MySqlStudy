/*oracle中的语法
create
            materialized view materialized_view_name
            never refresh
as
select *
from my_table;*/
create view countCustomer as
select count(*)
from customer;