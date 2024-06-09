/* Query 18 - StarBench - Large Volume Customer Query */
/* Return the first 100 selected rows                            */
SELECT /* dss_18.sql */
        C_NAME,
        C_CUSTKEY,
        OD_ORDERKEY,
        OD_ORDERDATE,
        OD_TOTALPRICE,
        CAST(SUM(OD_QUANTITY) AS DECIMAL(18,2)) AS SUM_QTY
FROM
        CUSTOMER,
        ORDER_DETAIL
WHERE
        OD_ORDERKEY IN (
                SELECT
                        OD_ORDERKEY
                FROM
                        ORDER_DETAIL
                GROUP BY
                        OD_ORDERKEY HAVING
                                SUM(OD_QUANTITY) > :1
        )
        AND C_CUSTKEY = OD_CUSTKEY
GROUP BY
        C_NAME,
        C_CUSTKEY,
        OD_ORDERKEY,
        OD_ORDERDATE,
        OD_TOTALPRICE
ORDER BY
        OD_TOTALPRICE DESC,
        OD_ORDERDATE
LIMIT 100;

