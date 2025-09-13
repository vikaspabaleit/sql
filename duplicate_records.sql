# Write a query to detect duplicate records

WITH duplicate_records AS (
    SELECT emp_id,
           emp_name,
           city,
           email,
           phone,
           ROW_NUMBER() OVER (
               PARTITION BY emp_id, emp_name, city, email, phone
               ORDER BY emp_id
           ) AS rn
    FROM employee
)
SELECT *
FROM duplicate_records
WHERE rn = 1;
