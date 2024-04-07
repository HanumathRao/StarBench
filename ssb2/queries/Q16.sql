/* Query 16 - Var_0 Rev_01 - SSBench Parts/Supplier Relationship Query */
/* modified to minimize size of output  */
SELECT /* dss_16.sql */
        P_BRAND,
        P_TYPE,
        P_SIZE,
        COUNT(DISTINCT P_SUPPKEY) AS SUPPLIER_CNT
FROM 
        tpch.PART
WHERE
        P_BRAND <> 'Brand#45'
        AND P_TYPE NOT LIKE 'MEDIUM POLISHED%'
        AND P_SIZE IN (49,14,23,45,19,3,36,9)
        AND P_SUPPKEY NOT IN (
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

