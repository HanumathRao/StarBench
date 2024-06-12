/* Query 05 - StarBench - Local Supplier Volume Query */
SELECT
        S_NATION,
        CAST(SUM(OD_EXTENDEDPRICE*(1-OD_DISCOUNT))  AS DECIMAL(18,2)) AS REVENUE
FROM 
        CUSTOMER,
        ORDER_DETAIL,
        SUPPLIER
WHERE
        C_CUSTKEY = OD_CUSTKEY
        AND OD_SUPPKEY = S_SUPPKEY
        AND S_NATION = C_NATION
        AND C_REGION = ':1'
        AND S_REGION = ':1'
        AND OD_ORDERDATE >= ':2'
        AND OD_ORDERDATE < DATE ':2' + INTERVAL '1' YEAR
GROUP BY
        S_NATION
ORDER BY
        REVENUE DESC;

