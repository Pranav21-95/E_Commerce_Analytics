-- ============================================================
-- Olist E-Commerce Analytics
-- 07 - Delivery Performance vs Customer Satisfaction
-- ============================================================

WITH delivery_analysis AS (
    SELECT
        CASE
            WHEN is_late = 1 THEN 'Late'
            ELSE 'Early/On-time'
        END AS delivery_status,

        review_score_avg

    FROM ecommerce_master

    WHERE review_score_avg IS NOT NULL
)

SELECT
    delivery_status,

    COUNT(*) AS orders,

    ROUND(
        AVG(review_score_avg)::numeric,
        3
    ) AS avg_review,

    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY review_score_avg)::numeric,
        2
    ) AS median_review,

    ROUND(
        (
            COUNT(*) FILTER (
                WHERE review_score_avg <= 2
            )::numeric
            / COUNT(*)::numeric
        ) * 100,
        2
    ) AS low_rating_rate_pct

FROM delivery_analysis

GROUP BY delivery_status

ORDER BY
    CASE delivery_status
        WHEN 'Late' THEN 1
        WHEN 'Early/On-time' THEN 2
    END;
    