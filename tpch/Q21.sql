/* Query 21 - Var_0 Rev_01 - TPC-H/TPC-R  The Suppliers Who Kept Orders Waiting Query */
/* Return the first 100 selected rows.                                                */
SELECT /* dss_21.sql */
        S_NAME,
        COUNT(*) AS NUMWAIT
FROM
        SUPPLIER,
        LINEORDER L1
WHERE
        S_SUPPKEY = L1.LO_SUPPKEY
        AND LO_ORDERSTATUS='F'
        AND L1.LO_RECEIPTDATE > L1.LO_COMMITDATE
        AND EXISTS (
                SELECT
                        *
                FROM 
                        LINEORDER L2
                WHERE
                        L2.LO_ORDERKEY = L1.LO_ORDERKEY
                        AND L2.LO_SUPPKEY <> L1.LO_SUPPKEY
        )
        AND NOT EXISTS (
                SELECT
                        *
                FROM 
                        LINEORDER L3
                WHERE
                        L3.LO_ORDERKEY = L1.LO_ORDERKEY
                        AND L3.LO_SUPPKEY <> L1.LO_SUPPKEY
                        AND L3.LO_RECEIPTDATE > L3.LO_COMMITDATE
        )
        AND S_NATION = 'SAUDI ARABIA'
GROUP BY
        S_NAME
ORDER BY
        NUMWAIT DESC,
        S_NAME
LIMIT 100;

