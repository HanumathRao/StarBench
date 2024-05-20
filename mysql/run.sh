#!/bin/bash

rm -rf $BENCH/mysql/tpch/OUT/*
rm -rf $BENCH/mysql/ssb/OUT/*
mkdir -p $BENCH/mysql/tpch/OUT
mkdir -p $BENCH/mysql/ssb/OUT

echo "executing the mysql tpch and ssb queries...."

# run tpch queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
	start=`date +%s.%N`
	mysql --local-infile=1 -u root --database=tpch < $BENCH/mysql/tpch/queries/Q${i}.sql > $BENCH/mysql/tpch/OUT/Q${i}.out 2>&1
	end=`date +%s.%N`
	runtime=$( echo "$end - $start" | bc -l ) 
	echo "$runtime" > $BENCH/mysql/tpch/OUT/Q${i}.timing
done

# run ssb queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
	start=`date +%s.%N`
	mysql --local-infile=1 -u root --database=ssb2 < $BENCH/mysql/ssb/queries/Q${i}.sql > $BENCH/mysql/ssb/OUT/Q${i}.out 2>&1
	end=`date +%s.%N`
	runtime=$( echo "$end - $start" | bc -l ) 
	echo "$runtime" > $BENCH/mysql/ssb/OUT/Q${i}.timing
done


./parse_timings.sh $BENCH/mysql
