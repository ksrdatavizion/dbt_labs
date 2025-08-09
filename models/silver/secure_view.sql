{{
    config(
        materialized='view',
        secure = true
    )
}}

Select * from {{ ref('delivery_status2') }}