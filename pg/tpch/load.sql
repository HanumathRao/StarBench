SET search_path TO tpch;
truncate table nation;
\set localpath `pwd`'/tpch/data/1g/nation.csv'
COPY tpch.nation FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.region;
\set localpath `pwd`'/tpch/data/1g/region.csv'
COPY tpch.region FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.part;
\set localpath `pwd`'/tpch/data/1g/part.csv'
COPY tpch.part FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.supplier;
\set localpath `pwd`'/tpch/data/1g/supplier.csv'
COPY tpch.supplier FROM :'localpath' HEADER DELIMITER '|';
truncate table tpch.partsupp;
\set localpath `pwd`'/tpch/data/1g/partsupp.csv'
COPY tpch.partsupp FROM :'localpath'  CSV HEADER DELIMITER '|';
truncate table tpch.customer;
\set localpath `pwd`'/tpch/data/1g/customer.csv'
COPY tpch.customer FROM :'localpath'  CSV HEADER DELIMITER '|';
truncate table tpch.orders;
\set localpath `pwd`'/tpch/data/1g/orders.csv'
COPY tpch.orders FROM :'localpath' CSV HEADER DELIMITER '|';
truncate table tpch.lineitem;
\set localpath `pwd`'/tpch/data/1g/lineitem.csv'
COPY tpch.lineitem FROM :'localpath' CSV HEADER DELIMITER '|';
