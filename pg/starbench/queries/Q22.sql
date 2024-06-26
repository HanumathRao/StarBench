-- USING DEFAULT SUBSTITUTIONS
/* QUERY 22 - STARBENCH - GLOBAL SALEDS OPPORTUNITY QUERY */
SELECT /* DSS_22.SQL */
        CNTRYCODE,
        COUNT(*) AS NUMCUST,
        SUM(C_ACCTBAL) AS TOTACCTBAL
FROM    (
        SELECT
                SUBSTRING(C_PHONE,1,2) AS CNTRYCODE,
                C_ACCTBAL
        FROM
                ssb2.CUSTOMER
        WHERE
                SUBSTRING(C_PHONE,1,2) IN
                        ('13','31','23','29','30','18','17')
                AND C_ACCTBAL > (
                        SELECT
                                AVG(C_ACCTBAL)
                        FROM
                                ssb2.CUSTOMER
                        WHERE
                                C_ACCTBAL > 0.00
                                AND SUBSTRING(C_PHONE,1,2) IN
					('13','31','23','29','30','18','17')
                )
                AND NOT EXISTS (
                        SELECT
                                *
                        FROM
                                ssb2.ORDER_DETAIL
                        WHERE
                                OD_CUSTKEY=C_CUSTKEY
                )
        ) AS CUSTSALE
GROUP BY
        CNTRYCODE
ORDER BY
        CNTRYCODE;

