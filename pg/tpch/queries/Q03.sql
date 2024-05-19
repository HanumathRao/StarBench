-- using default substitutions
/* Query 03 - Var_0 Rev_01 - TPC-H/TPC-R Shipping Priority Query      */
\timing
SELECT
        L_ORDERKEY,
        CAST(SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE,
        O_ORDERDATE,
        O_SHIPPRIORITY
FROM  
        tpch.CUSTOMER,
        tpch.ORDERS,
        tpch.LINEITEM
WHERE
        C_MKTSEGMENT  = 'BUILDING'
        AND C_CUSTKEY    = O_CUSTKEY
        AND L_ORDERKEY   = O_ORDERKEY
        AND O_ORDERDATE  < '1995-03-15'
        AND L_SHIPDATE   > '1995-03-15'
GROUP BY
        L_ORDERKEY,
        O_ORDERDATE,
        O_SHIPPRIORITY
ORDER BY
        REVENUE DESC,
        O_ORDERDATE
LIMIT 10;
\timing
