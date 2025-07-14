SELECT
product_id, 
product_name,
store_id,
brand_name,
category_name,
product_quantity_stock
FROM {{ ref("stg_localbike__products") }} as products
LEFT JOIN {{ ref("stg_localbike__brands") }} as brands
ON products.brand_id = brands.brand_id
LEFT JOIN {{ ref("stg_localbike__categories") }} as categories
ON products.category_id = categories.category_id
LEFT JOIN {{ ref("stg_localbike__stocks") }} as stocks
ON products.product_id = stocks.product_id_stock