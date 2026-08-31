-- ============================================================
-- Olist E-Commerce Analytics
-- 02 - Monthly Revenue Performance
-- ============================================================

WITH monthly AS (
    SELECT
        purchase_year_month,
        COUNT(DISTINCT order_id) AS orders,
        SUM(payment_value) AS revenue,
        AVG(payment_value) AS aov
    FROM ecommerce_master
    GROUP BY purchase_year_month
),

monthly_with_growth AS (
    SELECT
        purchase_year_month,
        orders,
        revenue,
        aov,
        LAG(revenue) OVER (
            ORDER BY purchase_year_month
        ) AS previous_month_revenue
    FROM monthly
)

SELECT
    purchase_year_month,
    orders,

    ROUND(revenue::numeric, 2) AS revenue,

    ROUND(aov::numeric, 2) AS aov,

    CASE
        WHEN previous_month_revenue IS NULL
             OR previous_month_revenue = 0
        THEN NULL
        ELSE ROUND(
            (
                (revenue / previous_month_revenue) - 1
            )::numeric * 100,
            2
        )
    END AS revenue_growth_pct

FROM monthly_with_growth

ORDER BY purchase_year_month;