{% snapshot product_price_snapshot %}
    {{ config(
        target_schema = 'snapshots',
        unique_key = 'product_id',
        strategy = 'check',
        check_cols = [ 'product_name', 'category', 'unit_price' ]
    ) }}

    SELECT
        product_id,
        product_name,
        category,
        unit_price
    FROM
        {{ source(
            'raw',
            'products'
        ) }}
{% endsnapshot %}
