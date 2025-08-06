
{{ config(
    materialized = 'incremental',
    unique_key = 'order_id',
    query_tag = 'dbt',
    on_schema_change = 'sync_all_columns'
) }}

SELECT
   *
FROM {{ source('raw_cust', 'orders') }}

{% if is_incremental() %}
-- Filters only recent records during incremental run (e.g., last  days)
-- Reduces data scanned and speeds up merge performance
WHERE order_date >= dateadd(day, -20, current_date)
{% endif %}


