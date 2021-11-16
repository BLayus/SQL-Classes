/* Crie uma view (SELLER_STATS) para mostrar por fornecedor, a quantidade de itens enviados,
 o tempo médio de postagem após a aprovação da compra, a quantidade total de pedidos de cada Fornecedor, 
note que trabalharemos na mesma query com 2 granularidades diferentes. */

CREATE VIEW `global-course-329623.Olist.SELLER_STATS` as 
SELECT 
    Pedidos,
    Fornecedores,
    QtdItens,
    SUM(QtdItens) OVER (PARTITION BY Fornecedores) AS ItensEnviados,
    AVG(DiasPostagem) Over (PARTITION BY  Fornecedores) AS MediaPostagem
 
FROM (
SELECT 
    T1.order_id AS Pedidos,
    COUNT (L1.product_id) AS QtdItens,
    T1.order_approved_at  AS DataAprov,
    T1.order_delivered_carrier_date AS DataPostagem,
    DATE_DIFF(T1.order_delivered_carrier_date, T1.order_approved_at, Day) As DiasPostagem,
    L1.seller_id AS Fornecedores

FROM `global-course-329623.Olist.olist_orders_dataset` AS T1
INNER JOIN `global-course-329623.Olist.olist_order_items_dataset` AS L1
ON T1.order_id = L1.order_id

WHERE T1.order_status = 'shipped'
GROUP BY Fornecedores,Pedidos, DataAprov, DataPostagem, DiasPostagem
)
ORDER BY ItensEnviados DESC