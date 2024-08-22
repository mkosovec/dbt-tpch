SELECT
n.n_nationkey,
r.r_regionkey,
s.s_suppkey,
s.s_name,
s.s_address,
s.s_phone,
s.s_acctbal,
s.s_comment,
n.n_name,
n.n_comment,
r.r_name,
r.r_comment
FROM
{{ source('tpch_samples', 'supplier') }} s
LEFT JOIN {{ source('tpch_samples', 'nation') }} n on s.s_nationkey = n.n_nationkey
LEFT JOIN {{ source("tpch_samples", 'region') }} r on n.n_regionkey = r.r_regionkey