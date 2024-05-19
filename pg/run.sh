#!/bin/bash

rm -rf $BENCH/pg/tpch/OUT/*.out
rm -rf $BENCH/pg/ssb/OUT/*.out

# run tpch queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
	/usr/local/pgsql/bin/psql postgres < $BENCH/pg/tpch/queries/Q${i}.sql &> $BENCH/pg/tpch/OUT/Q${i}.out
done

# run ssb queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
	/usr/local/pgsql/bin/psql postgres < $BENCH/pg/ssb/queries/Q${i}.sql &> $BENCH/pg/ssb/OUT/Q${i}.out
done



$BENCH/pg/parse_timings.sh $BENCH/pg
