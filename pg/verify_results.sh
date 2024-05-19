#!/bin/bash

for i in {01..22}; do
    if [ -f "$1/tpch/Q$i.out" ] && [ -f "$1/ssb2/Q$i.out" ]; then
        sed  '/Time: .*$/d' $1/tpch/Q$i.out > /tmp/Q$i.out.tpch
	sed  '/Time: .*$/d' $1/ssb2/Q$i.out > /tmp/Q$i.out.ssb2
	if diff "/tmp/Q$i.out.tpch" "/tmp/Q$i.out.ssb2" >/dev/null; then
		echo "Files are identical"
	else
		echo "Files are different"
		diff /tmp/Q$i.out.tpch /tmp/Q$i.out.ssb2 > /tmp/Q$i.diff
	fi
    fi
done

