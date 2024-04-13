-- using 1472396759 as a seed to the RNG
\timing

select
	o_orderpriority,
	count(*) as order_count
from
	tpch.orders
where
	o_orderdate >= date '1996-03-01'
	and o_orderdate < date '1996-03-01' + interval '3' month
	and exists (
		select
			*
		from
			tpch.lineitem
		where
			l_orderkey = o_orderkey
			and l_commitdate < l_receiptdate
	)
group by
	o_orderpriority
order by
	o_orderpriority
limit 1;

\timing
