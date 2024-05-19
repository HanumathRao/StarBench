#!/bin/bash

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=`pwd`
fi


if ! [ -f $DATA_DIR/tidb/tpch/tables.sql ]; then
   echo "No tables.sql file exists under $DATA_DIR"
   exit 0
fi


if ! [ -f $DATA_DIR/tidb/tpch/load.sql ]; then
   echo "No load.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database tpch"
mysql --comments --host 127.0.0.1 --port 4000 -u root < $DATA_DIR/tidb/tpch/drop_db.sql

echo "Creating the database tpch"
mysql --comments --host 127.0.0.1 --port 4000 -u root  < $DATA_DIR/tidb/tpch/create_db.sql

echo "Creating the tpch tables"
mysql --comments --host 127.0.0.1 --port 4000 -u root --database=tpch < $DATA_DIR/tidb/tpch/tables.sql


echo "loading the data into tpch tables"
mysql --comments --local-infile=1 --host 127.0.0.1 --port 4000 -u root --database=tpch < $DATA_DIR/tidb/tpch/load.sql

