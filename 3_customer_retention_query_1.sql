SELECT
customerkey,
max(cleaned_name) AS cleaned_name ,
MAX(orderdate) AS last_purchase_date,
-- (SELECT MAX(orderdate) FROM cohort_analysis) = 2024-04-20
CASE
	WHEN AGE((SELECT MAX(orderdate) FROM cohort_analysis), MAX(orderdate)) >= INTERVAL'6 months' THEN 'Churned'
	ELSE 'Active'
END AS customer_status
FROM cohort_analysis
GROUP BY customerkey
HAVING MIN(orderdate) < (SELECT MAX(orderdate) FROM cohort_analysis) - INTERVAL'6months'
ORDER BY customerkey


-- outputs the list of churned and active customers
