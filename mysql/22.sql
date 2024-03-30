/* @(#)TERADATA 22.sql 1.1.1.1@(#) */
/* Query 22 - Var_0 Rev_01 - TPC-H/TPC-R Global Saleds opportunity Query */
SELECT /* dss_22.sql */
        CNTRYCODE,
        COUNT(*) AS NUMCUST,
        SUM(C_ACCTBAL) AS TOTACCTBAL
FROM    (
        SELECT
                SUBSTRING(C_PHONE,1,2) AS CNTRYCODE,
                C_ACCTBAL
        FROM
                CUSTOMER
        WHERE
                SUBSTRING(C_PHONE,1,2) IN
                        (':1',':2',':3',':4',':5',':6',':7')
                AND C_ACCTBAL > (
                        SELECT
                                AVG(C_ACCTBAL)
                        FROM
                                CUSTOMER
                        WHERE
                                C_ACCTBAL > 0.00
                                AND SUBSTRING(C_PHONE,1,2) IN
					(':1',':2',':3',':4',':5',':6',':7')
                )
                AND NOT EXISTS (
                        SELECT
                                *
                        FROM
                                LINEORDER
                        WHERE
                                LO_CUSTKEY=C_CUSTKEY
                )
        ) AS CUSTSALE
GROUP BY
        CNTRYCODE
ORDER BY
        CNTRYCODE;

