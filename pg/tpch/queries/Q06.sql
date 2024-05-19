-- using default substitutions
/* Query 06 - Var_0 Rev_01 - TPC-H/TPC-R Forecasting Revenue Change Query */
\timing
SELECT
        CAST(SUM(L_EXTENDEDPRICE*L_DISCOUNT) AS DECIMAL(18,2)) AS REVENUE
FROM 
        tpch.LINEITEM
WHERE
        L_SHIPDATE >= '1994-01-01'
        AND L_SHIPDATE < DATE '1994-01-01' + INTERVAL '1' YEAR
        AND L_DISCOUNT BETWEEN .06 - 0.01 AND .06 + 0.01
        AND L_QUANTITY < 24;
\timing
