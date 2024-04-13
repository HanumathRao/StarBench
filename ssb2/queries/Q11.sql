/* Query 11 - Var_0 Rev_01 - SSBench Important Stock Identification Query */
/* modified to minimize size of the output */
\timing
SELECT /* dss_11.sql */
        P_PARTKEY,
        CAST(SUM(P_SUPPLYCOST * P_AVAILQTY) AS DEC(18,2)) AS "VALUE"
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
                                PART,
                                SUPPLIER
                        WHERE
                                P_SUPPKEY=S_SUPPKEY
                        AND     S_NATION = 'GERMANY'
                )
ORDER BY
        "VALUE" DESC
LIMIT 10;

\timing
