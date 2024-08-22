SELECT
c.c_custkey,
n.n_nationkey,
r.r_regionkey,
c.c_name,
c.c_address,
c.c_phone,
c.c_acctbal,
c.c_mktsegment,
c.c_comment,
n.n_name,
n.n_comment,
r.r_name,
r.r_comment
FROM
{{ source('tpch_samples', 'customer') }} c
LEFT JOIN {{ source('tpch_samples', 'nation') }} n on c.c_nationkey = n.n_nationkey
LEFT JOIN {{ source('tpch_samples', 'region') }} r on n.n_regionkey = r.r_regionkey