-- USING 12345 AS A SEED TO THE RNG
/* QUERY 10 - STARBENCH - RETURNED ITEM REPORTING QUERY */
/* RETURN THE FIRST 20 SELECTED ROWS                                   */
SELECT /* DSS_10.SQL */
        C_CUSTKEY,
        C_NAME,
        CAST(SUM(OD_EXTENDEDPRICE*(1-OD_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE,
        C_ACCTBAL,
        C_NATION,
        C_ADDRESS,
        C_PHONE 
FROM 
        CUSTOMER,
        ORDER_DETAIL
WHERE
        C_CUSTKEY = OD_CUSTKEY
        AND OD_ORDERDATE >= '1993-09-01'
        AND OD_ORDERDATE < DATE '1993-09-01' + INTERVAL '3' MONTH
        AND OD_RETURNFLAG = 'R'
GROUP BY 
        C_CUSTKEY,
        C_NAME,
        C_ACCTBAL,
        C_PHONE,
        C_NATION,
        C_ADDRESS
ORDER BY 
        REVENUE DESC
LIMIT 20;

