# To calculate the cumulative sum of sales amount by date, you can use the following SQL query:


SELECT 
    Date, 
    Amount, 
    SUM(Amount) OVER (ORDER BY Date) AS CumulativeAmount
FROM 
    Sales;


#This query works by using a window function, SUM(Amount) OVER (ORDER BY Date), which calculates the cumulative sum of the sales amount ordered by date. The result is a running total for each date.

How it Works:

- The SUM function calculates the sum of the Amount column.
- The OVER clause specifies the window over which the SUM function is applied.
- ORDER BY Date ensures that the cumulative sum is calculated in chronological order.

Example Output:

If your Sales table has the following data ¹:
| Date       | Amount |
|------------|--------|
| 2022-01-01 | 100    |
| 2022-01-02 | 200    |
| 2022-01-03 | 300    |

The query would return:

| Date       | Amount | CumulativeAmount |
|------------|--------|------------------|
| 2022-01-01 | 100    | 100              |
| 2022-01-02 | 200    | 300              |
| 2022-01-03 | 300    | 600              |

This shows the cumulative sum of sales amount for each date, providing a running total. You can also use this query to calculate cumulative sums for specific products or regions by adding a PARTITION BY clause to the OVER function
