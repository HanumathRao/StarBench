/* Query 09 - Var_0 Rev_01 - SSBench Product Type Profit Measure Query */
\timing
SELECT /* dss_09.sql */
        S_NATION  AS NATION,
        EXTRACT(YEAR FROM LO_ORDERDATE) AS YEAR1,
        CAST(SUM(LO_EXTENDEDPRICE*(1-LO_DISCOUNT)-P_SUPPLYCOST*LO_QUANTITY) AS DECIMAL(18,2)) AS SUM_PROFIT
FROM
        ssb2.PART,
        ssb2.SUPPLIER,
        ssb2.LINEORDER
WHERE
        S_SUPPKEY = LO_SUPPKEY
        AND S_SUPPKEY = LO_SUPPKEY
        AND P_PARTKEY = LO_PARTKEY
        AND P_SUPPKEY = LO_SUPPKEY
        AND P_NAME LIKE '%green%'
GROUP BY
        NATION,
        YEAR1
ORDER BY
        NATION,
        YEAR1 DESC;

\timing
