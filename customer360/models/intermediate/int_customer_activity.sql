SELECT

    customer_id,

    COUNT(session_id) AS total_sessions,

    SUM(page_views) AS total_page_views,

    AVG(session_duration) AS avg_session_duration

FROM {{ ref('stg_sessions') }}

GROUP BY customer_id