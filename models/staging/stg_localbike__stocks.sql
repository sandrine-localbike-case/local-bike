SELECT 
CONCAT(store_id ,'_',product_id) as store_product_id,
store_id,
product_id as product_id_stock,
quantity as product_quantity_stock
FROM {{ source('localbike', 'stocks') }}