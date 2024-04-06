SET search_path TO tpch;
truncate table nation;
\set localpath `pwd`'/tpch/data/nation.csv'
COPY nation FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.region;
\set localpath `pwd`'/tpch/data/region.csv'
COPY tpch.region FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.part;
\set localpath `pwd`'/tpch/data/part.csv'
COPY tpch.part FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.supplier;
\set localpath `pwd`'/tpch/data/supplier.csv'
COPY tpch.supplier FROM :'localpath' HEADER DELIMITER '|';
truncate table tpch.partsupp;
\set localpath `pwd`'/tpch/data/partsupp.csv'
COPY tpch.partsupp FROM :'localpath'  CSV HEADER DELIMITER '|';
truncate table tpch.customer;
\set localpath `pwd`'/tpch/data/customer.csv'
COPY tpch.customer FROM :'localpath'  CSV HEADER DELIMITER '|';
truncate table tpch.orders;
\set localpath `pwd`'/tpch/data/orders.csv'
COPY tpch.orders FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.lineitem;
\set localpath `pwd`'/tpch/data/lineitem.csv'
COPY tpch.lineitem FROM :'localpath' CSV HEADER DELIMITER '|';
