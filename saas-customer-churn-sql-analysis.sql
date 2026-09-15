-- ======================================================
--   SaaS Customer Churn & Revenue Analysis Using SQL
-- ======================================================
-- Total Table = 5 
-- ----------------
-- ravenstack_accounts (500 row)
-- ravenstack_churn_events (600 row)
-- ravenstack_feature_usage (25000 row)
-- ravenstack_subscriptions (5000 row)
-- ravenstack_support_tickets (2000 row)
-- =======================================================
use saas_churn;
-- =====================================================
--                   Data Exploration
-- =====================================================
-- Task 1 Total customer
select count(distinct account_id ) as total_customer
from ravenstack_accounts;

-- Task 2 Total subscritptions
select count(distinct subscription_id) as total_subscription
from ravenstack_subscriptions;

-- Task 3 Total Churned
select count(distinct account_id) total_churned_customer
from ravenstack_churn_events;

-- Task 4 Total support tickets
select count(distinct ticket_id ) as total_support_ticket
from ravenstack_support_tickets;

-- Task 5 Total features usage records
select count(distinct usage_id ) as total_usage_records
from ravenstack_feature_usage;

-- Task 6 Total Countries
select count(distinct country ) as total_counrty
from ravenstack_accounts;

-- Task 7 subscription plan
select count(distinct plan_tier ) as total_plan_tier
from ravenstack_subscriptions;

-- ====================================================
--          Customer & Revenue Analysis
-- ====================================================
-- Task 8 customer segmentation by industry
select industry,count(distinct account_id) as total_customer
from ravenstack_accounts
group by industry
order by total_customer desc;

-- Task 9 customer distribution by plan_tier
select plan_tier,count(distinct account_id) as total_customer
from ravenstack_accounts
group by plan_tier
order by total_customer
desc;

-- Task 10 Trial vs Non-Trial Customers
select is_trial,count(account_id) as total_customer
from ravenstack_accounts
group by is_trial
order by total_customer
desc;

-- Task 11  Subscription Distribution by Plan Tier
select plan_tier,count(account_id)
as total_subscription_distribution     
FROM ravenstack_subscriptions
GROUP BY plan_tier;

-- Task 12 MRR Analysis by Plan Tier
select plan_tier,sum(mrr_amount) as total_mrr
from ravenstack_subscriptions
group by plan_tier;

-- Task 13 ARR Analysis by Plan Tier
select plan_tier,sum(arr_amount) as total_arr
from ravenstack_subscriptions
group by plan_tier;

-- Task 14 Average MRR by Plan Tier
select plan_tier ,avg(mrr_amount) as avg_mrr
from ravenstack_subscriptions
group by plan_tier;
-- ==================================================
--                   Churn Analysis
-- ==================================================
-- Task 15 Churned Customers by Plan Tier
select plan_tier,count(distinct c.account_id)
as total_churned_customer
from ravenstack_churn_events c
inner join ravenstack_accounts a
on c.account_id = a.account_id
group by plan_tier 
order by  total_churned_customer
desc;

-- Task 16 Churn Rate by Plan Tier
select
a.plan_tier,
count(distinct c.account_id) as churned_customers,
count(distinct a.account_id) as total_customers,
    ROUND(
        COUNT(DISTINCT c.account_id) * 100.0 
        / COUNT(DISTINCT a.account_id), 
        2
    ) AS churn_rate
FROM ravenstack_accounts a
LEFT JOIN ravenstack_churn_events c
    ON a.account_id = c.account_id
GROUP BY a.plan_tier
ORDER BY churn_rate DESC;

-- Task 17 Churned Customers by Industry
select industry, count(distinct c.account_id)
total_churned_customer
from ravenstack_accounts a
inner join ravenstack_churn_events c
on a.account_id = c.account_id
group by industry
order by total_churned_customer
desc;

-- Task 18 Churn Rate by Industry
SELECT 
a.industry,
COUNT(DISTINCT c.account_id) AS churned_customers,
COUNT(DISTINCT a.account_id) AS total_customers,
ROUND(
	COUNT(DISTINCT c.account_id) * 100.0 
	/ COUNT(DISTINCT a.account_id), 
	2
) AS churn_rate
FROM ravenstack_accounts a
LEFT JOIN ravenstack_churn_events c
ON a.account_id = c.account_id
GROUP BY a.industry
ORDER BY churn_rate DESC;
-- ====================================================
--                      Support vs Churn
-- =====================================================
-- Task 19 Support Tickets vs Churn

SELECT 
    CASE 
        WHEN c.account_id IS NOT NULL THEN 'Churned'
        ELSE 'Active'
    END AS customer_status,
    COUNT(DISTINCT a.account_id) AS customers,
    COUNT(st.ticket_id) AS total_tickets,
    ROUND(
        COUNT(st.ticket_id) * 1.0 / COUNT(DISTINCT a.account_id), 
        2
    ) AS avg_tickets_per_customer
FROM ravenstack_accounts a
LEFT JOIN ravenstack_churn_events c
    ON a.account_id = c.account_id
LEFT JOIN ravenstack_support_tickets st
    ON a.account_id = st.account_id
GROUP BY customer_status;
-- =================================================
--                    Revenue at Risk
-- =================================================
-- Task 20 Revenue at Risk from Churn

SELECT
    SUM(s.mrr_amount) AS churned_mrr,
    SUM(s.arr_amount) AS churned_arr
FROM ravenstack_subscriptions s
JOIN ravenstack_churn_events c
    ON s.account_id = c.account_id;