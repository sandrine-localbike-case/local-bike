SELECT 
order_id,
customer_id,
order_status as order_status_id,
order_date,
required_date,
shipped_date,
store_id,
staff_id
FROM {{ source('localbike', 'orders') }}