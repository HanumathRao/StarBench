-- USING 12345 AS A SEED TO THE RNG
/* QUERY 16 - STARBENCH - PARTS/SUPPLIER RELATIONSHIP QUERY */
SELECT /* DSS_16.SQL */
        P_BRAND,
        P_TYPE,
        P_SIZE,
        COUNT(DISTINCT P_SUPPKEY) AS SUPPLIER_CNT
FROM 
        PART
WHERE
        P_BRAND <> 'BRAND#21'
        AND P_TYPE NOT LIKE 'SMALL PLATED%'
        AND P_SIZE IN (9,44,13,47,15,4,48,21)
        AND P_SUPPKEY NOT IN (
                SELECT 
                        S_SUPPKEY 
                FROM 
                        SUPPLIER
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

