#!/bin/bash

if [ -n $PORT ]; then
   PORT=5432
fi

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=$BENCH
fi

if ! [ -f $DATA_DIR/pg/tpch/tables.sql ]; then
   echo "No schema.sql file exists under $DATA_DIR"
   exit 0
fi


if ! [ -f $DATA_DIR/pg/tpch/load.sql ]; then
   echo "No load.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database tpch"
psql postgres < $DATA_DIR/pg/tpch/drop_db.sql

echo "Creating the database tpch"
psql postgres < $DATA_DIR/pg/tpch/create_db.sql

echo "Creating the tpch tables"
psql postgres < $DATA_DIR/pg/tpch/tables.sql


echo "loading the data into tpch tables"
psql postgres < $DATA_DIR/pg/tpch/load.sql

