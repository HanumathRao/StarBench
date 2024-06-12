/* Query 10 - StarBench - Returned Item Reporting Query */
/* Return the first 20 selected rows                                   */
SELECT
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
        AND OD_ORDERDATE >= ':1'
        AND OD_ORDERDATE < DATE ':1' + INTERVAL '3' MONTH
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

