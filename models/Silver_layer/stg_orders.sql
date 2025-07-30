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
    SELLING_PRICE ::float AS SELLING_PRICE,
    QUANTITY
from {{ ref('bronze_orders') }}