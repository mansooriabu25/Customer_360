SELECT

    campaign_id,

    campaign_name,

    SUM(spend) AS total_spend,

    SUM(clicks) AS total_clicks,

    SUM(impressions) AS total_impressions

FROM {{ ref('stg_campaigns') }}

GROUP BY 1,2
