{{
    config(
        materialized='view'
    )
}}

select
PAYMENT_ID,
ORDER_ID,
PAYMENT_METHOD,
STATUS,
AMOUNT ::float as AMOUNT
from {{ ref('bronze_payments') }}