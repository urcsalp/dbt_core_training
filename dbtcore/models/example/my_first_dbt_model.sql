{{ config(materialized='table',transient=false)   }}
with source_data as (
    select 1 as id
    union all
    select 1 as id
)

select * from source_data