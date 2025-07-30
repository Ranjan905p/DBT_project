{{ config(materialized='table') }}
select
  status,
  count(*) as total_count,
  round(100.0 * count(*) / sum(count(*)) over (), 2) as percentage
from {{ ref('stg_payments') }}
group by status