{{ config(materialized='table') }}
select
  o.order_id,
  o.customer_id,
  o.order_date,
  p.status
from {{ ref('stg_orders') }} o
left join {{ ref('stg_payments') }} p using (order_id)
where p.order_id is null or p.status != 'Success'
