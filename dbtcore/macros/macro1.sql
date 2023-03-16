{% macro macro1() %}

{% set old_etl_relation_query %}
    select * from sf_db.sf_Schema.customers1
    {% endset %}

{% set new_etl_relation_query %}
    select * from sf_db.sf_Schema.customers2
{% endset %}

{% set audit_query = audit_helper.compare_column_values(
    a_query=old_etl_relation_query,
    b_query=new_etl_relation_query,
    primary_key="id",
    column_to_compare="FIRST_NAME"
) %}

{% set audit_results = run_query(audit_query) %}

{% if execute %}
{% do audit_results.print_table() %}
{% endif %}

{% endmacro %}