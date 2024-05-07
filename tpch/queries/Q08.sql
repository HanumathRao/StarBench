-- using default substitutions
/* Query 08 - Var_0 Rev_01 - TPC-H/TPC-R National Market Share Query */
\timing
SELECT
        EXTRACT(YEAR FROM O_ORDERDATE) AS L_YEAR,
        SUM(CASE
                WHEN N2.N_NAME = 'BRAZIL' 
                THEN L_EXTENDEDPRICE*(1-L_DISCOUNT)
                ELSE 0
        END) / SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)) AS MKT_SHARE
FROM 
        tpch.PART,
        tpch.SUPPLIER,
        tpch.LINEITEM,
        tpch.ORDERS,
        tpch.CUSTOMER,
        tpch.NATION N1,
        tpch.NATION N2,
        tpch.REGION
WHERE
        P_PARTKEY = L_PARTKEY
        AND S_SUPPKEY = L_SUPPKEY
        AND L_ORDERKEY = O_ORDERKEY
        AND O_CUSTKEY = C_CUSTKEY
        AND C_NATIONKEY = N1.N_NATIONKEY
        AND N1.N_REGIONKEY = R_REGIONKEY
        AND R_NAME = 'AMERICA'
        AND S_NATIONKEY = N2.N_NATIONKEY
        AND O_ORDERDATE BETWEEN '1995-01-01' AND '1996-12-31'
        AND P_TYPE = 'ECONOMY ANODIZED STEEL'
GROUP BY
        L_YEAR
ORDER BY
        L_YEAR;
\timing
