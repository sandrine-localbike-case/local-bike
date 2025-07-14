SELECT
stores.store_id,
COALESCE(store_name, "others") as store_name,
staff_id,
COALESCE(staff_first_name, "others") as staff_first_name,
COALESCE(staff_last_name, "others") as staff_last_name,
manager_id,
store_city,
store_state_code,
product_id_stock,
COALESCE(product_quantity_stock,0) as product_quantity_stock
FROM {{ ref("stg_localbike__stores") }} as stores
LEFT JOIN {{ ref("stg_localbike__stocks") }} as stocks
ON stores.store_id = stocks.store_id
LEFT JOIN {{ ref("stg_localbike__staffs") }} as staffs
ON stores.store_id = staffs.store_id