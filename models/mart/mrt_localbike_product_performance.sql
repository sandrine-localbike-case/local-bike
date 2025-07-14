SELECT
product_id,
product_name,
category_name,
brand_name,
SUM(stores.product_quantity_stock) as product_quantity_stock,
SUM(product_quantity_sold) as product_quantity_sold,
CAST(SAFE_DIVIDE(SUM(product_quantity_sold), COUNT (DISTINCT order_id)) AS INT) AS nb_products_per_orders,
SUM(total_order_product_amount) AS total_order_product_amount,
CAST((AVG(total_order_product_amount / product_quantity_sold)) AS INT) AS avg_order_value_per_product,
COALESCE(ROUND((SAFE_DIVIDE(SUM(product_quantity_sold), SUM(stores.product_quantity_stock)))*100,1),0) AS sell_through_rate
FROM {{ ref("int_localbike__orders") }}  AS orders
LEFT JOIN {{ ref("int_localbike__products") }} AS products
ON orders.product_id_sold = products.product_id
AND orders.store_id = products.store_id
LEFT JOIN `dbt_skerfers_intermediate.int_localbike__stores` AS stores
ON orders.store_id = stores.store_id
AND orders.product_id_sold = stores.product_id_stock
AND orders.staff_id = stores.staff_id
GROUP BY
product_id,
product_name,
category_name,
brand_name
ORDER BY 
product_quantity_sold DESC