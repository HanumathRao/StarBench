-- using 12345 as a seed to the RNG
/* Query 13 - StarBench - Customer Distribution Query */
SELECT
        C_COUNT, COUNT(*) AS CUSTDIST
FROM   (
        SELECT
                C_CUSTKEY AS C_CUSTKEY,
                COUNT(DISTINCT OD_ORDERKEY) AS C_COUNT
        FROM
                CUSTOMER LEFT OUTER JOIN ORDER_DETAIL ON
                        C_CUSTKEY = OD_CUSTKEY
                        AND OD_COMMENT NOT LIKE '%express%deposits%'
        GROUP BY
                C_CUSTKEY
        ) AS C_ORDERS
GROUP BY
        C_COUNT
ORDER BY
        CUSTDIST DESC,
        C_COUNT DESC;

