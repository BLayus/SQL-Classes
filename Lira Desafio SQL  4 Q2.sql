/* Queremos dar um cupom de 10% do valor da última compra do cliente. 
Porém os clientes elegíveis a este cupom devem ter feito uma compra anterior a última 
(A partir da data de aprovação do pedido) que tenha sido maior ou igual o valor da última compra 
e também queremos saber os valores dos cupons para cada um dos clientes elegíveis. 

Encontrar a última compra do cliente
Encontrar a penúltima compra do cliente
Valor da última e de penúltima compra
Data de aprovação
*/

SELECT *,
ValorPagto * 0.1 AS ValorCupom
FROM (

SELECT *,

LAG(ValorPagto) OVER (Partition By customer_unique_id order by order_approved_at ) AS ValorAnterior,
ROW_NUMBER() OVER (PARTITION BY customer_unique_id order by order_approved_at DESC )  AS OrdemPedidos

FROM(
    SELECT 
L2.customer_unique_id,
L1.order_id,
L1.order_approved_at,
SUM (T1.payment_value) As ValorPagto,
COUNT(L1.order_id) Over (PARTITION BY L2.customer_unique_id) As QtdPedidos

From `global-course-329623.Olist.olist_order_payments_dataset` AS T1
INNER JOIN `global-course-329623.Olist.olist_orders_dataset` AS L1 ON T1.order_id=L1.order_id
INNER JOIN `global-course-329623.Olist.olist_customers_dataset` AS L2 ON L2.customer_id=L1.customer_id
WHERE L1.order_approved_at IS NOT NULL
GROUP BY L2.customer_unique_id, L1.order_approved_at,L1.order_id

ORDER BY L2.customer_unique_id, L1.order_approved_at)
WHERE QtdPedidos>1
 )WHERE OrdemPedidos = 1 AND ValorAnterior >= ValorPagto
