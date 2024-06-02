-- using 12345 as a seed to the RNG
/* Query 07 - StarBench - Volume Shipping Query  */ 
SELECT
        S_NATION  AS SUPP_NATION,
        C_NATION  AS CUST_NATION,
        EXTRACT(YEAR FROM OD_SHIPDATE) AS L_YEAR,
        CAST(SUM(OD_EXTENDEDPRICE * (1-OD_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM 
        SUPPLIER,
        ORDER_DETAIL,
        CUSTOMER
WHERE
        S_SUPPKEY  = OD_SUPPKEY
        AND C_CUSTKEY = OD_CUSTKEY
        AND (
                (S_NATION = 'KENYA' AND C_NATION = 'RUSSIA')
                OR (S_NATION = 'RUSSIA' AND C_NATION = 'KENYA')
        )
        AND  OD_SHIPDATE BETWEEN '1995-01-01' AND '1996-12-31'
GROUP BY
        SUPP_NATION,
        CUST_NATION,
        L_YEAR
ORDER BY
        SUPP_NATION,
        CUST_NATION,
        L_YEAR;

