/* Query 13 - StarBench - Customer Distribution Query */
SELECT
        C_COUNT, COUNT(*) AS CUSTDIST
FROM   (
        SELECT
                C_CUSTKEY,
                COUNT(DISTINCT OD_ORDERKEY)
        FROM
                CUSTOMER LEFT OUTER JOIN ORDER_DETAIL ON
                        C_CUSTKEY = OD_CUSTKEY
                        AND OD_COMMENT NOT LIKE '%:1%:2%'
        GROUP BY
                C_CUSTKEY
        ) AS C_ORDERS (C_CUSTKEY, C_COUNT)
GROUP BY
        C_COUNT
ORDER BY
        CUSTDIST DESC,
        C_COUNT DESC;

