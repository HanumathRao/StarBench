-- using 12345 as a seed to the RNG
/* Query 19 - StarBench - Discounted Revenue Query */
SELECT
        CAST(SUM(OD_EXTENDEDPRICE*(1 - OD_DISCOUNT)) AS DECIMAL(18,2)) AS REVENUE
FROM
        ORDER_DETAIL,
        PART
WHERE
        (
                P_PARTKEY = OD_PARTKEY
                AND P_SUPPKEY = OD_SUPPKEY
                AND P_BRAND = 'Brand#15'
                AND P_CONTAINER IN  ( 'SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
                AND OD_QUANTITY >= 10 AND OD_QUANTITY <= 10 + 10
                AND P_SIZE BETWEEN 1 AND 5
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = OD_PARTKEY
                AND P_SUPPKEY = OD_SUPPKEY
                AND P_BRAND = 'Brand#25'
                AND P_CONTAINER IN  ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
                AND OD_QUANTITY >= 13 AND OD_QUANTITY <= 13 + 10
                AND P_SIZE BETWEEN 1  AND 10
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = OD_PARTKEY
                AND P_SUPPKEY = OD_SUPPKEY
                AND P_BRAND = 'Brand#25'
                AND P_CONTAINER IN  ( 'LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
                AND OD_QUANTITY >= 26 AND OD_QUANTITY <= 26 + 10
                AND P_SIZE BETWEEN 1  AND 15
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        );

