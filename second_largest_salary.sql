#•	To find the second largest salary from a table employee?

WITH salary_data AS (
  seelct emp_name,emp_id,salary,
  DENSE_RANK() over(order by salary DESC ) rank_sal from employee 
  )
select emp_name,emp_id,salary from salary_data 
  where rank_sal = 2; 
