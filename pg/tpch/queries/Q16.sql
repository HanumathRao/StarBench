-- using default substitutions
/* Query 16 - Var_0 Rev_01 - TPC-H/TPC-R Parts/Supplier Relationship Query */
\timing
SELECT
        P_BRAND,
        P_TYPE,
        P_SIZE,
        COUNT(DISTINCT PS_SUPPKEY) AS SUPPLIER_CNT
FROM 
        tpch.PARTSUPP,
        tpch.PART
WHERE
        P_PARTKEY = PS_PARTKEY
        AND P_BRAND <> 'Brand#45'
        AND P_TYPE NOT LIKE 'MEDIUM POLISHED%'
        AND P_SIZE IN (49,14,23,45,19,3,36,9)
        AND PS_SUPPKEY NOT IN (
                SELECT 
                        S_SUPPKEY 
                FROM 
                        tpch.SUPPLIER
                WHERE 
                        S_COMMENT LIKE '%Customer%Complaints%'
        )
GROUP BY
        P_BRAND,
        P_TYPE,
        P_SIZE
ORDER BY
        SUPPLIER_CNT DESC,
        P_BRAND,
        P_TYPE,
        P_SIZE
LIMIT 10;
\timing
