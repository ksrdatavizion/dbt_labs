{% snapshot supply_chain_orders_snapshot_key_based %}
    {{
        config(
            database="DBT_LABS",
            target_schema="SILVER_SCH",
            unique_key="ORDER_ID",
            strategy="check",
            check_cols=["SUPPLIER_NAME", "PRODUCT_NAME", "QUANTITY", "UNIT_COST", "TOTAL_COST", "STATUS", "DELIVERY_DATE"],
            query_tag='dbt'
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