SELECT

    lead_id,

    customer_email,

    lead_source,

    created_date

FROM {{ source('raw','leads') }}