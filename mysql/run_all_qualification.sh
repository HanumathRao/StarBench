#!/bin/bash
((i=1))
while ((i<=22))
do
./qgen -s 1 -d ${i} > QUERIES/Q${i}.sql
mysql --host=localhost --user=ssb_user --password=AB-cd-12-# --database=ssb < QUERIES/Q${i}.sql > OUT/Q${i}.out 2>&1
sleep 10
((i++))
done
