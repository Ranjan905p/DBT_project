{{
    config(
        materialized='table'
    )
}}
select 
	CUSTOMER_ID,
	NAME,
	SEGMENT,
	COUNTRY,
    COUNTRY_CODE
from {{ source('raw', 'RAW_CUSTOMERS') }}