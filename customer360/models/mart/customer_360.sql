SELECT

    c.customer_id,

    c.first_name,

    c.last_name,

    c.email,

    c.city,

    c.country,

    m.total_orders,

    m.lifetime_revenue,

    m.average_order_value,

    m.revenue_per_session,

    m.cltv,

    m.customer_segment,

    o.first_order_date,

    o.last_order_date,

    a.total_sessions,

    a.total_page_views,

    a.avg_session_duration

FROM {{ ref('dim_customer') }} c

LEFT JOIN {{ ref('int_customer_metrics') }} m
    ON c.customer_id = m.customer_id

LEFT JOIN {{ ref('int_customer_orders') }} o
    ON c.customer_id = o.customer_id

LEFT JOIN {{ ref('int_customer_activity') }} a
    ON c.customer_id = a.customer_id