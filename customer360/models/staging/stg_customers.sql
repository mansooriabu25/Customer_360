SELECT

    customer_id,
    first_name,
    last_name,
    email,
    city,
    country,
    signup_date

FROM {{ source('raw','customers') }}