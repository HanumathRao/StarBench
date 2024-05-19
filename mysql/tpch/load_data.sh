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

if ![ -f /etc/init.d/mysql* ]; then
    echo "mysql is not installed or configured; please install and configure."
    exit 0
fi


if ! [ -f $DATA_DIR/tpch/mysql/tables.sql ]; then
   echo "No tables.sql file exists under $DATA_DIR"
   exit 0
fi


if ! [ -f $DATA_DIR/tpch/mysql/load.sql ]; then
   echo "No load.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database tpch"
mysql root -p "changeme" < $DATA_DIR/tpch/mysql/drop_db.sql

echo "Creating the database tpch"
mysql root -p "changeme" < $DATA_DIR/tpch/mysql/create_db.sql

echo "Creating the tpch tables"
mysql tpch < $DATA_DIR/tpch/mysql/tables.sql


echo "loading the data into tpch tables"
myql tpch < $DATA_DIR/tpch/mysql/load.sql

