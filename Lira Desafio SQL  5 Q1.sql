CREATE INDEX "IDX_Customers" ON "olist_customers_dataset" 
	"product_id" ASC,
	"customer_id"	ASC
	
CREATE INDEX "IDX_geolocation" ON "olist_geolocation_dataset" 
	"geolocation_state"	ASC,
	"geolocation_zip_code_prefix" ASC
	
CREATE INDEX "IDX_order_items" ON "olist_order_items_dataset" 
	"product_id" ASC,
	"seller_id"	ASC,
	"order_id" ASC,
	"product_id" ASC
	
CREATE INDEX "IDX_Payments" ON "olist_order_payments_dataset" 
	"payment_type" ASC,
	"order_id" ASC

CREATE INDEX "IDX_order_reviews" ON "olist_order_reviews_dataset" 
	"review_score" ASC,
	"order_id" ASC
	
CREATE INDEX "IDX_orders" ON "olist_orders_dataset" 
	"order_status" ASC,
	"order_id" ASC,
	"customer_id" ASC,

	CREATE INDEX "IDX_products" ON "olist_products_dataset" 
	"product_category_name"	ASC,
	"product_id" ASC
	
CREATE INDEX "IDX_sellers" ON "olist_sellers_dataset" 
	"seller_state" ASC,
	"seller_city" ASC,
	"seller_id" ASC