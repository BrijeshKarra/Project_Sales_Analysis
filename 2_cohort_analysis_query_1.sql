SELECT
	cohort_year,
	SUM(total_net_revenue) AS total_revenue,
	COUNT( DISTINCT customerkey) AS total_customers,
	SUM(total_net_revenue)/count(DISTINCT customerkey) AS customer_revenue	
FROM
	cohort_analysis 
WHERE orderdate = first_purchase_date
GROUP BY
	cohort_year

-- outputs YEARLY total revenue, customer revenue and total customers respectively