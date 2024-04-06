#!/bin/bash

declare

if [ -n $PORT ]; then
   PORT=5432
fi

if [ -n $DATA_DIR ]; then
   echo "DATA_DIR is not, so defaulting to current dir `pwd`"
   DATA_DIR=`pwd`
fi

# check if the tuner dir contains the tpch queries and tpch data to load.
if ! [ -d $DATA_DIR/tpch ]; then
   echo "Invalid DATA_DIR:$DATA_DIR as it doesn't contain data or tpch-queries directory"
   exit 0
fi

if ! [ -f /usr/local/pgsql/bin/psql ]; then
   echo "Postgres sql is not installed or configured; please install and configure"
   exit 0
fi

if ! [ -f $DATA_DIR/tpch/tables.sql ]; then
   echo "No schema.sql file exists under $DATA_DIR"
   exit 0
fi


if ! [ -f $DATA_DIR/tpch/load.sql ]; then
   echo "No load.sql file exists under $DATA_DIR"
   exit 0
fi

echo "Dropping the database tpch"
/usr/local/pgsql/bin/psql postgres < $DATA_DIR/tpch/drop_db.sql

echo "Creating the database tpch"
/usr/local/pgsql/bin/psql postgres < $DATA_DIR/tpch/create_db.sql

echo "Creating the tpch tables"
/usr/local/pgsql/bin/psql tpch < $DATA_DIR/tpch/tables.sql

#pre process the load.sql to use the right directory in the load
ESC_DATA_DIR=$(printf '%s\n' "$DATA_DIR" | sed -e 's/[\/&]/\\&/g' | sed 's/\./\\./g')
sed "s/<DATA_DIR>/$ESC_DATA_DIR/g" $DATA_DIR/tpch/load.sql > /tmp/load.sql


echo "loading the data into tpch tables"
/usr/local/pgsql/bin/psql tpch < /tmp/load.sql

