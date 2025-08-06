
{{ config(
    materialized='incremental',
    incremental_strategy='append',
    query_tag = 'dbt'
) }}

SELECT
  order_id,
  customer_id,
  order_date,
  order_status,
  amount
FROM {{ source('raw_cust', 'orders') }}