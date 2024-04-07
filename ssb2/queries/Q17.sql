/* Query 17 - Var_0 Rev_01 - TPC-H/TPC-R Small-Quantity-Order Revenue Query */
SELECT /* dss_17.sql */
        SUM(LO_EXTENDEDPRICE) / 7.0 AS AVG_YEARLY
FROM
        tpch.LINEORDER,
        tpch.PART
WHERE
        P_PARTKEY = LO_PARTKEY
        AND P_SUPPKEY = LO_SUPPKEY
--        AND P_BRAND = 'Brand#23'
        AND P_CONTAINER = 'MED BOX'
        AND LO_QUANTITY < (
                SELECT
                        0.2 * AVG(LO_QUANTITY)
                FROM
                        LINEORDER
                WHERE
                        LO_PARTKEY = P_PARTKEY
        )
;

