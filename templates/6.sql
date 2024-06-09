/* Query 06 - StarBench - Forecasting Revenue Change Query */
SELECT /* dss_06.sql */
        CAST(SUM(OD_EXTENDEDPRICE*OD_DISCOUNT) AS DECIMAL(18,2)) AS REVENUE
FROM 
        ORDER_DETAIL
WHERE
        OD_SHIPDATE >= ':1'
        AND OD_SHIPDATE < DATE ':1' + INTERVAL '1' YEAR
        AND OD_DISCOUNT BETWEEN :2 - 0.01 AND :2 + 0.01
        AND OD_QUANTITY < :3;
