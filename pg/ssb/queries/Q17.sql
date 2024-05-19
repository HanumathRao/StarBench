/* Query 17 - Var_0 Rev_01 - TPC-H/TPC-R Small-Quantity-Order Revenue Query */
\timing
/* Query 17 - Var_0 Rev_01 - TPC-H/TPC-R Small-Quantity-Order Revenue Query */
/* Decorellated version                                                     */
WITH   /* dss_17.sql */
        T1(PARTKEY, QUANTITY) AS (
                SELECT
                LO_PARTKEY,
                0.2 * AVG(LO_QUANTITY)
                FROM ssb2.LINEORDER
                GROUP BY 1
        )
        SELECT
        CAST(SUM(LO_EXTENDEDPRICE) / 7.0 AS DECIMAL(18,2)) AS AVG_YEARLY
        FROM
                T1,
                ssb2.PART,
                ssb2.LINEORDER
        WHERE
                P_PARTKEY = LO_PARTKEY
                AND T1.PARTKEY = P_PARTKEY
                AND P_SUPPKEY = LO_SUPPKEY
	        AND P_BRAND = 'Brand#23'
       		AND P_CONTAINER = 'MED BOX'
                AND LO_QUANTITY < T1.QUANTITY;
\timing
