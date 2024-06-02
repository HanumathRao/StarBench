insert into starbench_temp.lineorder select * from starbench_temp.lineorder_rf1;

select count(*) from starbench_temp.lineorder;

delete from starbench_temp.lineorder where lo_orderkey in (select orderkey from starbench_temp.delete_1);
