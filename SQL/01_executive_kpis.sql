-- ============================================================
-- Olist E-Commerce Analytics
-- 01 - Executive KPI Summary
-- ============================================================

SELECT
    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT customer_unique_id) AS unique_customers,

    ROUND(SUM(payment_value)::numeric, 2)
        AS total_payment_value,

    ROUND(AVG(payment_value)::numeric, 2)
        AS average_order_value,

    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY payment_value)::numeric,
        2
    ) AS median_order_value,

    COUNT(*) FILTER (
        WHERE order_status = 'delivered'
    ) AS delivered_orders,

    ROUND(
        SUM(payment_value)
        FILTER (WHERE order_status = 'delivered')::numeric,
        2
    ) AS delivered_payment_value

FROM ecommerce_master;