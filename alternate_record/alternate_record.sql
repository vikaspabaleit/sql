WITH numbered_rows AS (
  SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS rn
  FROM your_table
)
SELECT *
FROM numbered_rows
WHERE MOD(rn, 2) = 1;  -- Use = 0 for even rows

/*Input*/
| id | name    | department |
| -- | ------- | ---------- |
| 1  | Alice   | HR         |
| 2  | Bob     | IT         |
| 3  | Charlie | Sales      |
| 4  | David   | IT         |
| 5  | Emma    | HR         |
| 6  | Frank   | Sales      |

/*OutPut*/
| id | name    | department |
| -- | ------- | ---------- |
| 1  | Alice   | HR         |
| 3  | Charlie | Sales      |
| 5  | Emma    | HR         |
