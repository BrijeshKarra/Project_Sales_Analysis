SELECT 

TO_CHAR(orderdate, 'yyyy-mm') AS monthly,
SUM(total_net_revenue) AS monthly_revenue,
Count(DISTINCT customerkey) AS monthly_customers
FROM cohort_analysis
GROUP BY monthly

-- outputs monthly total revenue and customers respectively