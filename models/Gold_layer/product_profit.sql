{{
    config(
        materialized='table'
    )
}}

select
    p.PRODUCT_ID,
    p.CATEGORY,
    p.SUBCATEGORY,
    sum(ipc.PROFIT) as TOTAL_PROFIT
from {{ ref('stg_products') }} p
JOIN {{ ref('int_profit_calculation') }} ipc
ON p.PRODUCT_ID = ipc.PRODUCT_ID
GROUP BY p.PRODUCT_ID,p.CATEGORY,p.SUBCATEGORY