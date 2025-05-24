-- Count orders per product and total units sold
SELECT p.product_name, COUNT(od.order_number) AS numorders, SUM(od.quantityOrdered) AS totalunits
FROM order_details od
JOIN products p ON od.product_code = p.product_code
JOIN orders o ON od.order_number = o.order_number
GROUP BY p.product_name
ORDER BY totalunits DESC;

-- Find the number of customers ordering each product
SELECT p.product_name, p.product_code, COUNT(DISTINCT o.customer_number) AS numpurchasers
FROM order_details od
JOIN products p ON od.product_code = p.product_code
JOIN orders o ON od.order_number = o.order_number
GROUP BY p.product_name, p.product_code
ORDER BY numpurchasers DESC;