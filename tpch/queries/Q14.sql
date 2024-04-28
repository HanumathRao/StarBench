-- using default substitutions
/* Query 14 - Var_0 Rev_01 - TPC-H/TPC-R Promotion Effect Query */
\timing
SELECT
        CAST( 100.00*SUM(CASE 
                WHEN P_TYPE LIKE 'PROMO%'
                THEN L_EXTENDEDPRICE*(1-L_DISCOUNT) 
                ELSE 0 
        END)  / SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)) AS DECIMAL(18,2)) AS PROMO_REVENUE
FROM 
        tpch.LINEITEM,
        tpch.PART
WHERE
        L_PARTKEY = P_PARTKEY
        AND L_SHIPDATE >= '1995-09-01'
        AND L_SHIPDATE < DATE '1995-09-01' + INTERVAL '1' MONTH;
\timing
