SELECT

    customer_id,

    COUNT(order_id) AS total_orders,

    MIN(order_date) AS first_order_date,

    MAX(order_date) AS last_order_date

FROM {{ ref('stg_orders') }}

GROUP BY customer_id