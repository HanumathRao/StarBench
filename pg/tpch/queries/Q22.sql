-- using default substitutions
/* Query 22 - Var_0 Rev_01 - TPC-H/TPC-R Global Saleds opportunity Query */
\timing
SELECT
        CNTRYCODE,
        COUNT(*) AS NUMCUST,
        SUM(C_ACCTBAL) AS TOTACCTBAL
FROM    (
        SELECT
                SUBSTRING (C_PHONE FROM 1 FOR 2) AS CNTRYCODE,
                C_ACCTBAL
        FROM
                tpch.CUSTOMER
        WHERE
                SUBSTRING (C_PHONE FROM 1 FOR 2) IN
                        ('13','31','23','29','30','18','17')
                AND C_ACCTBAL > (
                        SELECT
                                AVG(C_ACCTBAL)
                        FROM
                                tpch.CUSTOMER
                        WHERE
                                C_ACCTBAL > 0.00
                                AND SUBSTRING (C_PHONE FROM 1 FOR 2) IN
                                        ('13','31','23','29','30','18','17')
                )
                AND NOT EXISTS (
                        SELECT
                                *
                        FROM
                                tpch.ORDERS
                        WHERE
                                O_CUSTKEY=C_CUSTKEY
                )
        ) AS CUSTSALE
GROUP BY
        CNTRYCODE
ORDER BY
        CNTRYCODE;

\timing
