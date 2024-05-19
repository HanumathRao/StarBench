/* Query 07 - Var_0 Rev_01 - SSBench Volume Shipping Query  */ 
\timing
SELECT /* dss_07.sql */
        S_NATION  AS SUPP_NATION,
        C_NATION  AS CUST_NATION,
        EXTRACT(YEAR FROM LO_SHIPDATE) AS YEAR1,
        CAST(SUM(LO_EXTENDEDPRICE * (1-LO_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM 
        ssb2.SUPPLIER,
        ssb2.LINEORDER,
        ssb2.CUSTOMER
WHERE
        S_SUPPKEY  = LO_SUPPKEY
        AND C_CUSTKEY = LO_CUSTKEY
        AND (
                (S_NATION = 'FRANCE' AND C_NATION = 'GERMANY')
                OR (S_NATION = 'GERMANY' AND C_NATION = 'FRANCE')
        )
        AND  LO_SHIPDATE BETWEEN '1995-01-01' AND '1996-12-31'
GROUP BY
        SUPP_NATION,
        CUST_NATION,
        YEAR1
ORDER BY
        SUPP_NATION,
        CUST_NATION,
        YEAR1;

\timing
