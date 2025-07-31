{{ 
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='ORDER_ID'
    ) 
}}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    PRODUCT_ID,
    ORDER_DATE ::date AS ORDER_DATE,
    COST_PRICE ::float AS COST_PRICE,
    SELLING_PRICE ::float AS SELLING_PRICE,
    QUANTITY,
    {{ calculate_profit('SELLING_PRICE','COST_PRICE','QUANTITY') }} AS PROFIT,
    SELLING_PRICE * QUANTITY AS TOTAL_PRICE
FROM {{ ref('bronze_orders') }}
{% if is_incremental() %}
WHERE ORDER_DATE >= CURRENT_DATE - INTERVAL '1 day'
{% endif %}
