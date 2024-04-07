/* Query 12 - Var_0 Rev_01 - SSBench Shipping Modes and Order Priority Query */
SELECT /* dss_12.sql */
        LO_SHIPMODE,
        SUM(CASE
                WHEN LO_ORDERPRIORITY = '1-URGENT'
                        OR LO_ORDERPRIORITY = '2-HIGH'
                THEN 1 
                ELSE 0 
        END) AS HIGH_LINE_COUNT,
        SUM(CASE 
                WHEN LO_ORDERPRIORITY <> '1-URGENT'
                        AND LO_ORDERPRIORITY <> '2-HIGH' 
                THEN 1 
                ELSE 0 
        END) AS LOW_LINE_COUNT
FROM 
        tpch.LINEORDER
WHERE 
        LO_SHIPMODE IN ('MAIL','SHIP')
        AND LO_COMMITDATE < LO_RECEIPTDATE
        AND LO_SHIPDATE < LO_COMMITDATE
        AND LO_RECEIPTDATE >= '1994-01-01'
        AND LO_RECEIPTDATE < DATE '1994-01-01' + INTERVAL '1' YEAR
GROUP BY 
        LO_SHIPMODE
ORDER BY 
        LO_SHIPMODE;

