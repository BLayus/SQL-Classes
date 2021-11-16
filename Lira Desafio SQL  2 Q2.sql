/*
Mostre os 5 clientes (customer_id) que gastaram mais dinheiro em compras,
qual foi o valor total de todas as compras deles, quantidade de compras, e valor médio gasto por compras, 
ordene os mesmos por ordem decrescente pela media do valor de compra.
*/

SELECT 
    COUNT(T1.order_id) As QtdCompras,
    SUM(L1.payment_value) AS SomaPreco,
    L2.customer_unique_id AS Clientes,
    AVG(L1.payment_value) As MediaGastos

FROM `global-course-329623.Olist.olist_orders_dataset` AS T1

LEFT JOIN `global-course-329623.Olist.olist_order_payments_dataset` 
AS L1 ON T1.order_id = L1.order_id
LEFT JOIN `global-course-329623.Olist.olist_customers_dataset` 
AS L2 On  T1.customer_id = L2.customer_id
GROUP BY Clientes
ORDER BY SomaPreco DESC 
LIMIT 100


