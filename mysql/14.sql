/* Query 14 - Var_0 Rev_01 - SSBench Promotion Effect Query */
SELECT /* dss_14.sql */
        CAST(100.00*SUM(CASE 
                WHEN P_TYPE LIKE 'PROMO%'
                THEN LO_EXTENDEDPRICE*(1-LO_DISCOUNT) 
                ELSE 0 
        END ) / SUM(LO_EXTENDEDPRICE*(1-LO_DISCOUNT)) AS DECIMAL (18,2)) AS PROMO_REVENUE
FROM 
        LINEORDER,
        PART
WHERE
        LO_PARTKEY = P_PARTKEY
        AND LO_SHIPDATE >= ':1'
        AND LO_SHIPDATE < DATE ':1' + INTERVAL '1' MONTH;

