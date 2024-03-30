/* Query 05 - Var_0 Rev_01 - SSBench Local Supplier Volume Query */
SELECT /* dss_05.sql */
        S_NATION,
        CAST(SUM(LO_EXTENDEDPRICE*(1-LO_DISCOUNT))  AS DECIMAL(18,2)) AS REVENUE
FROM 
        CUSTOMER,
        LINEORDER,
        SUPPLIER
WHERE
        C_CUSTKEY = LO_CUSTKEY
        AND LO_SUPPKEY = S_SUPPKEY
        AND S_NATION = C_NATION
        AND C_REGION = ':1'
        AND S_REGION = ':1'
        AND LO_ORDERDATE >= ':2'
        AND LO_ORDERDATE < DATE ':2' + INTERVAL '1' YEAR
GROUP BY
        S_NATION
ORDER BY
        REVENUE DESC;

