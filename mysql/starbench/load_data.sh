#!/bin/bash

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=$BENCH
fi

if ! [ -f /etc/init.d/mysql* ]; then
    echo "mysql is not installed or configured; please install and configure."
    exit 0
fi


if ! [ -f $DATA_DIR/mysql/starbench/ins-sel.sql ]; then
   echo "No ins-sel.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database starbench"
mysql --local-infile=1 -u root < $DATA_DIR/mysql/starbench/drop_db.sql

echo "Creating the database starbench"
mysql --local-infile=1 -u root < $DATA_DIR/mysql/starbench/create_db.sql

echo "Creating the starbench tables"
mysql --local-infile=1 -u root --database=starbench < $DATA_DIR/mysql/starbench/tables.sql


echo "loading the data into starbench tables"
mysql --local-infile=1 -u root < $DATA_DIR/mysql/starbench/ins-sel.sql

