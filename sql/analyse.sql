-- 1. Overall business performance
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM superstore_clean;

-- 2. Profitability by region
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_clean
GROUP BY region
ORDER BY profit_margin_pct DESC;

-- 3. Profitability by category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_clean
GROUP BY category
ORDER BY profit_margin_pct DESC;

-- 4. Profitability by sub-category
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM superstore_clean
GROUP BY category, sub_category
ORDER BY profit_margin_pct ASC;

-- 5. Average discount by sub-category (worst performers first)
SELECT
    sub_category,
    ROUND(AVG(discount) * 100, 1) AS avg_discount_pct,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_clean
GROUP BY sub_category
ORDER BY avg_discount_pct DESC;

-- 6. Year over year performance
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_clean
GROUP BY year
ORDER BY year;

-- 7. Performance by customer segment
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_clean
GROUP BY segment
ORDER BY profit_margin_pct DESC;

-- 8. Discount impact on profit margin
SELECT
    CASE
        WHEN discount = 0 THEN '0% discount'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        WHEN discount <= 0.30 THEN '21-30%'
        WHEN discount <= 0.40 THEN '31-40%'
        ELSE 'Above 40%'
    END AS discount_bucket,
    COUNT(*) AS order_count,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit) / NULLIF(AVG(sales), 0) * 100, 2) AS avg_margin_pct
FROM superstore_clean
GROUP BY discount_bucket
ORDER BY avg_margin_pct DESC;