/* Query 06 - Var_0 Rev_01 - SSBench Forecasting Revenue Change Query */
SELECT /* dss_06.sql */
        CAST(SUM(LO_EXTENDEDPRICE*LO_DISCOUNT) AS DECIMAL(18,2)) AS REVENUE
FROM 
        LINEORDER
WHERE
        LO_SHIPDATE >= ':1'
        AND LO_SHIPDATE < DATE ':1' + INTERVAL '1' YEAR
        AND LO_DISCOUNT BETWEEN :2 - 0.01 AND :2 + 0.01
        AND LO_QUANTITY < :3;
