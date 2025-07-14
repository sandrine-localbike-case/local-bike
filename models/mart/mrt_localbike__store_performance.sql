SELECT 
store_name,
store_state_code,
COUNT(distinct customer_id) as nb_customers,
COUNT(distinct order_id) as nb_orders,
SUM(product_quantity_sold) AS product_quantity_sold,
SUM(product_quantity_stock) AS product_quantity_stock,
SUM(total_order_product_amount) as total_order_amount,
CAST(AVG(total_order_product_amount) AS INT) as average_order_value,
COALESCE(ROUND((SAFE_DIVIDE(SUM(product_quantity_sold), SUM(stores.product_quantity_stock)))*100,1),0) AS sell_through_rate
FROM {{ ref("int_localbike__orders") }} AS orders
JOIN {{ ref("int_localbike__stores") }} AS stores
ON orders.store_id = stores.store_id
AND orders.product_id_sold = stores.product_id_stock
AND orders.staff_id = stores.staff_id
GROUP BY 
store_name,
store_state_code
ORDER BY nb_orders DESC