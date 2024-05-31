-- using 12345 as a seed to the RNG
/* Query 02 - StarBench - Minimum Cost Supplier Query  */
/* Return the first 100 selected rows                                 */
SELECT
        S_ACCTBAL,
        S_NAME,
        S_NATION,
        P_PARTKEY,
        P_MFGR,
        S_ADDRESS,
        S_PHONE,
        S_COMMENT 
FROM 
        PART P,
        SUPPLIER
WHERE 
        P_SUPPKEY = S_SUPPKEY
        AND P_SIZE = 48
        AND P_TYPE LIKE '%TIN'
        AND S_REGION = 'AFRICA'        
        AND P_SUPPLYCOST =
                (SELECT MIN(P_SUPPLYCOST)
                 FROM
                        PART,
                        SUPPLIER
                WHERE 
                        P_SUPPKEY = S_SUPPKEY
                        AND P_PARTKEY = P.P_PARTKEY
                        AND  S_REGION = 'AFRICA'
                )
ORDER BY
        S_ACCTBAL DESC,
        S_NATION,
        S_NAME,
        P_PARTKEY
LIMIT 100;
