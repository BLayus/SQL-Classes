/* selecione os dados da tabela de pagamentos onde só apareçam os tipos de pagamento “VOUCHER” e “BOLETO” */
SELECT
payment_type AS ModoPagamento,
order_id AS Cliente
FROM olist_order_payments_dataset
WHERE payment_type = 'voucher'
OR payment_type = 'boleto'