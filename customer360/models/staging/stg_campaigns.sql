SELECT

    campaign_id,

    campaign_name,

    spend,

    clicks,

    impressions,

    campaign_date

FROM {{ source('raw','facebook_campaigns') }}