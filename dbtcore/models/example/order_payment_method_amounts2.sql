select
order_id,
{%- for payment_method in ["bank_transfer", "credit_card", "gift_card","coupon","dummy"] %}
sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
{%- endfor -%}
sum(amount) as total_amount
from {{ref('stg_payments') }} 
group by 1