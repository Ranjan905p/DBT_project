{{
    config(
        materialized='ephemeral'
    )   
}}

select
    o.ORDER_ID,
    o.CUSTOMER_ID,
    o.ORDER_DATE,
    p.AMOUNT,
    p.STATUS
from
{{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_payments') }} p
ON
o.ORDER_ID = p.ORDER_ID