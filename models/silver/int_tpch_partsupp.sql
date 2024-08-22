SELECT
ps.ps_partkey,
n.n_nationkey,
r.r_regionkey,
ps.ps_suppkey,
ps.ps_comment,
ps.ps_availqty,
ps.ps_supplycost,
p.p_name,
p.p_mfgr,
p.p_brand,
p.p_type,
p.p_container,
p.p_comment,
s.s_name,
s.s_address,
s.s_phone,
s.s_comment,
n.n_name,
n.n_comment,
r.r_name,
r.r_comment
FROM
{{ source('tpch_samples', 'partsupp') }} ps
LEFT JOIN {{ source('tpch_samples', 'part') }} p on ps.ps_partkey = p.p_partkey
LEFT JOIN {{ source('tpch_samples', 'supplier') }} s on ps.ps_suppkey = s.s_suppkey
LEFT JOIN {{ source('tpch_samples', 'nation') }} n on s.s_nationkey = n.n_nationkey
LEFT JOIN {{ source("tpch_samples", 'region') }} r on n.n_regionkey = r.r_regionkey