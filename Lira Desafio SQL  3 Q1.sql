/*Crie uma tabela analítica de todos os itens que foram vendidos, somente mostrando pedidos interestaduais.
Queremos saber quantos dias os fornecedores demoram para postar o produto, se o produto chegou ou não dentro do prazo.*/

SELECT 
    T1.order_id AS Pedidos,
    L3.seller_id AS Fornecedor,
    DATE (T1.order_purchase_timestamp) As DataPedido,
    DATE (T1.order_delivered_carrier_date) AS DataPostagem,
    DATE_DIFF(order_delivered_carrier_date, order_approved_at, DAY) AS  TempoPostagemDias,
    L3.seller_state AS UFFornecedor,
    L1.customer_state AS UFCliente,

    CASE WHEN T1.order_delivered_customer_date <= T1.order_estimated_delivery_date Then 'EntPrazo'
         When T1.order_delivered_customer_date > T1.order_estimated_delivery_date Then 'EntAtrasada' END AS Entregue

    FROM `global-course-329623.Olist.olist_orders_dataset` AS T1
    INNER JOIN `global-course-329623.Olist.olist_customers_dataset` AS L1 ON T1.customer_id = L1.customer_id
    INNER JOIN `global-course-329623.Olist.olist_order_items_dataset` AS L2 ON T1.order_id = L2.order_id
    INNER JOIN `global-course-329623.Olist.olist_sellers_dataset` AS L3 ON L2.seller_id = L3.seller_id

    WHERE L3.seller_state <> L1.customer_state
    AND T1.order_delivered_customer_date is not null
    ORDER BY TempoPostagemDias DESC 
