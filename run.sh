#!/bin/bash

export BENCH=$(pwd)

# Check if two parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <load> <pg | mysql | tidb>"
    exit 1
fi

# Extract parameters
load="$1"
db_type="$2"

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
      echo "Usage: $0 [-l]"
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Check if the database type is valid
if [ "$db_type" != "pg" ] && [ "$db_type" != "mysql" ] && [ "$db_type" != "tidb" ]; then
    echo "Invalid database type. Usage: $0 <load> <pg | mysql | tidb>"
    exit 1
fi

# Run the appropriate script based on the database type
if [ "$db_type" == "pg" ]; then
    if [ "$has_l_flag" = true ]; then
        ./pg/tpch/load_data.sh
    fi
    ./pg/run.sh
elif [ "$db_type" == "mysql" ]; then
    if [ "$has_l_flag" = true ]; then
        ./mysql/tpch/load_data.sh
    fi
    ./mysql/run.sh
elif [ "$db_type" == "tidb" ]; then
    if [ "$has_l_flag" = true ]; then
        ./mysql/tpch/load_data.sh
    fi
    ./mysql/run.sh
fi


