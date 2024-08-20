SELECT
l.l_orderkey,
l.l_linenumber,
l.l_partkey,
c.c_custkey,
c_n.n_nationkey AS c_n_nationkey,
c_r.r_regionkey AS c_r_regionkey,
s_n.n_nationkey AS s_n_nationkey,
s_r.r_regionkey AS s_r_regionkey,
s.s_suppkey,
l.l_quantity,
l.l_extendedprice,
l.l_discount,
l.l_tax,
l.l_returnflag,
l.l_linestatus,
l.l_shipdate,
l.l_commitdate,
l.l_receiptdate,
l.l_shipinstruct,
l.l_shipmode,
l.l_comment,
o.o_orderstatus,
o.o_orderdate,
o.o_orderpriority,
o.o_clerk,
o.o_shippriority,
o.o_comment,
ps.ps_comment,
p.p_name,
p.p_mfgr,
p.p_brand,
p.p_type,
p.p_container,
p.p_comment,
c.c_name,
c.c_address,
c.c_phone,
c.c_mktsegment,
c.c_comment,
s.s_name,
s.s_address,
s.s_phone,
s.s_comment,
c_n.n_name AS c_n_name,
s_n.n_name AS s_n_name,
c_n.n_comment AS c_n_comment,
s_n.n_comment AS s_n_comment,
c_r.r_name AS c_r_name,
s_r.r_name AS s_r_name,
c_r.r_comment AS c_r_comment,
s_r.r_comment AS s_r_comment,
date_format(l.l_receiptdate, "yyyyMM") AS l_receiptdate_yearmonth,
l.l_extendedprice - l.l_tax - l.l_discount AS revenue,
CASE WHEN l.l_returnflag IS TRUE
   THEN l.l_extendedprice - l.l_tax - l.l_discount
   ELSE 0
END AS revenue_no_returns
FROM {{ source('tpch_samples', 'lineitem') }} l
LEFT JOIN {{ source('tpch_samples', 'orders') }} o on l.l_orderkey = o.o_orderkey
LEFT JOIN {{ source('tpch_samples', 'customer') }} c on o.o_custkey = c.c_custkey
LEFT JOIN {{ source('tpch_samples', 'nation') }} c_n on c.c_nationkey = c_n.n_nationkey
LEFT JOIN {{ source('tpch_samples', 'region') }} c_r on c_n.n_regionkey = c_r.r_regionkey
LEFT JOIN {{ source('tpch_samples', 'partsupp') }} ps on l.l_partkey = ps.ps_partkey AND l.l_suppkey = ps.ps_suppkey
LEFT JOIN {{ source('tpch_samples', 'part') }} p on ps.ps_partkey = p.p_partkey
LEFT JOIN {{ source('tpch_samples', 'supplier') }} s on ps.ps_suppkey = s.s_suppkey
LEFT JOIN {{ source('tpch_samples', 'nation') }} s_n on s.s_nationkey = s_n.n_nationkey
LEFT JOIN {{ source("tpch_samples", 'region') }} s_r on s_n.n_regionkey = s_r.r_regionkey