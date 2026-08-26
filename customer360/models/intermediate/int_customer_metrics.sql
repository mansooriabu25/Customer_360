WITH customer_revenue AS (
    SELECT
        *
    FROM
        {{ ref('int_customer_revenue') }}
),
customer_activity AS (
    SELECT
        *
    FROM
        {{ ref('int_customer_activity') }}
)
SELECT
    r.customer_id,
    r.total_orders,
    r.lifetime_revenue,
    r.average_order_value,
    COALESCE(
        A.total_sessions,
        0
    ) AS total_sessions,
    COALESCE(
        A.total_page_views,
        0
    ) AS total_page_views,
    A.avg_session_duration,
    CASE
        WHEN COALESCE(
            A.total_sessions,
            0
        ) = 0 THEN 0
        ELSE ROUND(
            r.lifetime_revenue / A.total_sessions,
            2
        )
    END AS revenue_per_session,
    ROUND(
        r.average_order_value * r.total_orders,
        2
    ) AS cltv,
    CASE
        WHEN r.lifetime_revenue >= 20000 THEN 'Gold'
        WHEN r.lifetime_revenue >= 5000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_segment
FROM
    customer_revenue r
    LEFT JOIN customer_activity A
    ON r.customer_id = A.customer_id
