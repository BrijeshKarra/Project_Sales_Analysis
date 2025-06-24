WITH customer_ltv AS (
	SELECT
		customerkey,
		cleaned_name,
		SUM(total_net_revenue) AS total_ltv
	FROM
		cohort_analysis
	GROUP BY
		customerkey,
		cleaned_name
),
customer_segments AS (
	SELECT
		percentile_cont(0.25) WITHIN GROUP (
		ORDER BY
			c.total_ltv
		) AS ltv_25_percentile,
		percentile_cont(0.75) WITHIN GROUP (
		ORDER BY
			c.total_ltv
		) AS ltv_75_percentile
	FROM
		customer_ltv c
), 
segment_values AS (
	SELECT
		cl.*,
		CASE
			WHEN cl.total_ltv < cs.ltv_25_percentile THEN '1-Low-Value'
			WHEN cl.total_ltv >= cs.ltv_75_percentile THEN '3-High-Value'
			ELSE '2-Mid-Value'
		END AS customer_segment
	FROM
		customer_ltv AS cl,
		customer_segments AS cs
)
SELECT
	
	customer_segment ,
	SUM(total_ltv) AS total_ltv ,
	SUM(total_ltv) / (SELECT SUM(total_ltv) FROM segment_values) AS ltv_percentage,
	COUNT(customerkey) AS total_customers,
	
	SUM(total_ltv) / count(customerkey) AS avg_ltv



FROM
	segment_values 
GROUP BY customer_segment
ORDER BY customer_segment DESC


-- outputs ltv and avg ltv of customers tiered to percentiles.