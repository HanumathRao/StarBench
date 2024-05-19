-- USING 12345 AS A SEED TO THE RNG
/* QUERY 11 - STARBENCH - IMPORTANT STOCK IDENTIFICATION QUERY */
SELECT /* DSS_11.SQL */
        P_PARTKEY,
        CAST(SUM(P_SUPPLYCOST * P_AVAILQTY) AS DEC(18,2)) AS VALUE
FROM 
        PART,
        SUPPLIER
WHERE
         P_SUPPKEY=S_SUPPKEY
AND      S_NATION = 'EGYPT'
GROUP BY
        P_PARTKEY HAVING 
                SUM(P_SUPPLYCOST * P_AVAILQTY) > (
                        SELECT
                                CAST(SUM(P_SUPPLYCOST * P_AVAILQTY) * 0.0001000000 AS DECIMAL(18,2))
                        FROM
                                PART,
                                SUPPLIER
                        WHERE
                                P_SUPPKEY=S_SUPPKEY
                        AND     S_NATION = 'GERMANY'
                )
ORDER BY
        VALUE DESC;

