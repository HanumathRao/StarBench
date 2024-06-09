/* Query 16 - StarBench - Parts/Supplier Relationship Query */
SELECT /* dss_16.sql */
        P_BRAND,
        P_TYPE,
        P_SIZE,
        COUNT(DISTINCT P_SUPPKEY) AS SUPPLIER_CNT
FROM 
        PART
WHERE
        P_BRAND <> ':1'
        AND P_TYPE NOT LIKE ':2%'
        AND P_SIZE IN (:3,:4,:5,:6,:7,:8,:9,:10)
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

