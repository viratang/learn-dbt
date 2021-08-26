


--define total daily sales by day as there are multiple sales in one day.
with daily as
(select o_orderdate, sum(o_totalprice) as daily_sales
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
group by o_orderdate)

-- calculate accumulated sales from daily view defined above

select o_orderdate, daily_sales, sum(daily_sales) over (order by o_orderdate rows between unbounded preceding and current row) as accum_sales

from daily

order by o_orderdate
