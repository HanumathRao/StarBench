-- using default substitutions
/* Query 09 - Var_0 Rev_01 - TPC-H/TPC-R Product Type Profit Measure Query */
\timing
SELECT
        N_NAME  AS NATION,
        EXTRACT(YEAR FROM O_ORDERDATE) AS L_YEAR,
        CAST(SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)-PS_SUPPLYCOST*L_QUANTITY) AS DECIMAL(18,2)) AS SUM_PROFIT
FROM
        tpch.PART,
        tpch.SUPPLIER,
        tpch.LINEITEM,
        tpch.PARTSUPP,
        tpch.ORDERS,
        tpch.NATION
WHERE
        S_SUPPKEY = L_SUPPKEY
        AND PS_SUPPKEY = L_SUPPKEY
        AND PS_PARTKEY = L_PARTKEY
        AND P_PARTKEY = L_PARTKEY
        AND O_ORDERKEY = L_ORDERKEY
        AND S_NATIONKEY = N_NATIONKEY
        AND P_NAME LIKE '%green%'
GROUP BY
        NATION,
        L_YEAR
ORDER BY
        NATION,
        L_YEAR DESC;
\timing
