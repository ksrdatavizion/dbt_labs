{% snapshot supply_chain_orders_snapshot %}

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