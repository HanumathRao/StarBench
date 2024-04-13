/* Query 13 - Var_0 Rev_01 - TPC-H/TPC-R Customer Distribution Query */
\timing
SELECT /* dss_13.sql */
        C_COUNT, COUNT(*) AS CUSTDIST
FROM   (
        SELECT
                C_CUSTKEY,
                COUNT(DISTINCT LO_ORDERKEY)
        FROM
                ssb2.CUSTOMER LEFT OUTER JOIN ssb2.LINEORDER ON
                        C_CUSTKEY = LO_CUSTKEY
                        AND LO_COMMENT NOT LIKE '%special%requests%'
        GROUP BY
                C_CUSTKEY
        ) AS C_ORDERS (C_CUSTKEY, C_COUNT)
GROUP BY
        C_COUNT
ORDER BY
        CUSTDIST DESC,
        C_COUNT DESC;

\timing
