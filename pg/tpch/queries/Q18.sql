-- using default substitutions
/* Query 18 - Var_0 Rev_01 - TPC-H/TPC-R Large Volume Customer Query */
\timing
SELECT
        C_NAME,
        C_CUSTKEY,
        O_ORDERKEY,
        O_ORDERDATE,
        O_TOTALPRICE,
        CAST(SUM(L_QUANTITY) AS DECIMAL(18,2)) AS SUM_QTY
FROM
        tpch.CUSTOMER,
        tpch.ORDERS,
        tpch.LINEITEM
WHERE
        O_ORDERKEY IN (
                SELECT
                        L_ORDERKEY
                FROM
                        tpch.LINEITEM
                GROUP BY
                        L_ORDERKEY HAVING
                                SUM(L_QUANTITY) > 300
        )
        AND C_CUSTKEY = O_CUSTKEY
        AND O_ORDERKEY = L_ORDERKEY
GROUP BY
        C_NAME,
        C_CUSTKEY,
        O_ORDERKEY,
        O_ORDERDATE,
        O_TOTALPRICE
ORDER BY
        O_TOTALPRICE DESC,
        O_ORDERDATE
LIMIT 100;
\timing

