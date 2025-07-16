/* Write SQL to find the top 3 drivers by average rating, only including drivers with more than 100 trips. */

WITH average_driver AS (
  SELECT driver_id, driver_nm, AVG (average_rating) AS average_rating
  FROM driver_table WHERE trips > 100
  GROUP BY driver_id, driver_nm
),
Ranked_data AS (
  SELECT driver_id, driver_nm, average_rating, ROW_NUMBER () OVER (ORDER BY average_rating DESC) AS rating_rank 
  FROM average_driver
)
SELECT driver_id, driver_nm, average_rating
FROM Ranked_data
WHERE rating_rank <= 3;
