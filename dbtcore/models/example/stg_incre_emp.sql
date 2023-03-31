{{
  config(
	materialized = 'incremental',
	unique_key='EMPNO'
 	)
}}

select * from sf_db.sf_schema.src_emp
{% if is_incremental() %}
      where hiredate > (select coalesce(max(hiredate),'1900-01-01') from {{ this }}) 
{% endif %}