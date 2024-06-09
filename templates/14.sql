/* Query 14 - StarBench - Promotion Effect Query */
SELECT /* dss_14.sql */
        CAST(100.00*SUM(CASE 
                WHEN P_TYPE LIKE 'PROMO%'
                THEN OD_EXTENDEDPRICE*(1-OD_DISCOUNT) 
                ELSE 0 
        END ) / SUM(OD_EXTENDEDPRICE*(1-OD_DISCOUNT)) AS DECIMAL (18,2)) AS PROMO_REVENUE
FROM 
        ORDER_DETAIL,
        PART
WHERE
        OD_PARTKEY = P_PARTKEY
        AND OD_SHIPDATE >= ':1'
        AND OD_SHIPDATE < DATE ':1' + INTERVAL '1' MONTH;

