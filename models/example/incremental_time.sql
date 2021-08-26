{{ config(materialized='incremental', unique_key='t_time') }}

select *  from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
where to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND))<=current_time


--below is dbt macro, this is to check if this is incremental run, if it is the first time we run this model
-- the SQL is select all the time less or equal current time. and the incremental condition is to run when the t_time key is  large than the max(t_time) in the table=> the
--end result is to update with the latest t_time
{% if is_incremental() %}
    and t_time>(select max(t_time) from {{this}} )-- this means target table within this sql

{% endif %}