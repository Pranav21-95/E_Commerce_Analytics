-- ============================================================
-- Olist E-Commerce Analytics
-- 06 - Logistics & Delivery Performance
-- ============================================================

SELECT
    customer_state,

    COUNT(*) AS delivered_orders,

    ROUND(
        AVG(delivery_days)::numeric,
        2
    ) AS avg_delivery_days,

    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY delivery_days)::numeric,
        2
    ) AS median_delivery_days,

    COUNT(*) FILTER (
        WHERE is_late = 1
    ) AS late_orders,

    ROUND(
        (
            COUNT(*) FILTER (WHERE is_late = 1)::numeric
            / COUNT(*)::numeric
        ) * 100,
        2
    ) AS late_rate_pct

FROM ecommerce_master

WHERE order_status = 'delivered'
  AND delivery_days IS NOT NULL

GROUP BY customer_state

HAVING COUNT(*) >= 100

ORDER BY late_rate_pct DESC;
