#!/bin/bash

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=$BENCH
fi


if ! [ -f $DATA_DIR/mysql/starbench/ins-sel.sql ]; then
   echo "No ins-sel.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database starbench"
mysql -h 127.0.0.1 -P 4000 -u root < $DATA_DIR/tidb/starbench/drop_db.sql

echo "Creating the database starbench"
mysql -h 127.0.0.1 -P 4000 -u root < $DATA_DIR/tidb/starbench/create_db.sql

echo "Creating the starbench tables"
mysql -h 127.0.0.1 -P 4000 -u root -D  starbench < $DATA_DIR/tidb/starbench/tables.sql

echo "loading the data into starbench tables"
mysql -h 127.0.0.1 -P 4000 -u root < $DATA_DIR/tidb/starbench/ins-sel.sql

echo "creating index for starbench tables"
mysql -h 127.0.0.1 -P 4000 -u root < $DATA_DIR/tidb/starbench/create-idx.sql
