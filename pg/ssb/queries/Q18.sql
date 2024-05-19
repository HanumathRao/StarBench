-- USING DEFAULT SUBSTITUTIONS
/* QUERY 18 - STARBENCH - LARGE VOLUME CUSTOMER QUERY */
/* RETURN THE FIRST 100 SELECTED ROWS                            */
SELECT /* DSS_18.SQL */
        C_NAME,
        C_CUSTKEY,
        OD_ORDERKEY,
        OD_ORDERDATE,
        OD_TOTALPRICE,
        CAST(SUM(OD_QUANTITY) AS DECIMAL(18,2)) AS SUM_QTY
FROM
        ssb2.CUSTOMER,
        ssb2.ORDER_DETAIL
WHERE
        OD_ORDERKEY IN (
                SELECT
                        OD_ORDERKEY
                FROM
                        ssb2.ORDER_DETAIL
                GROUP BY
                        OD_ORDERKEY HAVING
                                SUM(OD_QUANTITY) > 300
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

