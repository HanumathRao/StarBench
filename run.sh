#!/bin/bash

export BENCH=`pwd`
# Check if a parameter is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 [pg | mysql | tidb]"
    exit 1
fi

# Check if the parameter is either pg or mysql
if [ "$1" != "pg" ] && [ "$1" != "mysql" ] && [ "$1" != "tidb" ]; then
    echo "Invalid parameter. Usage: $0 [pg | mysql | tidb]"
    exit 1
fi

# Run the appropriate script based on the parameter
if [ "$1" == "pg" ]; then
    ./pg/run.sh
elif [ "$1" == "mysql" ]; then
    ./mysql/run.sh
elif [ "$1" == "tidb" ]; then
    ./tidb/run.sh
fi


