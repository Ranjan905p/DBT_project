{{
    config(
        materialized='table'
    )
}}
select
	PAYMENT_ID,
	ORDER_ID,
	PAYMENT_METHOD,
	STATUS,
	AMOUNT
from {{ source('raw', 'RAW_PAYMENTS') }}