SELECT
date_add(MAX(l.l_receiptdate),30) line_item_receipt_date,
n.n_nationkey
FROM {{source('tpch_samples', 'nation')}} n
JOIN {{source('tpch_samples', 'customer')}} c on n.n_nationkey = c.c_nationkey
JOIN {{source('tpch_samples', 'orders')}} o on c.c_custkey = o.o_custkey
JOIN {{source('tpch_samples', 'lineitem')}} l on o.o_orderkey = l.l_orderkey
GROUP BY n.n_nationkey