/* @(#)TERADATA 20.sql 1.1.1.1@(#) */
/* Query 20 - Var_0 Rev_01 - TPC-H/TPC-R The Potential Part Promotion query */
SELECT /* dss_20.sql */
        S_NAME,
        S_ADDRESS
FROM
        tpch.SUPPLIER
WHERE
        S_SUPPKEY IN (
                SELECT
                        P_SUPPKEY
                FROM
                        tpch.PART
                WHERE
                        P_PARTKEY IN (
                                SELECT
                                        P_PARTKEY
                                FROM
                                        PART
                                WHERE
                                        P_NAME LIKE 'forest%'
                        )
                AND  P_AVAILQTY > (
                        SELECT
                                0.5 * SUM(LO_QUANTITY)
                        FROM
                                tpch.LINEORDER
                        WHERE
                                LO_PARTKEY = P_PARTKEY
                                AND  LO_SUPPKEY = P_SUPPKEY
                                AND  LO_SHIPDATE >= '1994-01-01'
                                AND  LO_SHIPDATE <  DATE '1994-01-01' + INTERVAL '1' YEAR
                )
        )
        AND S_NATION = 'CANADA'
ORDER BY
        S_NAME
LIMIT 10;

