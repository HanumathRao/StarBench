-- using 1472396759 as a seed to the RNG
\timing

select
	sum(l_extendedprice * l_discount) as revenue
from
	tpch.lineitem
where
	l_shipdate >= date '1995-01-01'
	and l_shipdate < date '1995-01-01' + interval '1' year
	and l_discount between 0.09 - 0.01 and 0.09 + 0.01
	and l_quantity < 24
limit 1;

\timing
