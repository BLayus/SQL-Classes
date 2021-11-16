/* Crie uma query SQL que me retorne todos os pagamentos do cliente, com suas datas de aprovação, valor da compra 
e o valor total que o cliente já gastou em todas as suas compras, me mostrando somente os clientes onde
 o valor da compra é diferente do valor total já gasto.*/

SELECT 
    L1.customer_unique_id AS Cliente,
    T1.order_id AS Pedido,
    DATE(T1.order_approved_at) DataAprov,
    L3.payment_value AS ValorCompra,
    SUM(L3.payment_value) As SomaPagtoCliente,
    

    FROM `global-course-329623.Olist.olist_orders_dataset` AS T1
    INNER JOIN `global-course-329623.Olist.olist_customers_dataset` AS L1 ON T1.customer_id = L1.customer_id
    INNER JOIN `global-course-329623.Olist.olist_order_items_dataset` AS L2 ON T1.order_id = L2.order_id
    INNER JOIN `global-course-329623.Olist.olist_order_payments_dataset` AS L3 ON T1.order_id = L3.order_id

    GROUP BY Cliente, DataAprov, ValorCompra, Pedido
    HAVING SomaPagtoCliente <> ValorCompra
    ORDER BY SomaPagtoCliente DESC 