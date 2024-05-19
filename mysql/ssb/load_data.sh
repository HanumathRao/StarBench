#!/bin/bash

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=$BENCH
fi

if ! [ -f /etc/init.d/mysql* ]; then
    echo "mysql is not installed or configured; please install and configure."
    exit 0
fi


if ! [ -f $DATA_DIR/mysql/ssb/ins-sel.sql ]; then
   echo "No ins-sel.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database ssb"
mysql --local-infile=1 -u root < $DATA_DIR/mysql/ssb/drop_db.sql

echo "Creating the database ssb"
mysql --local-infile=1 -u root < $DATA_DIR/mysql/ssb/create_db.sql

echo "Creating the ssb tables"
mysql --local-infile=1 -u root --database=ssb < $DATA_DIR/mysql/ssb/tables.sql


echo "loading the data into ssb tables"
mysql --local-infile=1 -u root < $DATA_DIR/mysql/ssb/ins-sel.sql

