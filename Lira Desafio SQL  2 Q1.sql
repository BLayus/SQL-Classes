/*  
Que retorne a quantidade de items vendidos em cada categorias por estado em que o cliente se encontra,
mostrando somente categorias que tenham vendido uma quantidade de items acima de 1000 items.
*/

SELECT 
    COUNT(product_category_name) AS TotalCategoria,
    customer_state AS EstadoCliente,
    product_category_name As NomeCategoria,

    FROM `global-course-329623.Olist.olist_orders_dataset` 
    AS T1
    LEFT JOIN  `global-course-329623.Olist.olist_customers_dataset`
    AS L1 ON T1.customer_id = L1.customer_id

    LEFT JOIN `global-course-329623.Olist.olist_order_items_dataset` 
    AS L2 ON T1.order_id = L2.order_id

    LEFT JOIN `global-course-329623.Olist.olist_products_dataset`
    AS L3 on L2.product_id = L3.product_id

    Group By EstadoCliente, NomeCategoria
    HAVING TotalCategoria > 1000
    Order By EstadoCliente, TotalCategoria DESC