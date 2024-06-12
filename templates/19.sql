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
                AND P_BRAND = ':1'
                AND P_CONTAINER IN  ( 'SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
                AND OD_QUANTITY >= :4 AND OD_QUANTITY <= :4 + 10
                AND P_SIZE BETWEEN 1 AND 5
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = OD_PARTKEY
                AND P_SUPPKEY = OD_SUPPKEY
                AND P_BRAND = ':2'
                AND P_CONTAINER IN  ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
                AND OD_QUANTITY >= :5 AND OD_QUANTITY <= :5 + 10
                AND P_SIZE BETWEEN 1  AND 10
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        )
        OR
        (
                P_PARTKEY = OD_PARTKEY
                AND P_SUPPKEY = OD_SUPPKEY
                AND P_BRAND = ':3'
                AND P_CONTAINER IN  ( 'LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
                AND OD_QUANTITY >= :6 AND OD_QUANTITY <= :6 + 10
                AND P_SIZE BETWEEN 1  AND 15
                AND OD_SHIPMODE IN ('AIR', 'AIR REG')
                AND OD_SHIPINSTRUCT = 'DELIVER IN PERSON'
        );

