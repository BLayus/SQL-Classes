/* retorne pedidos que foram feitos somente no ano de 2017. */

SELECT 
order_id AS Pedidos,
EXTRACT(YEAR FROM order_purchase_timestamp) AS YEAR,
FROM `global-course-329623.Olist.olist_orders_dataset` 
GROUP BY YEAR, Pedidos
HAVING YEAR = 2017