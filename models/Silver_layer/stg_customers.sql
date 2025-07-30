{{
    config(
        materialized='view'
    )
}}

select * 
from {{ ref('bronze_customers') }}