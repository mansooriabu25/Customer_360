{{ config(
    materialized = 'incremental',
    unique_key = 'order_id'
) }}

SELECT
    o.order_id,
    o.customer_id,
    oi.product_id,
    o.order_date,
    oi.quantity,
    oi.item_amount
FROM
    {{ ref('stg_orders') }}
    o
    LEFT JOIN {{ ref('stg_order_items') }}
    oi
    ON o.order_id = oi.order_id

{% if is_incremental() %}
WHERE
    o.order_date > (
        SELECT
            COALESCE(MAX(order_date), '1900-01-01')
        FROM
            {{ this }})
        {% endif %}
