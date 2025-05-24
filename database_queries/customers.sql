-- Find customers who have NOT placed an order
SELECT c.first_name, c.last_name, c.phone, c.sales_rep_employee_number
FROM customers c
LEFT JOIN orders o ON c.customer_number = o.customer_number
WHERE o.customer_number IS NULL
ORDER BY c.last_name;

-- Count the number of customers per office location
SELECT o.office_code, o.city, COUNT(DISTINCT c.customer_number) AS n_customers
FROM customers c
JOIN employees e ON c.sales_rep_employee_number = e.employee_number
JOIN offices o ON e.office_code = o.office_code
GROUP BY o.office_code, o.city;