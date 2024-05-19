-- USING 12345 AS A SEED TO THE RNG
/* QUERY 21 - STARBENCH - THE SUPPLIERS WHO KEPT ORDERS WAITING QUERY */
/* RETURN THE FIRST 100 SELECTED ROWS.                                                */
SELECT /* DSS_21.SQL */
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

