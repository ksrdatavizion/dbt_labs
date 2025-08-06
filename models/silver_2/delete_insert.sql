{{ config(
    materialized = "incremental",
    unique_key = "order_id",
    incremental_strategy = "delete+insert"
) }}

SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    amount
FROM {{ source('raw_cust', 'orders') }}
{% if is_incremental() %}
WHERE order_date >= DATEADD(day, -30, CURRENT_DATE)
{% endif %}
