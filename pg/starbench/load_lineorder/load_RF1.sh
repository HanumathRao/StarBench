#!/bin/bash
/usr/local/pgsql/bin/psql postgres < tpch_RF1.ddl > ct_RF1.out 2>&1
echo "\copy starbench_temp.lineitem_rf1 from '/home/vboxuser/contribs/tpch/tpch-dbgen/dump/lineitem.tbl.u1' delimiter '|';" > load_lineitem_RF1.sql
/usr/local/pgsql/bin/psql postgres < load_lineitem_RF1.sql > load_lineitem_RF1.out 2>&1
rm load_lineitem_RF1.sql
echo "\copy starbench_temp.orders_rf1 from '/home/vboxuser/contribs/tpch/tpch-dbgen/dump/orders.tbl.u1' delimiter '|';" > load_orders_RF1.sql
/usr/local/pgsql/bin/psql postgres < load_orders_RF1.sql > load_orders_RF1.out 2>&1
rm load_orders_RF1.sql
echo "\copy starbench_temp.delete_1 from '/home/vboxuser/contribs/tpch/tpch-dbgen/dump/delete.1' delimiter '|';" > load_delete1.sql
/usr/local/pgsql/bin/psql postgres < load_delete1.sql > load_delete1.out 2>&1
rm load_delete1.sql
