-- using 12345 as a seed to the RNG
/* Query 12 - StarBench - Shipping Modes and Order Priority Query */
SELECT
        OD_SHIPMODE,
        SUM(CASE
                WHEN OD_ORDERPRIORITY = '1-URGENT'
                        OR OD_ORDERPRIORITY = '2-HIGH'
                THEN 1 
                ELSE 0 
        END) AS HIGH_LINE_COUNT,
        SUM(CASE 
                WHEN OD_ORDERPRIORITY <> '1-URGENT'
                        AND OD_ORDERPRIORITY <> '2-HIGH' 
                THEN 1 
                ELSE 0 
        END) AS LOW_LINE_COUNT
FROM 
        ORDER_DETAIL
WHERE 
        OD_SHIPMODE IN ('AIR','FOB')
        AND OD_COMMITDATE < OD_RECEIPTDATE
        AND OD_SHIPDATE < OD_COMMITDATE
        AND OD_RECEIPTDATE >= '1997-01-01'
        AND OD_RECEIPTDATE < DATE '1997-01-01' + INTERVAL '1' YEAR
GROUP BY 
        OD_SHIPMODE
ORDER BY 
        OD_SHIPMODE;

