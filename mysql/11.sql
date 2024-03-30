/* Query 11 - Var_0 Rev_01 - SSBench Important Stock Identification Query */

SELECT /* dss_11.sql */
        P_PARTKEY,
        CAST(SUM(P_SUPPLYCOST * P_AVAILQTY) AS DEC(18,2)) AS VALUE
FROM 
        PART,
        SUPPLIER
WHERE
         P_SUPPKEY=S_SUPPKEY
AND      S_NATION = ':1'
GROUP BY
        P_PARTKEY HAVING 
                SUM(P_SUPPLYCOST * P_AVAILQTY) > (
                        SELECT
                                CAST(SUM(P_SUPPLYCOST * P_AVAILQTY) * :2 AS DECIMAL(18,2))
                        FROM
                                PART,
                                SUPPLIER
                        WHERE
                                P_SUPPKEY=S_SUPPKEY
                        AND     S_NATION = 'GERMANY'
                )
ORDER BY
        VALUE DESC;

