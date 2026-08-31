-- ============================================================
-- Olist E-Commerce Analytics
-- 09 - RFM Customer Segmentation
-- ============================================================

WITH customer_rfm AS (
    SELECT
        customer_unique_id,

        MAX(order_purchase_timestamp::timestamp) AS last_purchase,

        COUNT(DISTINCT order_id) AS frequency,

        COALESCE(SUM(payment_value), 0) AS monetary

    FROM ecommerce_master

    GROUP BY customer_unique_id
),

reference_date AS (
    SELECT
        MAX(last_purchase) AS analysis_date
    FROM customer_rfm
),

rfm_values AS (
    SELECT
        c.customer_unique_id,
        c.last_purchase,
        c.frequency,
        c.monetary,

        EXTRACT(
            DAY FROM (r.analysis_date - c.last_purchase)
        ) AS recency_days

    FROM customer_rfm c
    CROSS JOIN reference_date r
),

rfm_scores AS (
    SELECT
        *,

        NTILE(5) OVER (
            ORDER BY recency_days DESC
        ) AS r_score,

        NTILE(5) OVER (
            ORDER BY frequency
        ) AS f_score,

        NTILE(5) OVER (
            ORDER BY monetary
        ) AS m_score

    FROM rfm_values
),

rfm_segmented AS (
    SELECT
        *,

        r_score + f_score + m_score AS rfm_score,

        CASE
            WHEN r_score + f_score + m_score >= 13
                THEN 'Champions'

            WHEN r_score + f_score + m_score >= 10
                THEN 'Loyal'

            WHEN r_score + f_score + m_score >= 7
                THEN 'Needs Attention'

            ELSE 'Low Value'
        END AS segment

    FROM rfm_scores
)

SELECT
    segment,

    COUNT(*) AS customers,

    ROUND(
        SUM(monetary)::numeric,
        2
    ) AS total_spend,

    ROUND(
        AVG(monetary)::numeric,
        2
    ) AS avg_customer_spend,

    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY monetary)::numeric,
        2
    ) AS median_customer_spend

FROM rfm_segmented

GROUP BY segment

ORDER BY total_spend DESC;
