LOAD DATA LOCAL INFILE '/home/vboxuser/contribs/tpch/tpch-v3.0.1/dbgen/1g/customer.tbl' INTO TABLE CUSTOMER FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE '/home/vboxuser/contribs/tpch/tpch-v3.0.1/dbgen/1g/orders.tbl' INTO TABLE ORDERS FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE '/home/vboxuser/contribs/tpch/tpch-v3.0.1/dbgen/1g/lineitem.tbl' INTO TABLE LINEITEM FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE '/home/vboxuser/contribs/tpch/tpch-v3.0.1/dbgen/1g/nation.tbl' INTO TABLE NATION FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE '/home/vboxuser/contribs/tpch/tpch-v3.0.1/dbgen/1g/partsupp.tbl' INTO TABLE PARTSUPP FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE '/home/vboxuser/contribs/tpch/tpch-v3.0.1/dbgen/1g/part.tbl' INTO TABLE PART FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE '/home/vboxuser/contribs/tpch/tpch-v3.0.1/dbgen/1g/region.tbl' INTO TABLE REGION FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE '/home/vboxuser/contribs/tpch/tpch-v3.0.1/dbgen/1g/supplier.tbl' INTO TABLE SUPPLIER FIELDS TERMINATED BY '|';
