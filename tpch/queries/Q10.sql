/* Query 10 - Var_0 Rev_01 - TPC-H/TPC-R Returned Item Reporting Query */
/* Return the first 20 selected rows                                   */
SELECT /* dss_10.sql */
        C_CUSTKEY,
        C_NAME,
        CAST(SUM(LO_EXTENDEDPRICE*(1-LO_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE,
        C_ACCTBAL,
        C_NATION,
        C_ADDRESS,
        C_PHONE 
FROM 
        CUSTOMER,
        LINEORDER
WHERE
        C_CUSTKEY = LO_CUSTKEY
        AND LO_ORDERDATE >= '1993-10-01'
        AND LO_ORDERDATE < DATE '1993-10-01' + INTERVAL '3' MONTH
        AND LO_RETURNFLAG = 'R'
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

