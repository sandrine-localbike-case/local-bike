SELECT 
customer_id,
customer_city,
customer_state_code
FROM {{ ref("stg_localbike__customers") }}