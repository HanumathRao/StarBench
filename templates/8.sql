/* Query 08 - StarBench - National Market Share Query */
SELECT /* dss_08.sql */
        EXTRACT(YEAR FROM OD_ORDERDATE) AS L_YEAR,
        CAST(SUM(CASE
                WHEN S_NATION = ':1'  
                THEN OD_EXTENDEDPRICE*(1-OD_DISCOUNT)
                ELSE 0
        END) / SUM(OD_EXTENDEDPRICE*(1-OD_DISCOUNT))) AS DECIMAL(18,2) AS MKT_SHARE
FROM 
        PART,
        SUPPLIER,
        ORDER_DETAIL,
        CUSTOMER
WHERE
        P_PARTKEY = OD_PARTKEY
        AND S_SUPPKEY = OD_SUPPKEY
        AND OD_ORDERKEY = OD_ORDERKEY
        AND OD_CUSTKEY = C_CUSTKEY
        AND C_REGION = ':2'
        AND OD_ORDERDATE BETWEEN '1995-01-01' AND '1996-12-31'
        AND P_TYPE = ':3'
GROUP BY
        L_YEAR
ORDER BY
        L_YEAR;

