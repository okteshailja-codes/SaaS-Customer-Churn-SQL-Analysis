# SaaS Customer Churn & Revenue Analysis Using SQL
<img width="1322" height="735" alt="image" src="https://github.com/user-attachments/assets/5a1c6ae5-ce25-48f6-9145-4b76358b6ad1" />


## Project Overview

This project analyzes SaaS customer data using SQL to understand customer segmentation, subscription revenue, churn patterns, support activity, and revenue associated with churned customers.

The analysis is based on five RavenStack datasets:

- Customer Accounts
- Subscriptions
- Churn Events
- Feature Usage
- Support Tickets

##  Business Objectives

The project answers key business questions such as:

- How large is the customer base?
- Which industries and plan tiers have the most customers?
- Which plan generates the highest MRR and ARR?
- Which plans and industries have the highest churn rates?
- Do churned customers have higher support activity?
- How much subscription revenue is associated with churned customers?

##  Key Findings

### Customer Analysis

- Total customers: **500**
- Total subscription records: **5,000**
- Trial customers: **97**
- Non-trial customers: **403**
- Pro is the largest customer segment with **178 customers**.

### Revenue Analysis

- Enterprise generated the highest total MRR: **8,473,221**
- Enterprise generated the highest total ARR: **101,678,652**
- Enterprise had the highest average MRR per subscription: **4,917.71**

### Churn Analysis

Plan-level churn rates:

| Plan | Churn Rate |
|---|---:|
| Pro | 72.47% |
| Enterprise | 70.13% |
| Basic | 68.45% |

Industry-level churn rates:

| Industry | Churn Rate |
|---|---:|
| DevTools | 73.45% |
| EdTech | 72.15% |
| Cybersecurity | 72.00% |
| FinTech | 67.86% |
| HealthTech | 66.67% |

### Support Activity

Churned customers averaged **6.79 support tickets per customer**, compared with **4.09** for active customers.

This indicates an association between higher support activity and churn, although it does not prove that support activity causes churn.

### Revenue Associated with Churn

The analysis returned:

- Churned MRR: **13,191,658**
- Churned ARR: **158,299,896**

These figures represent revenue associated with churned subscription records and should not be interpreted as guaranteed revenue loss.

## 💡 Business Recommendations

1. Prioritize retention efforts for **DevTools customers** due to their highest industry churn rate.
2. Investigate **Pro-plan churn**, which has the highest plan-level churn rate.
3. Monitor customers with unusually high support activity as potential churn-risk signals.
4. Prioritize retention of **Enterprise customers** because of their higher revenue contribution.
5. Combine feature usage, support activity, subscription history, and churn data for future churn prediction.

##  SQL Skills Demonstrated

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- COUNT
- COUNT DISTINCT
- SUM
- AVG
- ROUND
- CASE WHEN
- INNER JOIN
- LEFT JOIN
- Customer segmentation
- Churn-rate calculation
- Revenue analysis

##  Project Files
[saas-customer-churn-sql-analysis.sql](https://github.com/user-attachments/files/32254363/saas-customer-churn-sql-analysis.sql)
[SaaS_Customer_Churn_SQL_Analysis_Report.pdf](https://github.com/user-attachments/files/32254322/SaaS_Customer_Churn_SQL_Analysis_Report.pdf)

##  Conclusion

This project demonstrates how SQL can be used to transform SaaS operational data into actionable business insights around customer retention, churn, support activity, and revenue.
# Author
"Shailja okte"
