WITH churned_customers AS (
	SELECT
		customerkey,
		max(cleaned_name) AS cleaned_name ,
		MAX(orderdate) AS last_purchase_date,
		-- (SELECT MAX(orderdate) FROM cohort_analysis) = 2024-04-20
CASE
			WHEN AGE((SELECT MAX(orderdate) FROM cohort_analysis), MAX(orderdate)) > INTERVAL '6 months' THEN 'Churned'
			ELSE 'Active'
		END AS customer_status,
		cohort_year 
	FROM
		cohort_analysis
	GROUP BY
		customerkey, cohort_year 
	HAVING
		MIN(orderdate) < (
			SELECT
				MAX(orderdate)
			FROM
				cohort_analysis
		) - INTERVAL '6months'
	ORDER BY
		customerkey
)


SELECT 
cohort_year ,
customer_status,
count(customerkey) AS num_customers,
SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year) AS total_customers,
round(100* count(customerkey)/ SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year) ,2) AS status_percentage

FROM churned_customers 


GROUP BY cohort_year, customer_status 

-- outputs total customers, customer status with status percentage and num of customers
-- with respect to their Cohort Year.

