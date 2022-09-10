
select * from Cms_product_info;

select * from CMS_PRODUCT_INFO ;
select * from CMS_PRODUCT_INFO  where productcode ='P2806003';



select * from CMS_PRODUCT_INFO info
where info.coreproductcode is  not null
   and length(coreproductcode)=8
    and productname like '%一路有你%'
;
select distinct coreproductcode  from CMS_PRODUCT_INFO info
where info.coreproductcode is  not null
   and length(coreproductcode)=8
    and productname like '%一路有你%'
;

---------------------------------------------
select *
from users;
insert into users (id, name, skin, height, birthday, sal)
values (1234, 'xiaocai', 'black', 198.8, to_date('2020-09-27 05:20:59', 'yyyy-MM-dd HH:mi:ss'), 5464);

