-- using default substitutions
/* Query 11 - Var_0 Rev_01 - TPC-H/TPC-R Important Stock Identification Query */

\timing
SELECT
        PS_PARTKEY,
        CAST(SUM(PS_SUPPLYCOST * PS_AVAILQTY) AS DEC(18,2)) AS VALUE
FROM 
        tpch.PARTSUPP,
        tpch.SUPPLIER,
        tpch.NATION
WHERE
        PS_SUPPKEY = S_SUPPKEY
        AND S_NATIONKEY = N_NATIONKEY
        AND N_NAME = 'GERMANY'
GROUP BY
        PS_PARTKEY HAVING 
                SUM(PS_SUPPLYCOST * PS_AVAILQTY) > (
                        SELECT
                                SUM(PS_SUPPLYCOST * PS_AVAILQTY) * 0.0001000000
                        FROM
                                tpch.PARTSUPP,
                                tpch.SUPPLIER,
                                tpch.NATION
                        WHERE
                                PS_SUPPKEY = S_SUPPKEY
                                AND S_NATIONKEY = N_NATIONKEY
                                AND N_NAME = 'GERMANY'
                )
ORDER BY
        VALUE DESC;
\timing
