/* @(#)TERADATA 20.sql 1.1.1.1@(#) */
/* Query 20 - Var_0 Rev_01 - TPC-H/TPC-R The Potential Part Promotion query */
\timing
WITH /* dss_20.sql */ T1 (PARTKEY,SUPPKEY,QUANTITY) AS (
SELECT
        LO_PARTKEY,
        LO_SUPPKEY,
        0.5 * SUM(LO_QUANTITY)
FROM
        ssb2.LINEORDER
WHERE
        LO_SHIPDATE >= '1994-01-01'
        AND  LO_SHIPDATE <  DATE '1994-01-01' + INTERVAL '1' YEAR
GROUP BY
        LO_PARTKEY, LO_SUPPKEY
),
T2 (PARTKEY, SUPPKEY) AS (
SELECT P_PARTKEY, P_SUPPKEY
FROM
ssb2.PART
WHERE
P_NAME LIKE 'forest%'
)
SELECT
        S_NAME,
        S_ADDRESS
FROM
        T1,
        T2,
        ssb2.PART,
        ssb2.SUPPLIER
WHERE
        T1.PARTKEY = P_PARTKEY
        AND  T1.SUPPKEY = S_SUPPKEY
        AND  T2.PARTKEY = P_PARTKEY
        AND  T2.SUPPKEY = S_SUPPKEY
        AND  P_SUPPKEY =  S_SUPPKEY
        AND  P_AVAILQTY > T1.QUANTITY
        AND  S_NATION = 'CANADA'
ORDER BY
        S_NAME
LIMIT 10
;

\timing
