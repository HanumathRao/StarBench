/* @(#)TERADATA 18.sql 1.1.1.1@(#) */
/* Query 18 - Var_0 Rev_01 - SSBench Large Volume Customer Query */
/* Return the first 100 selected rows                            */
SELECT /* dss_18.sql */
        C_NAME,
        C_CUSTKEY,
        LO_ORDERKEY,
        LO_ORDERDATE,
        LO_TOTALPRICE,
        CAST(SUM(LO_QUANTITY) AS DECIMAL(18,2)) AS SUM_QTY
FROM
        tpch.CUSTOMER,
        tpch.LINEORDER
WHERE
        LO_ORDERKEY IN (
                SELECT
                        LO_ORDERKEY
                FROM
                        tpch.LINEORDER
                GROUP BY
                        LO_ORDERKEY HAVING
                                SUM(LO_QUANTITY) > 300
        )
        AND C_CUSTKEY = LO_CUSTKEY
GROUP BY
        C_NAME,
        C_CUSTKEY,
        LO_ORDERKEY,
        LO_ORDERDATE,
        LO_TOTALPRICE
ORDER BY
        LO_TOTALPRICE DESC,
        LO_ORDERDATE
LIMIT 100;

