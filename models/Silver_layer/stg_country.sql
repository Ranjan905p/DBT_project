{{
    config(
        materialized='table'
    )
}}

select * from {{ ref('country') }}