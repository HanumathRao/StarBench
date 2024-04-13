/* Query 06 - Var_0 Rev_01 - SSBench Forecasting Revenue Change Query */
\timing
SELECT /* dss_06.sql */
        CAST(SUM(LO_EXTENDEDPRICE*LO_DISCOUNT) AS DECIMAL(18,2)) AS REVENUE
FROM 
        ssb2.LINEORDER
WHERE
        LO_SHIPDATE >= '1994-01-01'
        AND LO_SHIPDATE < DATE '1994-01-01' + INTERVAL '1' YEAR
        AND LO_DISCOUNT BETWEEN .06 - 0.01 AND .06 + 0.01
        AND LO_QUANTITY < 24;
\timing
