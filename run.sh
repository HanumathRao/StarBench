#!/bin/bash

export BENCH=$(pwd)

# Check if one or two parameters are provided
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <pg | mysql | tidb> [-l]"
    exit 1
fi

# Extract parameters
db_type="$1"
shift

# Initialize flag
has_l_flag=false

# Parse command line options
while getopts ":l" opt; do
  case ${opt} in
    l )
      # Set flag if -l is provided
      has_l_flag=true
      ;;
    \? )
      echo "Usage: $0 <pg | mysql | tidb> [-l]"
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Run the appropriate script based on the database type
if [ "$db_type" == "pg" ]; then
    if [ "$has_l_flag" = true ]; then
	echo "loading data for pg..."
        ./pg/tpch/load_data.sh
	./pg/ssb/load_data.sh
    fi
    echo "running queries for pg...."
    ./pg/run.sh
    ./parse_timings.sh ./pg
elif [ "$db_type" == "mysql" ]; then
    if [ "$has_l_flag" = true ]; then
        ./mysql/tpch/load_data.sh
	./mysql/ssb/load_data.sh
    fi
    ./mysql/run.sh
    ./parse_timings.sh ./mysql
elif [ "$db_type" == "tidb" ]; then
    if [ "$has_l_flag" = true ]; then
        ./tidb/tpch/load_data.sh
	./tidb/ssb/load_data.sh
    fi
    ./tidb/run.sh
    ./parse_timings.sh ./tidb
fi


