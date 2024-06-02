-- using 12345 as a seed to the RNG
/* Query 16 - StarBench - Parts/Supplier Relationship Query */
SELECT
        P_BRAND,
        P_TYPE,
        P_SIZE,
        COUNT(DISTINCT P_SUPPKEY) AS SUPPLIER_CNT
FROM 
        PART
WHERE
        P_BRAND <> 'Brand#21'
        AND P_TYPE NOT LIKE 'SMALL PLATED%'
        AND P_SIZE IN (9,44,13,47,15,4,48,21)
        AND P_SUPPKEY NOT IN (
                SELECT 
                        S_SUPPKEY 
                FROM 
                        SUPPLIER
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
        P_SIZE;

