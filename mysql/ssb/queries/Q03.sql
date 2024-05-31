-- using 12345 as a seed to the RNG
/* Query 03 - StarBench - Shipping Priority Query      */
/* Return the first 10 selected rows                                    */
SELECT
        OD_ORDERKEY,
        CAST(SUM(OD_EXTENDEDPRICE*(1-OD_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE,
        OD_ORDERDATE,
        OD_SHIPPRIORITY
FROM  
        CUSTOMER,
        ORDER_DETAIL
WHERE
        C_MKTSEGMENT      = 'AUTOMOBILE'
        AND C_CUSTKEY     = OD_CUSTKEY
        AND OD_ORDERDATE  < '1995-03-01'
        AND OD_SHIPDATE   > '1995-03-01'
GROUP BY
        OD_ORDERKEY,
        OD_ORDERDATE,
        OD_SHIPPRIORITY
ORDER BY
        REVENUE DESC,
        OD_ORDERDATE
LIMIT 10;
