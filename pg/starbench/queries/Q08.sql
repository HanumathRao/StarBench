-- USING DEFAULT SUBSTITUTIONS
/* QUERY 08 - STARBENCH - NATIONAL MARKET SHARE QUERY */
SELECT /* DSS_08.SQL */
        EXTRACT(YEAR FROM OD_ORDERDATE) AS L_YEAR,
        CAST(SUM(CASE
                WHEN S_NATION = 'BRAZIL'  
                THEN OD_EXTENDEDPRICE*(1-OD_DISCOUNT)
                ELSE 0
        END) / SUM(OD_EXTENDEDPRICE*(1-OD_DISCOUNT)) AS DECIMAL(18,2)) AS MKT_SHARE
FROM 
        ssb2.PART,
        ssb2.SUPPLIER,
        ssb2.ORDER_DETAIL,
        ssb2.CUSTOMER
WHERE
        P_PARTKEY = OD_PARTKEY
        AND S_SUPPKEY = OD_SUPPKEY
        AND OD_ORDERKEY = OD_ORDERKEY
        AND OD_CUSTKEY = C_CUSTKEY
        AND C_REGION = 'AMERICA'
        AND OD_ORDERDATE BETWEEN '1995-01-01' AND '1996-12-31'
        AND P_TYPE = 'ECONOMY ANODIZED STEEL'
GROUP BY
        L_YEAR
ORDER BY
        L_YEAR;

