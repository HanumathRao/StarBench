-- USING DEFAULT SUBSTITUTIONS
/* QUERY 16 - STARBENCH - PARTS/SUPPLIER RELATIONSHIP QUERY */
SELECT /* DSS_16.SQL */
        P_BRAND,
        P_TYPE,
        P_SIZE,
        COUNT(DISTINCT P_SUPPKEY) AS SUPPLIER_CNT
FROM 
        ssb2.PART
WHERE
        P_BRAND <> 'BRAND#45'
        AND P_TYPE NOT LIKE 'MEDIUM POLISHED%'
        AND P_SIZE IN (49,14,23,45,19,3,36,9)
        AND P_SUPPKEY NOT IN (
                SELECT 
                        S_SUPPKEY 
                FROM 
                        ssb2.SUPPLIER
                WHERE 
                        S_COMMENT LIKE '%CUSTOMER%COMPLAINTS%'
        )
GROUP BY
        P_BRAND,
        P_TYPE,
        P_SIZE
ORDER BY
        SUPPLIER_CNT DESC,
        P_BRAND,
        P_TYPE,
        P_SIZE;

