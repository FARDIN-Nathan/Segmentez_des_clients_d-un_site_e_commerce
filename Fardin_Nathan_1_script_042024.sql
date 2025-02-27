SELECT * FROM orders
WHERE order_status !="canceled" 
AND order_approved_at >= (SELECT DATE(MAX(order_approved_at), '-3 month') FROM orders)
AND JULIANDAY(order_estimated_delivery_date) - JULIANDAY(order_delivered_customer_date) < -3;


SELECT seller_id,SUM(price)  FROM  order_items oi
GROUP by seller_id
HAVING SUM(price) > 100000;


DELETE FROM order_items
WHERE SUBSTR(shipping_limit_date, 1, 4) > '2018';


SELECT seller_id,MAX(shipping_limit_date), COUNT(*) as total_commandes
FROM order_items oi
WHERE shipping_limit_date > DATE((SELECT MAX(shipping_limit_date) FROM order_items oi), '-3 month')
GROUP BY seller_id
HAVING COUNT(*) > 30;


WITH nbr_commande AS ( SELECT seller_id, COUNT(*) AS total_commande FROM order_items 
    WHERE shipping_limit_date > DATE((SELECT MAX(shipping_limit_date)FROM order_items), '-12 month')
    GROUP BY seller_id
    HAVING COUNT(*) > 30)
SELECT sellers.seller_zip_code_prefix, AVG(order_reviews.review_score) AS avg_review_score FROM sellers
INNER JOIN order_items ON sellers.seller_id = order_items.seller_id
INNER JOIN order_reviews ON order_items.order_id = order_reviews.order_id
WHERE sellers.seller_id IN (SELECT seller_id FROM nbr_commande)
GROUP BY sellers.seller_zip_code_prefix
ORDER BY avg_review_score ASC
LIMIT 5;


SELECT 
    customers.customer_id,
    customers.customer_city,
    customers.customer_state, 
    MAX(orders.order_purchase_timestamp) AS recence,
    SUM(order_items.price) AS montant,
    COUNT(orders.order_id) AS frequence,
    ROUND(JULIANDAY(orders.order_estimated_delivery_date) - JULIANDAY(orders.order_delivered_customer_date)) AS retard_avance,
    AVG(order_reviews.review_score) AS average_review_score
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN order_items ON orders.order_id = order_items.order_id
LEFT JOIN order_reviews ON orders.order_id = order_reviews.order_id
GROUP BY customers.customer_id, customers.customer_city, customers.customer_state,retard_avance
HAVING 
    MAX(orders.order_purchase_timestamp) >= 
    DATE(MAX(orders.order_purchase_timestamp), '-1 year');
