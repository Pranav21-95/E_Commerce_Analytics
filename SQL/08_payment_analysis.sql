-- ============================================================
-- Olist E-Commerce Analytics
-- 08 - Payment Method Analysis
-- ============================================================

WITH payment_summary AS (
    SELECT
        primary_payment_type,
        COUNT(*) AS orders,
        SUM(payment_value) AS payment_value,
        AVG(payment_value) AS avg_order_value,
        PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY payment_value) AS median_order_value,
        AVG(payment_installments_max) AS avg_installments
    FROM ecommerce_master
    WHERE primary_payment_type IS NOT NULL
    GROUP BY primary_payment_type
),

totals AS (
    SELECT
        SUM(orders) AS total_orders,
        SUM(payment_value) AS total_payment_value
    FROM payment_summary
)

SELECT
    p.primary_payment_type,

    p.orders,

    ROUND(
        p.payment_value::numeric,
        2
    ) AS payment_value,

    ROUND(
        p.avg_order_value::numeric,
        2
    ) AS avg_order_value,

    ROUND(
        p.median_order_value::numeric,
        2
    ) AS median_order_value,

    ROUND(
        p.avg_installments::numeric,
        2
    ) AS avg_installments,

    ROUND(
        (
            p.orders::numeric
            / t.total_orders::numeric
        ) * 100,
        2
    ) AS order_share_pct,

    ROUND(
        (
            p.payment_value::numeric
            / t.total_payment_value::numeric
        ) * 100,
        2
    ) AS payment_share_pct

FROM payment_summary p
CROSS JOIN totals t

ORDER BY p.payment_value DESC;
