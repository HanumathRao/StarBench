-- USING 12345 AS A SEED TO THE RNG


SELECT
	L_RETURNFLAG,
	L_LINESTATUS,
	SUM(L_QUANTITY) AS SUM_QTY,
	SUM(L_EXTENDEDPRICE) AS SUM_BASE_PRICE,
	SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS SUM_DISC_PRICE,
	SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT) * (1 + L_TAX)) AS SUM_CHARGE,
	AVG(L_QUANTITY) AS AVG_QTY,
	AVG(L_EXTENDEDPRICE) AS AVG_PRICE,
	AVG(L_DISCOUNT) AS AVG_DISC,
	COUNT(*) AS COUNT_ORDER
FROM
	LINEITEM
WHERE
	L_SHIPDATE <= DATE '1998-12-01' - INTERVAL '110' DAY
GROUP BY
	L_RETURNFLAG,
	L_LINESTATUS
ORDER BY
	L_RETURNFLAG,
	L_LINESTATUS;
