SELECT
    customer_id,
    customer_segment
FROM
    {{ ref('int_customer_metrics') }}
