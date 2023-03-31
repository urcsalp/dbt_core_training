/* {{ config(materialized='table',transient=false) }}  */
{{ config(materialized='view',secure=true) }}

select ename as emp_name,sal as emp_sal from sf_db.sf_schema.emp