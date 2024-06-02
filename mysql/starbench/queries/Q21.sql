-- using 12345 as a seed to the RNG
/* Query 21 - StarBench - The Suppliers Who Kept Orders Waiting Query */
/* Return the first 100 selected rows.                                                */
SELECT
        S_NAME,
        COUNT(*) AS NUMWAIT
FROM
        SUPPLIER,
        ORDER_DETAIL L1
WHERE
        S_SUPPKEY = L1.OD_SUPPKEY
        AND OD_ORDERSTATUS='F'
        AND L1.OD_RECEIPTDATE > L1.OD_COMMITDATE
        AND EXISTS (
                SELECT
                        *
                FROM 
                        ORDER_DETAIL L2
                WHERE
                        L2.OD_ORDERKEY = L1.OD_ORDERKEY
                        AND L2.OD_SUPPKEY <> L1.OD_SUPPKEY
        )
        AND NOT EXISTS (
                SELECT
                        *
                FROM 
                        ORDER_DETAIL L3
                WHERE
                        L3.OD_ORDERKEY = L1.OD_ORDERKEY
                        AND L3.OD_SUPPKEY <> L1.OD_SUPPKEY
                        AND L3.OD_RECEIPTDATE > L3.OD_COMMITDATE
        )
        AND S_NATION = 'ETHIOPIA'
GROUP BY
        S_NAME
ORDER BY
        NUMWAIT DESC,
        S_NAME
LIMIT 100;

