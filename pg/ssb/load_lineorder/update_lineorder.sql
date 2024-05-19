insert into ssb2_temp.lineorder select * from ssb2_temp.lineorder_rf1;

select count(*) from ssb2_temp.lineorder;

delete from ssb2_temp.lineorder where lo_orderkey in (select orderkey from ssb2_temp.delete_1);
