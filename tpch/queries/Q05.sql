-- using default substitutions
/* Query 05 - Var_0 Rev_01 - TPC-H/TPC-R Local Supplier Volume Query */
\timing
SELECT
        N_NAME,
        CAST(SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM 
        tpch.CUSTOMER,
        tpch.ORDERS,
        tpch.LINEITEM,
        tpch.SUPPLIER,
        tpch.NATION,
        tpch.REGION
WHERE
        C_CUSTKEY = O_CUSTKEY
        AND L_ORDERKEY = O_ORDERKEY
        AND L_SUPPKEY = S_SUPPKEY
        AND C_NATIONKEY = S_NATIONKEY
        AND S_NATIONKEY = N_NATIONKEY
        AND N_REGIONKEY = R_REGIONKEY
        AND R_NAME = 'ASIA'
        AND O_ORDERDATE >= '1994-01-01'
        AND O_ORDERDATE < DATE '1994-01-01' + INTERVAL '1' YEAR
GROUP BY
        N_NAME
ORDER BY
        REVENUE DESC;
\timing
