with stg_payments_cents_to_dollars as (
select
  payment_id,
  {{ cents_to_dollars('amount') }} as amount_usd
  from stg_payments )
  select * from stg_payments_cents_to_dollars