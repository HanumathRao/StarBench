-- using default substitutions
/* Query 02 - Var_0 Rev_01 - TPC-H/TPC-R Minimum Cost Supplier Query  */
\timing
SELECT
        S_ACCTBAL,
        S_NAME,
        N_NAME,
        P_PARTKEY,
        P_MFGR,
        S_ADDRESS,
        S_PHONE,
        S_COMMENT
FROM 
        tpch.PART,
        tpch.SUPPLIER,
        tpch.PARTSUPP,
        tpch.NATION,
        tpch.REGION
WHERE
        P_PARTKEY = PS_PARTKEY
        AND S_SUPPKEY = PS_SUPPKEY
        AND P_SIZE = 15
        AND P_TYPE LIKE '%BRASS'
        AND S_NATIONKEY = N_NATIONKEY
        AND N_REGIONKEY = R_REGIONKEY
        AND R_NAME = 'EUROPE'
        AND PS_SUPPLYCOST = (
                SELECT 
                        MIN(PS_SUPPLYCOST)
                FROM 
                        tpch.PARTSUPP,
                        tpch.SUPPLIER,
                        tpch.NATION,
                        tpch.REGION
                WHERE
                        P_PARTKEY = PS_PARTKEY
                        AND S_SUPPKEY = PS_SUPPKEY
                        AND S_NATIONKEY = N_NATIONKEY
                        AND N_REGIONKEY = R_REGIONKEY
                        AND R_NAME = 'EUROPE'
        )
ORDER BY 
        S_ACCTBAL DESC,
        N_NAME,
        S_NAME,
        P_PARTKEY
LIMIT 100;
\timing
