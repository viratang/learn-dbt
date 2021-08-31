--Below is Commmon Table expression, try to make it as simple as possible
with sample_customer as (
    SELECT *
    FROM {{ source( 'sample', 'customer')}}
)

--below is the actual SQL statement, you just read from the Common Table Expression from the top.
select
    c_custkey,
    c_mktsegment,
    {{rename_segments('c_mktsegment')}}  mkt_segment_adjusted,
    c_acctbal
from sample_customer