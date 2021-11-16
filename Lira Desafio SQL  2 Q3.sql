/*
Mostre o valor vendido total de cada vendedor(seller_id) em cada uma das categorias de produtos, 
somente retornando os vendedores que nesse somatório e agrupamento venderam mais de $1000, 
desejamos ver a categoria do produto e os vendedores,
para cada uma dessas categorias mostre seus valores de venda de forma decrescente.
*/

SELECT 
    seller_id As Vendedores,
    SUM(price) As SomaVendas,
    product_category_name As Categorias

FROM `global-course-329623.Olist.olist_order_items_dataset` AS T1

LEFT JOIN `global-course-329623.Olist.olist_orders_dataset` AS L1
ON T1.order_id = L1.order_id

LEFT JOIN `global-course-329623.Olist.olist_products_dataset` AS L2
ON T1.product_id = L2.product_id

GROUP BY Vendedores, Categorias
HAVING SomaVendas > 1000
ORDER BY SomaVendas DESC, Categorias