{% snapshot snapshot_customer %}

{{
    config(
        targrt_schema='snapshot',
        unique_key='customer_id',
        strategy='check',
        check_cols=['segment']
    )
}}

select * from {{ ref('stg_customers') }}

{% endsnapshot %}