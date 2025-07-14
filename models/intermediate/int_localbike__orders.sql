SELECT
orders.order_id,
customer_id,
store_id, 
staff_id, 
product_id_sold,
order_date,
shipped_date,
product_quantity_sold,
CAST(SUM(total_order_product_amount) AS INT) as total_order_product_amount
FROM {{ ref("stg_localbike__orders") }} as orders
LEFT JOIN {{ ref("stg_localbike__orderitems") }} as orderitems
ON orders.order_id = orderitems.order_id
GROUP BY
order_id,
customer_id,
store_id,
staff_id,
product_id_sold,
order_date,
shipped_date,
product_quantity_sold