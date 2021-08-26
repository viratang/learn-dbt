{{ config(materialized='incremental', unique_key='d_date') }}

select *
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM"
where d_date <=current_date

--below is dbt macro, this is to check if this is incremental run, if it is the first time we run this model
-- the SQL is select all the date less or equal current_date. and the incremental condition is to run when the d_date is large than the max(d_date) in the table=> the
--end result is to update current date.
{% if is_incremental() %}
    and d_date>(select max(d_date) from {{this}} )-- this means target table within dates.sql

{% endif %}