{{
    config(
        materialized='table'
    )
}}

select
	ORDER_ID,
	CUSTOMER_ID,
	PRODUCT_ID,
	ORDER_DATE,
	QUANTITY,
	SELLING_PRICE,
	COST_PRICE
from {{ source('raw', 'RAW_ORDERS') }}