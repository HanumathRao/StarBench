#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Check if the directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory $1 does not exist."
    exit 1
fi

printf "%-10s \t %-10s \t %-10s\n" "Query" "tpch_timing(ms)" "ssb_timing(ms)"
printf "%s\n" "----------------|----------------|-------------------"
for i in {01..22}; do
    if [ -f "$1/tpch/OUT/Q$i.timing" ] && [ -f "$1/ssb/OUT/Q$i.timing" ]; then
	tpch_timing=`cat $1/tpch/OUT/Q$i.timing`
	ssb2_timing=`cat $1/ssb/OUT/Q$i.timing`
	tpch_timing_rounded=`echo $tpch_timing | awk '{print int($1*1000)}'`
	ssb2_timing_rounded=`echo $ssb2_timing | awk '{print int($1*1000)}'`
        printf "Q%-14s \t %-12s \t %-10s\n" "$i" "$tpch_timing_rounded" "$ssb2_timing_rounded"
    fi
done
