{% snapshot supply_chain_orders_scd2_snapshot %}
    {{
        config(
            database="DBT_DB2",
            target_schema="SILVER_SCH",
            unique_key="ORDER_ID",
            strategy="timestamp",
            updated_at="UPDATED_AT",
            query_tag = 'dbt'
        )
    }}

    select
        order_id,
        supplier_id,
        supplier_name,
        product_id,
        product_name,
        warehouse_id,
        warehouse_region,
        order_date,
        delivery_date,
        quantity,
        unit_cost,
        total_cost,
        status,
        updated_at
    from {{ source("raw_cust", "SUPPLY_CHAIN_ORDERS") }}

{% endsnapshot %}