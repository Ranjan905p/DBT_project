{{
    config(
        materialized='view'
    )
}}
select
    ORDER_ID,
    CUSTOMER_ID,
    PRODUCT_ID,
    ORDER_DATE ::date as ORDER_DATE,
    COST_PRICE ::float as COST_PRICE,
    SELLING_PRICE ::float as SELLING_PRICE,
    QUANTITY,
    {{calculate_profit('SELLING_PRICE','COST_PRICE','QUANTITY')}} as PROFIT,
    SELLING_PRICE*QUANTITY as TOTAL_PRICE
from {{ ref('bronze_orders') }}