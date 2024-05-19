-- using default substitutions
/* Query 07 - Var_0 Rev_01 - TPC-H/TPC-R Volume Shipping Query  */ 
\timing
SELECT
        N1.N_NAME  AS SUPP_NATION,
        N2.N_NAME  AS CUST_NATION,
        EXTRACT(YEAR FROM L_SHIPDATE) AS L_YEAR,
        CAST(SUM(L_EXTENDEDPRICE * (1-L_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM 
        tpch.SUPPLIER,
        tpch.LINEITEM,
        tpch.ORDERS,
        tpch.CUSTOMER,
        tpch.NATION N1,
        tpch.NATION N2
WHERE
        S_SUPPKEY  = L_SUPPKEY
        AND O_ORDERKEY = L_ORDERKEY
        AND C_CUSTKEY = O_CUSTKEY
        AND S_NATIONKEY = N1.N_NATIONKEY
        AND C_NATIONKEY = N2.N_NATIONKEY
        AND (
                (N1.N_NAME = 'FRANCE' AND N2.N_NAME = 'GERMANY')
                OR (N1.N_NAME = 'GERMANY' AND N2.N_NAME = 'FRANCE')
        )
        AND  L_SHIPDATE BETWEEN '1995-01-01' AND '1996-12-31'
GROUP BY
        SUPP_NATION,
        CUST_NATION,
        L_YEAR
ORDER BY
        SUPP_NATION,
        CUST_NATION,
        L_YEAR;
\timing
