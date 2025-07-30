{{
    config(
        materialized='view'
    )
}}

select * from {{ ref('country') }}