with order_payment_method_amounts as 
(
{%- set payment_methods = dbt_utils.get_column_values(
    table=source('empdept','PAYMENT_METHOD_TYPES'),
    column='METHOD_TYPE') -%}

select
order_id,
{%- for payment_method in payment_methods %}
sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ ref('stg_payments') }}
group by 1
)
select * from order_payment_method_amounts