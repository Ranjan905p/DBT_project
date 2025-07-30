{{
    config(
        materialized='table'
    )
}}

select
	PRODUCT_ID,
	PRODUCT_NAME,
	CATEGORY,
	SUBCATEGORY
from {{ source('raw', 'RAW_PRODUCTS') }}