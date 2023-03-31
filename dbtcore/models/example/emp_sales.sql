{{ config(materialized='table',
pre_hook="insert into sf_db.sf_schema.dbt_audits (audit_type) values ('model level pre hook');commit;", 
post_hook="insert into sf_db.sf_schema.dbt_audits (audit_type) values ('model level post hook');commit;") }}
with emp_sales as 
(

    select * from {{ source('empdept','emp') }} where job='SALESMAN'
)

SELECT * fROM EMP_SALES