#!/bin/bash

rm -rf $BENCH/tidb/tpch/OUT/*.out
rm -rf $BENCH/tidb/starbench/OUT/*.out
mkdir -p $BENCH/tidb/starbench/OUT
mkdir -p $BENCH/tidb/tpch/OUT

echo "executing the tidb tpch and starbench queries...."

# run tpch queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
	start=`date +%s.%N`
	mysql --comments --host 127.0.0.1 --port 4000 -u root --database=tpch --local-infile=1 < $BENCH/tidb/tpch/queries/Q${i}.sql > $BENCH/tidb/tpch/OUT/Q${i}.out 2>&1
	end=`date +%s.%N`
	runtime=$( echo "$end - $start" | bc -l ) 
	echo "$runtime" > $BENCH/tidb/tpch/OUT/Q${i}.timing
done

# run starbench queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
	start=`date +%s.%N`
	mysql --comments --host 127.0.0.1 --port 4000 -u root --database=starbench --local-infile=1 < $BENCH/tidb/starbench/queries/Q${i}.sql > $BENCH/tidb/starbench/OUT/Q${i}.out 2>&1
	end=`date +%s.%N`
	runtime=$( echo "$end - $start" | bc -l ) 
	echo "$runtime" > $BENCH/tidb/starbench/OUT/Q${i}.timing
done



./parse_timings.sh $BENCH/tidb
