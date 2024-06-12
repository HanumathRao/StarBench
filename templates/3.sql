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
        C_MKTSEGMENT      = ':1'
        AND C_CUSTKEY     = OD_CUSTKEY
        AND OD_ORDERDATE  < ':2'
        AND OD_SHIPDATE   > ':2'
GROUP BY
        OD_ORDERKEY,
        OD_ORDERDATE,
        OD_SHIPPRIORITY
ORDER BY
        REVENUE DESC,
        OD_ORDERDATE
LIMIT 10;
