-- using default substitutions
/* Query 17 - Var_0 Rev_01 - TPC-H/TPC-R Small-Quantity-Order Revenue Query */
\timing
WITH   /* dss_17.sql */
T1(PARTKEY, QUANTITY) AS (
SELECT
	L_PARTKEY,
        0.2 * AVG(L_QUANTITY)
FROM 
	tpch.LINEITEM
GROUP BY 1
)
SELECT
        CAST(SUM(L_EXTENDEDPRICE) / 7.0 AS DECIMAL(18,2)) AS AVG_YEARLY
FROM
        T1,
        tpch.PART,
        tpch.LINEITEM
WHERE
        P_PARTKEY = L_PARTKEY
        AND T1.PARTKEY = P_PARTKEY
        AND P_BRAND = 'Brand#23'
        AND P_CONTAINER = 'MED BOX'
        AND L_QUANTITY < T1.QUANTITY;
\timing
