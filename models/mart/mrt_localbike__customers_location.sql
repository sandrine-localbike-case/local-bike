SELECT
customer_city,
customer_state_code,
COUNT (distinct customers.customer_id) as nb_customers
FROM {{ ref("int_localbike__customers") }} as customers
GROUP BY 
customer_city,
customer_state_code
ORDER BY nb_customers DESC