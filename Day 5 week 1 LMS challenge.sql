-- find the first order (by date) for each customer
USE ABC_DATA;

SELECT DISTINCT customer_id,order_id,order_date
FROM orders
ORDER BY order_date;



SELECT DISTINCT customer_id,order_date
FROM orders
ORDER BY order_date;

-- FIND THE TOTAL REVENUE PER PRODUCT
SELECT p.product_name,
        p.price * sum(oi.quantity) AS total_revenue
        FROM products as p
        JOIN order_items oi ON oi.product_id = p.product_id
        GROUP BY p.price, p.product_id
        ORDER BY 2 desc;
        
-- FIND THE DAY WITH THE HIGHEST  REVENUE
SELECT sum(order_id),order_date
FROM orders
GROUP BY order_date
UNION
SELECT sum(order_id),quantity
FROM order_items
UNION
SELECT (sum(product_id)*price)
FROM products
JOIN products ON products.product_id=orders.order_id;

       


