# Project: Sales Analysis

## Overview
This project analyzes sales and customer data for Contoso, a fictional e-commerce company by Microsoft. Using customer segmentation, cohort analysis, and retention modeling, the analysis identifies high-value segments, revenue trends, and churn risks. The findings support actionable strategies to improve retention, optimize marketing, and maximize revenue growth. 
The project is inspired by the online course [SQL for Data Analytics – Intermediate Course + Project](https://www.lukebarousse.com/int-sql) by [Luke Barousse](https://github.com/lukebarousse).

## Business Questions
1. **Customer Segmentation:** Who are our most valuable customers?
2. **Cohort Analysis:** How do different groups generate revenue?
3. **Retention Analysis:** Which customers haven't purchased recently?

## Analysis Approach
### 1. Customer Segmentation Analysis

- Categorized customers based on total lifetime value (LTV)
- Calculated Key metrics: total revenue
- Tiered customers into High-, Mid-, and Low-value segments based on their revenue: above the 75th percentile (High), between the 25th and 75th percentiles (Mid), and below the 25th percentile (Low) of total revenue.


Related Query: [1_customer_segmentation.sql](/1_customer_segmentation.sql)

**Visualization:**


|customer_segment|total_ltv|ltv_percentage|total_customers|avg_ltv|
|----------------|---------|--------------|---------------|-------|
|3-High-Value|135429277.26|65.61|12372|10946.43|
|2-Mid-Value|66636451.78|32.28|24743|2693.14|
|1-Low-Value|4341809.52|2.10|12372|350.94|

_Table 1_


![customer_segmentation](/images/1_customer_segmentation_ltv_pie_chart.png)
_Figure 1_

**Key Findings:**
- High-value segment (25% of customers) drives 66% of revemue ($135.4M).
- Mid-value segment (50% of customers) generates 32% of revenue ($66.6M).
- Low-value segment (25% of customers) contributes only 2% of revenue ($4.3M).

**Business Insights**
- High-Value (66% revenue): Offer premium membership program to the 12,372 VIP customers, as losing one customer significantly impacts revenue.
- Mid-Value (32% revenue): Create upgrade paths through personalized promotions, with potential $66.6M → $135.4M revenue opportunity.
- Low-Value (2% revenue): Design re-engagement campaigns and price-sensitive promotions to increase purchase frequency.


### 2. Cohort Analysis
- Tracked revenue and total customers per cohort year
- Grouped customer revenue by first purchase year
- Examined monthly revenue and customers respectively
- Analysed customer retention at a cohort level

Related Queries: 
[2_cohort_analysis_query_1.sql](/2_cohort_analysis_query_1.sql)
,
 [2_cohort_analysis_query_2.sql](/2_cohort_analysis_query_2.sql)

**Visualization:**

![Cohort_Analysis_21](/images/2.3monthly_revenue_customers_time_series_chart.png)
_Figure 2.1_

![Cohort_Analysis_12](/images/2.2customer_revenue_exponential_trend_chart.png)
_Figure 2.2_

**Key Findings:**
- The sudden dip in 2020 revenue might have occured due to the pandemic (Figure 2.1).
- Between 2015 and 2021, customer count and revenue exhibit an approximately linear relationship. However, between 2022 and 2024, significant gaps emerge between the number of customers and net revenue — increases in customer numbers do not correspond to proportional increases in net revenue (Figure 2.1).
  - This divergence aligns with the decreasing exponential trend observed in Figure 2.2, suggesting that revenue per customer is declining at an alarming rate.
  - It also indicates that the 2022–2024 customer cohorts are consistently underperforming compared to earlier cohorts, as shown in Figure 2.2.

**Business Insights**
- Value extracted from customers is decreasing over time and needs more investigation.
- Since 2023, the number of customers acquired has been steadily decreasing, which is concerning.
- Lowering LTV and decreasing customer acquisition are leading the company to a potential revenue decline.

### 3. Customer Retention Analysis
- Identified customers at risk of churning
- Analyzed last purchase patterns
- Calculated customer-specific metrics

Related Query: [3_customer_retention.sql](/3_customer_retention_query_2.sql)

**Visualization:**

![customer_retention](/images/3_customer_retention_churn_stacked_bar_chart.png)
_Figure 3_

**Key Findings:**
- Cohort churn stabilizes at approximately 90% after 2-3 years, indicating a predictable long-term retention pattern.
- Retention rates are consistently low (8-10%) across all cohorts, suggesting retention issues are systemic rather than specific to certain years.
- Newer cohorts (2022-2023) show similar churn trajectories, signaling that without intervention, future cohorts will follow the same pattern.

**Business Insights**
- Strengthen early engagement strategies to target the first 1-2 years with onboarding incentives, loyalty rewards, and personalized offers to improve long-term retention.
- Re-engage high-value churned customers by focusing on targeted win-back campaigns rather than broad retention efforts, as reactivating valuable users may yield higher ROI.


## Strategic Recommendations
1. **Customer Value Optimization** (Customer Segmentation)

   - Launch a referral program targeting VIP customers to acquire new high-value customers through peer recommendations.
   - Develop bundled product offerings and personalized upsell campaigns for mid-value customers to encourage progression into the high-value segment.

2. Cohort Performance Strategy (Customer Revenue by Cohort)

   - Target 2022-2024 cohorts with personalized re-engagement offers

   - Implement loyalty/subscription programs to stabilize revenue fluctuations


3. Retention & Churn Prevention (Customer Retention)

   - Strengthen first 1-2 year engagement with onboarding incentives and loyalty rewards
   - Build churn prediction models using behavioral data to proactively identify at-risk customers for timely interventions.

## Technical Details
- **Database:** PostgreSQL
- **Analysis Tools:** PostgreSQL, DBeaver, PGadmin
- **Visualization:** Google Gemini
