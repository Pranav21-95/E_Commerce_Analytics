-- ============================================================
-- Olist E-Commerce Analytics
-- 05 - Seller Performance
-- ============================================================

SELECT
    oi.seller_id,

    COUNT(DISTINCT oi.order_id) AS orders,

    COUNT(*) AS items,

    ROUND(SUM(oi.price)::numeric, 2) AS revenue,

    ROUND(SUM(oi.freight_value)::numeric, 2) AS freight,

    ROUND(
        AVG(oi.price)::numeric,
        2
    ) AS avg_item_price,

    ROUND(
        (
            SUM(oi.price)
            / SUM(SUM(oi.price)) OVER ()
            * 100
        )::numeric,
        2
    ) AS revenue_share_pct

FROM order_items oi

GROUP BY oi.seller_id

ORDER BY revenue DESC;
