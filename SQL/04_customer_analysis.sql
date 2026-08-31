-- ============================================================
-- Olist E-Commerce Analytics
-- 04 - Customer Analysis
-- ============================================================

WITH customer_summary AS (
    SELECT
        customer_unique_id,
        COUNT(DISTINCT order_id) AS order_count,
        SUM(payment_value) AS total_spend
    FROM ecommerce_master
    GROUP BY customer_unique_id
),

customer_types AS (
    SELECT
        CASE
            WHEN order_count = 1 THEN 'One-time'
            ELSE 'Repeat'
        END AS customer_type,
        total_spend
    FROM customer_summary
),

summary AS (
    SELECT
        customer_type,
        COUNT(*) AS customers,
        SUM(total_spend) AS revenue,
        AVG(total_spend) AS avg_customer_spend,
        PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY total_spend) AS median_customer_spend
    FROM customer_types
    GROUP BY customer_type
),

totals AS (
    SELECT
        SUM(customers) AS total_customers,
        SUM(revenue) AS total_revenue
    FROM summary
)

SELECT
    s.customer_type,
    s.customers,

    ROUND(s.revenue::numeric, 2) AS revenue,

    ROUND(s.avg_customer_spend::numeric, 2)
        AS avg_customer_spend,

    ROUND(s.median_customer_spend::numeric, 2)
        AS median_customer_spend,

    ROUND(
        (s.customers::numeric / t.total_customers::numeric) * 100,
        2
    ) AS customer_pct,

    ROUND(
        (s.revenue::numeric / t.total_revenue::numeric) * 100,
        2
    ) AS revenue_pct

FROM summary s
CROSS JOIN totals t

ORDER BY s.revenue DESC;
