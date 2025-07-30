{{
    config(
        materialized='view'
    )
}}

select
PAYMENT_ID,
ORDER_ID,
PAYMENT_METHOD,
STATUS as PAYMENT_STAUS,
AMOUNT ::float as AMOUNT
from {{ ref('bronze_payments') }}