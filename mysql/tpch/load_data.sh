#!/bin/bash

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=$BENCH
fi

if ![ -f /etc/init.d/mysql* ]; then
    echo "mysql is not installed or configured; please install and configure."
    exit 0
fi


if ! [ -f $DATA_DIR/mysql/tpch/tables.sql ]; then
   echo "No tables.sql file exists under $DATA_DIR"
   exit 0
fi


if ! [ -f $DATA_DIR/mysql/tpch/load.sql ]; then
   echo "No load.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database tpch"
mysql --local-infile=1 -u root < $DATA_DIR/mysql/tpch/drop_db.sql

echo "Creating the database tpch"
mysql --local-infile=1 -u root < $DATA_DIR/mysql/tpch/create_db.sql

echo "Creating the tpch tables"
mysql --local-infile=1 -u root --database=tpch < $DATA_DIR/mysql/tpch/tables.sql


echo "loading the data into tpch tables"
mysql --local-infile=1 -u root --database=tpch < $DATA_DIR/mysql/tpch/load.sql

