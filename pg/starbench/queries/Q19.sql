-- USING DEFAULT SUBSTITUTIONS
/* QUERY 19 - STARBENCH - DISCOUNTED REVENUE QUERY */
SELECT /* DSS_19.SQL */
        CAST(SUM(OD_EXTENDEDPRICE*(1 - OD_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM
        ssb2.ORDER_DETAIL,
        ssb2.PART
WHERE
        (
                P_PARTKEY = OD_PARTKEY
                AND P_SUPPKEY = OD_SUPPKEY
                AND P_BRAND = 'BRAND#12'
                AND P_CONTAINER IN  ( 'SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
                AND OD_QUANTITY >= 1 AND OD_QUANTITY <= 1 + 10
                AND P_SIZE BETWEEN 1 AND 5
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = OD_PARTKEY
                AND P_SUPPKEY = OD_SUPPKEY
                AND P_BRAND = 'BRAND#23'
                AND P_CONTAINER IN  ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
                AND OD_QUANTITY >= 10 AND OD_QUANTITY <= 10 + 10
                AND P_SIZE BETWEEN 1  AND 10
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = OD_PARTKEY
                AND P_SUPPKEY = OD_SUPPKEY
                AND P_BRAND = 'BRAND#34'
                AND P_CONTAINER IN  ( 'LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
                AND OD_QUANTITY >= 20 AND OD_QUANTITY <= 20 + 10
                AND P_SIZE BETWEEN 1  AND 15
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        );

