{{
    config(
        materialized='table'
    )
}}

select
    c.CUSTOMER_ID,
    c.SEGMENT,
    c.COUNTRY,
    sum(p.PROFIT) as TOTAL_PROFIT
FROM 
{{ ref('stg_customers') }} c 
JOIN {{ ref('int_profit_calculation') }} p 
ON c.CUSTOMER_ID = p.CUSTOMER_ID
GROUP BY c.SEGMENT,c.CUSTOMER_ID,c.COUNTRY