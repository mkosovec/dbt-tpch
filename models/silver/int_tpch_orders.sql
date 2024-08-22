SELECT
o.o_orderkey,
o.o_orderstatus,
o.o_orderdate,
o.o_orderpriority,
o.o_clerk,
o.o_shippriority,
o.o_comment,
o.o_totalprice,
c.c_custkey,
c.c_name,
c.c_address,
c.c_phone,
c.c_mktsegment,
c.c_comment,
n.n_nationkey,
n.n_name,
n.n_comment,
r.r_regionkey,
r.r_name,
r.r_comment
FROM
{{ source('tpch_samples', 'orders') }} o
LEFT JOIN {{ source('tpch_samples', 'customer') }} c on o.o_custkey = c.c_custkey
LEFT JOIN {{ source('tpch_samples', 'nation') }} n on c.c_nationkey = n.n_nationkey
LEFT JOIN {{ source('tpch_samples', 'region') }} r on n.n_regionkey = r.r_regionkey