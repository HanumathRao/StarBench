#!/bin/bash

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=$BENCH
fi


if ! [ -f $DATA_DIR/mysql/ssb/ins-sel.sql ]; then
   echo "No ins-sel.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database ssb"
mysql -h 127.0.0.1 -P 4000 -u root < $DATA_DIR/tidb/ssb/drop_db.sql

echo "Creating the database ssb"
mysql -h 127.0.0.1 -P 4000 -u root < $DATA_DIR/tidb/ssb/create_db.sql

echo "Creating the ssb tables"
mysql -h 127.0.0.1 -P 4000 -u root -D  ssb < $DATA_DIR/tidb/ssb/tables.sql

echo "loading the data into ssb tables"
mysql -h 127.0.0.1 -P 4000 -u root < $DATA_DIR/tidb/ssb/ins-sel.sql
