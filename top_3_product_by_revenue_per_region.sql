#•	Top 3 products by revenue per region – in single query

  WITH product_revenue AS (
  SELECT region, product_id, SUM(revenue) AS tot_revenue
  FROM sales
  GROUP BY region, product_id
),
top_product AS (
  SELECT region, product_id, tot_revenue,
         ROW_NUMBER() OVER (PARTITION BY region ORDER BY tot_revenue DESC) AS rank
  FROM product_revenue
)
SELECT region, product_id, tot_revenue
FROM top_product
WHERE rank <= 3;
