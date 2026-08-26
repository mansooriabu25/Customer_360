SELECT

    customer_id,

    COUNT(order_id) AS total_orders,

    SUM(total_amount) AS lifetime_revenue,

    AVG(total_amount) AS average_order_value

FROM {{ ref('stg_orders') }}

GROUP BY customer_id