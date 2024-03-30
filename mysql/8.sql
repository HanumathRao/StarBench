/* Query 08 - Var_0 Rev_01 - SSBench National Market Share Query */
SELECT /* dss_08.sql */
        EXTRACT(YEAR FROM LO_ORDERDATE) AS L_YEAR,
        CAST(SUM(CASE
                WHEN S_NATION = ':1'  
                THEN LO_EXTENDEDPRICE*(1-LO_DISCOUNT)
                ELSE 0
        END) / SUM(LO_EXTENDEDPRICE*(1-LO_DISCOUNT)) AS DECIMAL(18,2)) AS MKT_SHARE
FROM 
        PART,
        SUPPLIER,
        LINEORDER,
        CUSTOMER
WHERE
        P_PARTKEY = LO_PARTKEY
        AND S_SUPPKEY = LO_SUPPKEY
        AND LO_ORDERKEY = LO_ORDERKEY
        AND LO_CUSTKEY = C_CUSTKEY
        AND C_REGION = ':2'
        AND LO_ORDERDATE BETWEEN '1995-01-01' AND '1996-12-31'
        AND P_TYPE = ':3'
GROUP BY
        L_YEAR
ORDER BY
        L_YEAR;

