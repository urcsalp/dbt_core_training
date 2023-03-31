{% macro audithelper1() %}

{% set old_etl_relation_query %}
    select * from sf_db.sf_Schema.emp_rowcount
    {% endset %}

{% set new_etl_relation_query %}
    select * from sf_db.sf_Schema.EMP11
{% endset %}

{% set audit_query = audit_helper.compare_column_values(
    a_query=old_etl_relation_query,
    b_query=new_etl_relation_query,
    primary_key="EMPNO",
    column_to_compare="JOB"
) %}

{% set audit_results = run_query(audit_query) %}

{% if execute %}
{% do audit_results.print_table() %}
{% endif %}

{% endmacro %}