/* @(#)TERADATA 19.sql 1.1.1.1@(#) */
/* Query 19 - Var_0 Rev_1 - SSBench Discounted Revenue Query */
SELECT /* dss_19.sql */
        CAST(SUM(LO_EXTENDEDPRICE*(1 - LO_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM
        LINEORDER,
        PART
WHERE
        (
                P_PARTKEY = LO_PARTKEY
                AND P_SUPPKEY = LO_SUPPKEY
                AND P_BRAND = ':1'
                AND P_CONTAINER IN  ( 'SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
                AND LO_QUANTITY >= :4 AND LO_QUANTITY <= :4 + 10
                AND P_SIZE BETWEEN 1 AND 5
                AND LO_SHIPMODE IN ('AIR', 'AIR REG')
                AND LO_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = LO_PARTKEY
                AND P_SUPPKEY = LO_SUPPKEY
                AND P_BRAND = ':2'
                AND P_CONTAINER IN  ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
                AND LO_QUANTITY >= :5 AND LO_QUANTITY <= :5 + 10
                AND P_SIZE BETWEEN 1  AND 10
                AND LO_SHIPMODE IN ('AIR', 'AIR REG')
                AND LO_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = LO_PARTKEY
                AND P_SUPPKEY = LO_SUPPKEY
                AND P_BRAND = ':3'
                AND P_CONTAINER IN  ( 'LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
                AND LO_QUANTITY >= :6 AND LO_QUANTITY <= :6 + 10
                AND P_SIZE BETWEEN 1  AND 15
                AND LO_SHIPMODE IN ('AIR', 'AIR REG')
                AND LO_SHIPINSTRUCT = 'DELIVER IN PERSON'
        );

