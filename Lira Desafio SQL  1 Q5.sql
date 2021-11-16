/* encontre os clientes do estado de SP e que não morem na cidade de São Paulo */

SELECT *
    FROM  `global-course-329623.Olist.olist_customers_dataset`
    WHERE customer_state = 'SP'
    AND customer_city <> 'sao paulo'