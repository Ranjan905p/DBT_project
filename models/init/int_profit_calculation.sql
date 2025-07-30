{{ config(materialized='ephemeral') }}

select
    ORDER_ID,
    CUSTOMER_ID,
    PRODUCT_ID,
    {{ calculate_profit('SELLING_PRICE', 'COST_PRICE', 'QUANTITY') }} as PROFIT
from {{ ref('stg_orders') }}

