-- using default substitutions
/* Query 15 - Var_0 Rev_01 - TPC-H/TPC-R  Top Supplier Query */
\timing
WITH /* dss_15.sql */ REVENUE (SUPPLIER_NO, TOTAL_REVENUE) AS (
SELECT
	L_SUPPKEY,
        SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT))
FROM
        tpch.LINEITEM
WHERE
        L_SHIPDATE >= '1996-01-01'
        AND L_SHIPDATE < DATE '1996-01-01' + INTERVAL '3' MONTH
GROUP BY
        L_SUPPKEY
)
SELECT
        S_SUPPKEY,
        S_NAME,
        S_ADDRESS,
        S_PHONE,
        CAST(TOTAL_REVENUE AS DECIMAL(18,2))
FROM 
        tpch.SUPPLIER,
        REVENUE
WHERE
        S_SUPPKEY = SUPPLIER_NO
        AND TOTAL_REVENUE = (
                SELECT 
                        MAX(TOTAL_REVENUE)
                FROM 
                        REVENUE
        )
ORDER BY 
        S_SUPPKEY;
 
\timing
