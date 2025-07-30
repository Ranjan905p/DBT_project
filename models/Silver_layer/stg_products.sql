{{
    config(
        materialized='view'
    )
}}
select
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    SUBCATEGORY
from {{ ref('bronze_products') }}
