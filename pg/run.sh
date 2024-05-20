#!/bin/bash

rm -rf $BENCH/pg/tpch/OUT/*
rm -rf $BENCH/pg/ssb/OUT/*
mkdir -p $BENCH/pg/ssb/OUT
mkdir -p $BENCH/pg/tpch/OUT

# run tpch queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
        start=`date +%s.%N`
	psql postgres < $BENCH/pg/tpch/queries/Q${i}.sql &> $BENCH/pg/tpch/OUT/Q${i}.out
        end=`date +%s.%N`
        runtime=$( echo "$end - $start" | bc -l )
        echo "$runtime" > $BENCH/pg/tpch/OUT/Q${i}.timing
done

# run ssb queries
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
do
        start=`date +%s.%N`
	psql postgres < $BENCH/pg/ssb/queries/Q${i}.sql &> $BENCH/pg/ssb/OUT/Q${i}.out
        end=`date +%s.%N`
        runtime=$( echo "$end - $start" | bc -l )
        echo "$runtime" > $BENCH/pg/ssb/OUT/Q${i}.timing
done

