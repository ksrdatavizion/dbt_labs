{{ config(
    materialized = 'incremental',
    unique_key = 'order_id',
    query_tag = 'dbt',
    cluster_by = ['order_date']
) }}

SELECT
  *
FROM {{ source('raw_cust', 'orders') }}

{% if is_incremental() %}
-- Filters only recent records during incremental run (e.g., last 30 days)
-- Reduces data scanned and speeds up merge performance
WHERE order_date >= dateadd(day, -30, current_date)
{% endif %}
