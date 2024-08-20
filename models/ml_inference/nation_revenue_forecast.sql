SELECT
date_add(MAX(l.l_receiptdate),30) line_item_receipt_date,
nation_key
FROM {{ source('tpch_samples', 'lineitem') }} l
LEFT JOIN {{ source('tpch_samples', 'orders') }} o on l.l_orderkey = o.o_orderkey
LEFT JOIN {{ source('tpch_samples', 'customer') }} c on o.o_custkey = c.c_custkey
LEFT JOIN {{ source('tpch_samples', 'nation') }} n on c.c_nationkey = n.n_nationkey
GROUP BY nation_key