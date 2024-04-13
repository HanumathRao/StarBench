/* Query 05 - Var_0 Rev_01 - SSBench Local Supplier Volume Query */
\timing
SELECT /* dss_05.sql */
        S_NATION,
        CAST(SUM(LO_EXTENDEDPRICE*(1-LO_DISCOUNT))  AS DECIMAL(18,2)) AS REVENUE
FROM 
        ssb2.CUSTOMER,
        ssb2.LINEORDER,
        ssb2.SUPPLIER
WHERE
        C_CUSTKEY = LO_CUSTKEY
        AND LO_SUPPKEY = S_SUPPKEY
        AND S_NATION = C_NATION
        AND C_REGION = 'ASIA'
        AND S_REGION = 'ASIA'
        AND LO_ORDERDATE >= '1994-01-01'
        AND LO_ORDERDATE < DATE '1994-01-01' + INTERVAL '1' YEAR
GROUP BY
        S_NATION
ORDER BY
        REVENUE DESC;

\timing
