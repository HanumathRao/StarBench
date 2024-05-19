-- USING DEFAULT SUBSTITUTIONS
/* QUERY 11 - STARBENCH - IMPORTANT STOCK IDENTIFICATION QUERY */
SELECT /* DSS_11.SQL */
        P_PARTKEY,
        CAST(SUM(P_SUPPLYCOST * P_AVAILQTY) AS DEC(18,2)) AS VALUE
FROM 
        ssb2.PART,
        ssb2.SUPPLIER
WHERE
         P_SUPPKEY=S_SUPPKEY
AND      S_NATION = 'GERMANY'
GROUP BY
        P_PARTKEY HAVING 
                SUM(P_SUPPLYCOST * P_AVAILQTY) > (
                        SELECT
                                CAST(SUM(P_SUPPLYCOST * P_AVAILQTY) * 0.0001000000 AS DECIMAL(18,2))
                        FROM
                                ssb2.PART,
                                ssb2.SUPPLIER
                        WHERE
                                P_SUPPKEY=S_SUPPKEY
                        AND     S_NATION = 'GERMANY'
                )
ORDER BY
        VALUE DESC;

