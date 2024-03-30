/* Query 03 - Var_0 Rev_01 - SSBench TPC-H Shipping Priority Query      */
/* Return the first 10 selected rows                                    */
SELECT /* dss_03.sql */
        LO_ORDERKEY,
        CAST(SUM(LO_EXTENDEDPRICE*(1-LO_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE,
        LO_ORDERDATE,
        LO_SHIPPRIORITY
FROM  
        CUSTOMER,
        LINEORDER
WHERE
        C_MKTSEGMENT      = ':1'
        AND C_CUSTKEY     = LO_CUSTKEY
        AND LO_ORDERDATE  < ':2'
        AND LO_SHIPDATE   > ':2'
GROUP BY
        LO_ORDERKEY,
        LO_ORDERDATE,
        LO_SHIPPRIORITY
ORDER BY
        REVENUE DESC,
        LO_ORDERDATE
LIMIT 10;
