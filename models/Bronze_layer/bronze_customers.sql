{{
    config(
        materialized='table'
    )
}}
select 
	CUSTOMER_ID,
	NAME,
	SEGMENT,
	COUNTRY
from {{ source('raw', 'RAW_CUSTOMERS') }}