/* Queremos saber sobre as categorias válidas, suas soma total dos valores de vendas, 
um ranqueamento de maior valor para menor valor junto com o somatório acumulado dos valores 
pela mesma regra do ranqueamento. */

SELECT 
    Categorias,
    RANK() OVER (order by ValorPagto DESC) AS RankPagto,
    ValorPagto,
    ROUND(SUM(ValorPagto) OVER (order by ValorPagto DESC),2) As SomaAcumulada
    
FROM(
    SELECT 
T1.product_category_name AS Categorias,
ROUND(SUM(L1.price),2) As ValorPagto,

FROM `global-course-329623.Olist.olist_products_dataset` AS T1
INNER JOIN `global-course-329623.Olist.olist_order_items_dataset`
AS L1 ON T1.product_id = L1.product_id
INNER JOIN `global-course-329623.Olist.olist_order_payments_dataset`
AS L2 ON L1.order_id = L2.order_id

WHERE T1.product_category_name IS NOT NULL 
AND L2.payment_value <> 0
GROUP BY T1.product_category_name
ORDER BY Categorias, ValorPagto
)
 