/* Query 02 - Var_0 Rev_01 - TPC-H/TPC-R Minimum Cost Supplier Query  */
*/ Return the first 100 selected rows                                 */
SELECT /* dss_02.sql */ DISTINCT
        S_ACCTBAL,
        S_NAME,
        S_REGION,
        P_PARTKEY,
        P_MFGR,
        S_ADDRESS,
        S_PHONE
        S_COMMENT 
FROM PART O, 
        SUPPLIER
WHERE O.P_SUPPKEY = S_SUPPKEY
       AND O.P_TYPE LIKE '%BRASS'
       AND O.P_SIZE = 15
    AND S_REGION = 'ASIA'
       AND O.P_SUPPLYCOST =
       (SELECT  Min(P_SUPPLYCOST)
                FROM 
                        PART,
                        SUPPLIER
                WHERE
                        O.P_PARTKEY = P_PARTKEY 
                         AND S_SUPPKEY = P_SUPPKEY
                         AND S_REGION = 'ASIA'  
                GROUP BY P_PARTKEY)
       ORDER BY
       S_ACCTBAL DESC,
        S_REGION,
        S_NAME,
        P_PARTKEY
LIMIT 100;

