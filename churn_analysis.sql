-- Overall Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(churned) AS total_churned,
    ROUND(SUM(churned) * 100.0 / COUNT(*), 2) AS churn_percentage
FROM customers;

-- Churn by Subscription Type
SELECT 
    subscription,
    COUNT(*) AS total_users,
    SUM(churned) AS churned_users,
    ROUND(SUM(churned) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY subscription
ORDER BY churn_rate DESC;

-- Churn by Activity Level
SELECT 
    CASE 
        WHEN last_login_days <= 7 THEN 'Active (0-7 days)'
        WHEN last_login_days <= 14 THEN 'Moderate (8-14 days)'
        ELSE 'Inactive (15+ days)'
    END AS activity_level,
    COUNT(*) AS total_users,
    ROUND(SUM(churned) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY activity_level
ORDER BY churn_rate DESC;

-- Churn by Payment Method
SELECT 
    payment_method,
    COUNT(*) AS total_users,
    ROUND(SUM(churned) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY payment_method
ORDER BY churn_rate DESC;
