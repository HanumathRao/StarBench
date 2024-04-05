/* Query 04 - Var_0 Rev_01 - SSB Order Priority Checking Query */
WITH   /* dss_04.sql */ 
        T1(OKEY) AS  (
                SELECT 
                LO_ORDERKEY 
                FROM LINEORDER 
                WHERE LO_COMMITDATE < LO_RECEIPTDATE
        )
        SELECT 
        LO_ORDERPRIORITY, 
        COUNT(DISTINCT LO_ORDERKEY) AS ORDER_COUNT
        FROM 
                T1, 
                LINEORDER
        WHERE
                OKEY=LO_ORDERKEY
                AND LO_ORDERDATE >=  ':1'
                AND LO_ORDERDATE < DATE ':1' + INTERVAL '3' MONTH
GROUP BY LO_ORDERPRIORITY
ORDER BY LO_ORDERPRIORITY;
