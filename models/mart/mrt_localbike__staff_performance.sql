SELECT
staff_first_name,
staff_last_name,
COUNT(distinct order_id) as nb_orders,
SUM(product_quantity_sold) as product_quantity_sold,
CAST(SUM(total_order_product_amount) AS INT) as total_order_amount,
CAST(AVG(total_order_product_amount) AS INT) as average_order_value
FROM {{ ref("int_localbike__orders") }}  AS orders
JOIN {{ ref("int_localbike__stores") }}  AS stores
ON orders.store_id = stores.store_id
AND orders.staff_id = stores.staff_id
AND orders.product_id_sold = stores.product_id_stock
GROUP BY 
staff_first_name,
staff_last_name
ORDER BY nb_orders DESC