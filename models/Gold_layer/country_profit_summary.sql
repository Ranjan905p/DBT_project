{{
    config(
        materialized='table'
    )
}}

select
  c.country,
  c.region,
  sum(p.profit) as total_profit
from {{ ref('int_profit_calculation') }} p
join {{ ref('stg_customers') }} cu on p.customer_id = cu.customer_id
join {{ ref('stg_country') }} c on cu.country_code = c.country_code
group by c.country, c.region
