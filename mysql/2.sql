/* Query 02 - Var_0 Rev_01 - TPC-H/TPC-R Minimum Cost Supplier Query  */
/* Return the first 100 selected rows                                 */
SELECT  /* dss_02.sql */
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
        AND P_SIZE = :1
        AND P_TYPE LIKE '%:2'
        AND S_REGION = ':3'        
	AND P_SUPPLYCOST =
                (SELECT MIN(P_SUPPLYCOST)
                 FROM
                        PART,
                        SUPPLIER
                WHERE 
                        P_SUPPKEY = S_SUPPKEY
			AND P_PARTKEY = P.P_PARTKEY
                	AND  S_REGION = ':3'
                )
ORDER BY
	S_ACCTBAL DESC,
        S_NATION,
        S_NAME,
        P_PARTKEY
LIMIT 100;

