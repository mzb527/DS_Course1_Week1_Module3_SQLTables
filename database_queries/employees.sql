-- List employees working in the Boston office
SELECT e.first_name, e.last_name, e.job_title
FROM employees e
JOIN offices o ON e.office_code = o.office_code
WHERE o.city = 'Boston';

-- Identify offices with zero employees
SELECT o.office_code, o.city
FROM offices o
LEFT JOIN employees e ON o.office_code = e.office_code
WHERE e.office_code IS NULL;

-- List all employees and their office location (if applicable)
SELECT e.first_name, e.last_name, o.city, o.state
FROM employees e
LEFT JOIN offices o ON e.office_code = o.office_code
ORDER BY e.first_name, e.last_name;