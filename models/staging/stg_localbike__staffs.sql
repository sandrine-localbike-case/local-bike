SELECT
staff_id,
first_name as staff_first_name,
last_name as staff_last_name,
email as staff_email,
phone as staff_phone,
active as is_active,
store_id,
COALESCE(manager_id, 'other') as manager_id
FROM {{ source('localbike', 'staffs') }}