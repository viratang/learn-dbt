--common table expression
with orders as (
    select *
    from {{ source( 'sample', 'orders')}}
)

-- calculate accumulated sales from common table expression above

select distinct
    o_orderdate,
    sum(o_totalprice) over (order by o_orderdate) cumulative_sales

from orders
--below is if statement to only pick up date from 1996 if it is dev environment
{% if target.name=='dev'%}
where year(o_orderdate)=1996
{% endif %}

order by o_orderdate
