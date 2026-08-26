SELECT

    order_item_id,

    order_id,

    product_id,

    quantity,

    item_amount

FROM {{ source('raw','order_items') }}