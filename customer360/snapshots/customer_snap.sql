{% snapshot customer_snapshot %}
    {{ config(
        target_schema = 'snapshots',
        unique_key = 'customer_id',
        strategy = 'check',
        check_cols = [ 'first_name', 'last_name', 'email', 'city', 'country' ]
    ) }}

    SELECT
        customer_id,
        first_name,
        last_name,
        email,
        city,
        country,
        signup_date
    FROM
        {{ source(
            'raw',
            'customers'
        ) }}
{% endsnapshot %}
