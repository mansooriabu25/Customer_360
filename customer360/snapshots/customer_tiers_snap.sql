{% snapshot customer_tier_snapshot %}
    {{ config(
        target_schema = 'snapshots',
        unique_key = 'customer_id',
        strategy = 'check',
        check_cols = [ 'customer_segment' ]
    ) }}

    SELECT
        customer_id,
        customer_segment
    FROM
        {{ ref('int_customer_metrics') }}
{% endsnapshot %}
