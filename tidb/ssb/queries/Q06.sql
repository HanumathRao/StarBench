-- using 12345 as a seed to the RNG
/* Query 06 - StarBench - Forecasting Revenue Change Query */
SELECT
        CAST(SUM(OD_EXTENDEDPRICE*OD_DISCOUNT) AS DECIMAL(18,2)) AS REVENUE
FROM 
        ORDER_DETAIL
WHERE
        OD_SHIPDATE >= '1996-01-01'
        AND OD_SHIPDATE < DATE '1996-01-01' + INTERVAL '1' YEAR
        AND OD_DISCOUNT BETWEEN 0.06 - 0.01 AND 0.06 + 0.01
        AND OD_QUANTITY < 25;
