#!/bin/bash

rm -rf $BENCH/tidb/tpch/OUT/*.out
rm -rf $BENCH/tidb/ssb/OUT/*.out

echo "executing the tidb tpch and ssb queries...."

# run tpch queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
	start=`date +%s.%N`
	mysql --comments --host 127.0.0.1 --port 4000 -u root --database=tpch --local-infile=1 < $BENCH/tidb/tpch/queries/Q${i}.sql > $BENCH/tidb/tpch/OUT/Q${i}.out 2>&1
	end=`date +%s.%N`
	runtime=$( echo "$end - $start" | bc -l ) 
	echo "query execution time=$runtime" > $BENCH/tidb/tpch/OUT/Q${i}.timing
done

# run ssb queries
#for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
#do
#	/usr/local/pgsql/bin/psql postgres < $BENCH/pg/ssb/queries/Q${i}.sql &> $BENCH/pg/ssb/OUT/Q${i}.out
#done



#./parse_timings.sh $BENCH/pg
