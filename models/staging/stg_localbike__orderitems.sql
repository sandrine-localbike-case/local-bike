SELECT 
CONCAT(order_id, '_' ,item_id) as order_item_id,
order_id,
item_id,
product_id as product_id_sold,
quantity as product_quantity_sold,
list_price as product_list_price,
ROUND(list_price * (1 - discount / 100), 2) AS product_paid_price,
ROUND(quantity * list_price * (1 - discount / 100), 2) AS total_order_product_amount,
CAST(discount*100 as int) as discount_percentage
FROM {{ source('localbike', 'order_items') }}