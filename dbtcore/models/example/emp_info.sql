{{ config(materialized='table',transient=false)   }}
select empno as emp_no,
ename as emp_name,
job as emp_job from {{ source('empdept','emp') }}
