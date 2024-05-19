#!/bin/bash

if [ -n $PORT ]; then
   PORT=5432
fi

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=$BENCH
fi

if ! [ -f /usr/local/pgsql/bin/psql ]; then
   echo "Postgres sql is not installed or configured; please install and configure"
   exit 0
fi

if ! [ -f $DATA_DIR/pg/tpch/tables.sql ]; then
   echo "No schema.sql file exists under $DATA_DIR"
   exit 0
fi


if ! [ -f $DATA_DIR/pg/ssb/ins-sel.sql ]; then
   echo "No ins-sel.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database tpch"
/usr/local/pgsql/bin/psql postgres < $DATA_DIR/pg/ssb/drop_db.sql

echo "Creating the database tpch"
/usr/local/pgsql/bin/psql postgres < $DATA_DIR/pg/ssb/create_db.sql

echo "Creating the tpch tables"
/usr/local/pgsql/bin/psql postgres < $DATA_DIR/pg/ssb/tables.sql


echo "loading the data into tpch tables"
/usr/local/pgsql/bin/psql postgres < $DATA_DIR/pg/ssb/ins-sel.sql

