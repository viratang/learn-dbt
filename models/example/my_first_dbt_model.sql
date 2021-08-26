
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/


{{ config(materialized='table', alias='first_model') }} --ephemeral means a temporary table is created but not stored in db.


with source_data as (

    select 1 as id
    union all
    select null as id
    union all
    select 3 as id

)

select *
from source_data
where id is not null

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
