-- List all customer payments, sorted by payment amount
SELECT c.first_name, c.last_name, p.amount, p.payment_date
FROM payments p
JOIN customers c ON p.customer_number = c.customer_number
ORDER BY CAST(p.amount AS DECIMAL) DESC;