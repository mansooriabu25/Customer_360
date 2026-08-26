SELECT

    session_id,

    customer_id,

    visit_date,

    traffic_source,

    page_views,

    session_duration

FROM {{ source('raw','website_sessions') }}