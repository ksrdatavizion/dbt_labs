SELECT
    -- Customer Information
    c.CUSTOMER_ID,
    c.FIRST_NAME,
    c.LAST_NAME,
    c.EMAIL,

    -- Product Purchase Information
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    p.PURCHASE_DATE,

    -- Delivery Status Mapping based on DELIVERY_ID
    -- DELIVERY_ID Mapping:
    --   1 → Delivered
    --   2 → Shipped
    --   3 → In Transit
    --   4 → Pending
    --   Others → Unknown (default fallback)
    CASE p.DELIVERY_ID
        WHEN 1 THEN 'Delivered'
        WHEN 2 THEN 'Shipped'
        WHEN 3 THEN 'In Transit'
        WHEN 4 THEN 'Pending'
        ELSE 'Unknown'
    END AS CURRENT_DELIVERY_STATUS,

    -- Delivery Tracking Info
    d.DELIVERY_DATE,
    d.COURIER_NAME,
    d.TRACKING_ID,
    d.DELIVERY_REMARKS

FROM {{ source('raw_cust', 'cust') }} c
JOIN {{ source('raw_prod', 'PRODUCT') }} p
    ON c.CUSTOMER_ID = p.CUSTOMER_ID

LEFT JOIN {{ source('raw_cust', 'delivery') }} d
    ON p.PRODUCT_ID = d.PRODUCT_ID
