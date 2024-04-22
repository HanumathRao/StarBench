SET search_path TO tpch;
truncate table nation;
\set localpath `pwd`'/tpch/data/2g/nation.csv'
COPY tpch.nation FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.region;
\set localpath `pwd`'/tpch/data/2g/region.csv'
COPY tpch.region FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.part;
\set localpath `pwd`'/tpch/data/2g/part.csv'
COPY tpch.part FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.supplier;
\set localpath `pwd`'/tpch/data/2g/supplier.csv'
COPY tpch.supplier FROM :'localpath' HEADER DELIMITER '|';
truncate table tpch.partsupp;
\set localpath `pwd`'/tpch/data/2g/partsupp.csv'
COPY tpch.partsupp FROM :'localpath'  CSV HEADER DELIMITER '|';
truncate table tpch.customer;
\set localpath `pwd`'/tpch/data/2g/customer.csv'
COPY tpch.customer FROM :'localpath'  CSV HEADER DELIMITER '|';
truncate table tpch.orders;
\set localpath `pwd`'/tpch/data/2g/orders.csv'
COPY tpch.orders FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.lineitem;
\set localpath `pwd`'/tpch/data/2g/lineitem.csv'
COPY tpch.lineitem FROM :'localpath' CSV HEADER DELIMITER '|';
