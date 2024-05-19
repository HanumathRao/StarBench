#!/bin/bash

declare

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=`pwd`
fi

# check if the tuner dir contains the tpch queries and tpch data to load.
if ! [ -d $DATA_DIR/tpch ]; then
   echo "Invalid DATA_DIR:$DATA_DIR as it doesn't contain data or tpch-queries directory"
   exit 0
fi

if ![ -f /etc/init.d/tidb* ]; then
    echo "tidb is not installed or configured; please install and configure."
    exit 0
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
mysql --comments --host 127.0.0.1 --port 4000 -u root --database=tpch < $DATA_DIR/tidb/tpch/load.sql

