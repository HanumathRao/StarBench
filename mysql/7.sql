/* Query 07 - Var_0 Rev_01 - SSBench Volume Shipping Query  */ 
SELECT /* dss_07.sql */
        S_NATION  AS SUPP_NATION,
        C_NATION  AS CUST_NATION,
        EXTRACT(YEAR FROM LO_SHIPDATE) AS L_YEAR,
        CAST(SUM(LO_EXTENDEDPRICE * (1-LO_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM 
        SUPPLIER,
        LINEORDER,
        CUSTOMER
WHERE
        S_SUPPKEY  = LO_SUPPKEY
        AND C_CUSTKEY = LO_CUSTKEY
        AND (
                (S_NATION = ':1' AND C_NATION = ':2')
                OR (S_NATION = ':2' AND C_NATION = ':1')
        )
        AND  LO_SHIPDATE BETWEEN '1995-01-01' AND '1996-12-31'
GROUP BY
        SUPP_NATION,
        CUST_NATION,
        L_YEAR
ORDER BY
        SUPP_NATION,
        CUST_NATION,
        L_YEAR;

