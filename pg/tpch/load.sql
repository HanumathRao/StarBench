SET search_path TO tpch;
truncate table nation;
\set localfile '/home/vboxuser/contribs/tpch/tpch-dbgen/1g/nation.csv'
COPY tpch.nation FROM :'localfile' CSV HEADER DELIMITER '|';

truncate table tpch.region;
\set localfile '/home/vboxuser/contribs/tpch/tpch-dbgen/1g/region.csv'
COPY tpch.region FROM :'localfile' CSV HEADER DELIMITER '|';

truncate table tpch.part;
\set localfile '/home/vboxuser/contribs/tpch/tpch-dbgen/1g/part.csv'
COPY tpch.part FROM :'localfile' CSV HEADER DELIMITER '|';

truncate table tpch.supplier;
\set localfile '/home/vboxuser/contribs/tpch/tpch-dbgen/1g/supplier.csv'
COPY tpch.supplier FROM :'localfile' HEADER DELIMITER '|';

truncate table tpch.partsupp;
\set localfile '/home/vboxuser/contribs/tpch/tpch-dbgen/1g/partsupp.csv'
COPY tpch.partsupp FROM :'localfile'  CSV HEADER DELIMITER '|';

truncate table tpch.customer;
\set localfile '/home/vboxuser/contribs/tpch/tpch-dbgen/1g/customer.csv'
COPY tpch.customer FROM :'localfile'  CSV HEADER DELIMITER '|';

truncate table tpch.orders;
\set localfile '/home/vboxuser/contribs/tpch/tpch-dbgen/1g/orders.csv'
COPY tpch.orders FROM :'localfile' CSV HEADER DELIMITER '|';

truncate table tpch.lineitem;
\set localfile '/home/vboxuser/contribs/tpch/tpch-dbgen/1g/lineitem.csv'
COPY tpch.lineitem FROM :'localfile' CSV HEADER DELIMITER '|';
