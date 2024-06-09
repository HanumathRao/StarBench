/* Query 02 - StarBench - Minimum Cost Supplier Query  */
/* Return the first 100 selected rows                                 */
/* Variant Q2.1 decorellating  query (MySQL and PostGreSQL)           */
WITH T1(PARTKEY, MINCOST)  AS (
SELECT 
	P_PARTKEY,
	MIN(P_SUPPLYCOST) OVER (PARTITION BY P_PARTKEY)
FROM
	PART,
	SUPPLIER
WHERE
	P_SUPPKEY = S_SUPPKEY
	AND P_SIZE = :1
	AND P_TYPE LIKE '%:2'
	AND S_REGION = ':3'
)
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
	T1,
	PART,
        SUPPLIER
WHERE 
	P_PARTKEY=PARTKEY
	AND P_SUPPKEY=S_SUPPKEY
        AND P_SIZE = :1
        AND P_TYPE LIKE '%:2'
        AND S_REGION = ':3'   
	AND P_SUPPLYCOST = MINCOST
ORDER BY
	S_ACCTBAL DESC,
        S_NATION,
        S_NAME,
        P_PARTKEY
LIMIT 100;

