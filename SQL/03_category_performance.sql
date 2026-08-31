-- ============================================================
-- Olist E-Commerce Analytics
-- 03 - Product Category Performance
-- ============================================================

SELECT
    COALESCE(
        p.product_category_name_english,
        'unknown'
    ) AS category,

    COUNT(DISTINCT oi.order_id) AS orders,

    COUNT(*) AS items,

    ROUND(SUM(oi.price)::numeric, 2) AS product_revenue,

    ROUND(SUM(oi.freight_value)::numeric, 2) AS freight_revenue,

    ROUND(
        (SUM(oi.price) / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS avg_item_price

FROM order_items oi

LEFT JOIN products p
    ON oi.product_id = p.product_id

GROUP BY
    COALESCE(
        p.product_category_name_english,
        'unknown'
    )

ORDER BY product_revenue DESC;
