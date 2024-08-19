SELECT
SUM((l.l_extendedprice - l.l_tax - l.l_discount)*100) AS line_item_net_price_100,
n.n_nationkey AS nation_key,
l.l_receiptdate AS line_item_receipt_date
FROM {{ source('tpch_samples', 'lineitem') }} l
LEFT JOIN {{ source('tpch_samples', 'orders') }} o on l.l_orderkey = o.o_orderkey
LEFT JOIN {{ source('tpch_samples', 'customer') }} c on o.o_custkey = c.c_custkey
LEFT JOIN {{ source('tpch_samples', 'nation') }} n on c.c_nationkey = n.n_nationkey
GROUP BY n.n_nationkey, l.l_receiptdate