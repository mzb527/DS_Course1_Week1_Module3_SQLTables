-- Identify top employees with high-credit customers
SELECT e.employee_number, e.first_name, e.last_name, COUNT(c.customer_number) AS num_customers
FROM employees e
JOIN customers c ON e.employee_number = c.sales_rep_employee_number
WHERE c.credit_limit > 90000
GROUP BY e.employee_number, e.first_name, e.last_name
ORDER BY num_customers DESC
LIMIT 4;

-- Find employees who sold underperforming products
SELECT DISTINCT e.employee_number, e.first_name, e.last_name, o.city, o.office_code
FROM employees e
JOIN offices o ON e.office_code = o.office_code
JOIN customers c ON e.employee_number = c.sales_rep_employee_number
JOIN orders ord ON c.customer_number = ord.customer_number
JOIN order_details od ON ord.order_number = od.order_number
WHERE od.product_code IN (
    SELECT product_code
    FROM order_details
    JOIN orders ON order_details.order_number = orders.order_number
    GROUP BY product_code
    HAVING COUNT(DISTINCT orders.customer_number) < 20
);