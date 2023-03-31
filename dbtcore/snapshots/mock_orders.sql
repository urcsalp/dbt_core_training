{% snapshot mock_orders %}
{% set new_schema = target.schema + '_snapshot' %}
{{
	config(
	  target_database='sf_db',
	  target_schema=new_schema,
	  unique_key='order_id',
	  strategy='timestamp',	
	  updated_at='updated_at',
	)

}}

select * from sf_db.sf_Schema.mock_orders

{% endsnapshot %}