{{
    config(
        materialized='ephemeral'
    )
}}


select
    c.cust_id,
    c.first_name,
    c.last_name,
    c.full_name,
    c.email,
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    p.purchase_date
from {{ ref("customer_info") }} c
join {{ ref("prod_info") }} p on c.cust_id = p.customer_id
