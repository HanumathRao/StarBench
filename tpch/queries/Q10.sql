-- using default substitutions
/* Query 10 - Var_0 Rev_01 - TPC-H/TPC-R Returned Item Reporting Query */
\timing
SELECT
        C_CUSTKEY,
        C_NAME,
        CAST(SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE,
        C_ACCTBAL,
        N_NAME,
        C_ADDRESS,
        C_PHONE, 
        C_COMMENT
FROM 
        tpch.CUSTOMER,
        tpch.ORDERS,
        tpch.LINEITEM,
        tpch.NATION
WHERE
        C_CUSTKEY = O_CUSTKEY
        AND L_ORDERKEY = O_ORDERKEY
        AND O_ORDERDATE >= '1993-10-01'
        AND O_ORDERDATE < DATE '1993-10-01' + INTERVAL '3' MONTH
        AND L_RETURNFLAG = 'R'
        AND C_NATIONKEY = N_NATIONKEY
GROUP BY 
        C_CUSTKEY,
        C_NAME,
        C_ACCTBAL,
        C_PHONE,
        N_NAME,
        C_ADDRESS,
        C_COMMENT
ORDER BY 
        REVENUE DESC
LIMIT 20;
\timing
