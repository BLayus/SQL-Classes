/* Retorne os campos da tabela de produtos e calcule o volume de cada produto em um novo campo */

SELECT 
     product_id AS Id,
     product_length_cm AS Comp,
     product_height_cm AS Alt,
     product_width_cm AS Lar,
     product_height_cm * product_length_cm * product_width_cm As VolumeCM3,
     product_height_cm * product_length_cm * product_width_cm / 1000000 AS VolumeM3
FROM olist_products_dataset