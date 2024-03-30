#!/bin/bash
# this script runs a specific query for qualification 
((q=$1))
echo "q is ${q}"
./qgen -s 1 -d ${q} > QUERIES/Q${q}.sql
mysql --host=localhost --user=ssb_user --password=AB-cd-12-# --database=ssb < QUERIES/Q${q}.sql > OUT/Q${q}.out 2>&1
