/* Query 04 -  SSB Order Priority Checking Query */
WITH   /* dss_04.sql */ 
        T1(OKEY) AS  (
                SELECT 
                OD_ORDERKEY 
                FROM ORDER_DETAIL 
                WHERE OD_COMMITDATE < OD_RECEIPTDATE
        )
        SELECT 
        OD_ORDERPRIORITY, 
        COUNT(DISTINCT OD_ORDERKEY) AS ORDER_COUNT
        FROM 
                T1, 
                ORDER_DETAIL
        WHERE
                OKEY=OD_ORDERKEY
                AND OD_ORDERDATE >=  ':1'
                AND OD_ORDERDATE < DATE ':1' + INTERVAL '3' MONTH
GROUP BY OD_ORDERPRIORITY
ORDER BY OD_ORDERPRIORITY;

