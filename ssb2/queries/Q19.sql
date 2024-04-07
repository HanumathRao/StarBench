/* @(#)TERADATA 19.sql 1.1.1.1@(#) */
/* Query 19 - Var_0 Rev_1 - SSBench Discounted Revenue Query */
SELECT /* dss_19.sql */
        CAST(SUM(LO_EXTENDEDPRICE*(1 - LO_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM
        tpch.LINEORDER,
        tpch.PART
WHERE
        (
                P_PARTKEY = LO_PARTKEY
                AND P_SUPPKEY = LO_SUPPKEY
                AND P_BRAND = 'Brand#12'
                AND P_CONTAINER IN  ( 'SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
                AND LO_QUANTITY >= 1 AND LO_QUANTITY <= 1 + 10
                AND P_SIZE BETWEEN 1 AND 5
                AND LO_SHIPMODE IN ('AIR', 'AIR REG')
                AND LO_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = LO_PARTKEY
                AND P_SUPPKEY = LO_SUPPKEY
                AND P_BRAND = 'Brand#23'
                AND P_CONTAINER IN  ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
                AND LO_QUANTITY >= 10 AND LO_QUANTITY <= 10 + 10
                AND P_SIZE BETWEEN 1  AND 10
                AND LO_SHIPMODE IN ('AIR', 'AIR REG')
                AND LO_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = LO_PARTKEY
                AND P_SUPPKEY = LO_SUPPKEY
                AND P_BRAND = 'Brand#34'
                AND P_CONTAINER IN  ( 'LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
                AND LO_QUANTITY >= 20 AND LO_QUANTITY <= 20 + 10
                AND P_SIZE BETWEEN 1  AND 15
                AND LO_SHIPMODE IN ('AIR', 'AIR REG')
                AND LO_SHIPINSTRUCT = 'DELIVER IN PERSON'
        );

