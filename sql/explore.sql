-- 2. Null checks
SELECT
    COUNT(*) FILTER (WHERE row_id IS NULL) AS row_id_nulls,
    COUNT(*) FILTER (WHERE order_id IS NULL) AS order_id_nulls,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS order_date_nulls,
    COUNT(*) FILTER (WHERE ship_date IS NULL) AS ship_date_nulls,
    COUNT(*) FILTER (WHERE ship_mode IS NULL) AS ship_mode_nulls,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_nulls,
    COUNT(*) FILTER (WHERE customer_name IS NULL) AS customer_name_nulls,
    COUNT(*) FILTER (WHERE segment IS NULL) AS segment_nulls,
    COUNT(*) FILTER (WHERE country IS NULL) AS country_nulls,
    COUNT(*) FILTER (WHERE city IS NULL) AS city_nulls,
    COUNT(*) FILTER (WHERE state IS NULL) AS state_nulls,
    COUNT(*) FILTER (WHERE postal_code IS NULL) AS postal_code_nulls,
    COUNT(*) FILTER (WHERE region IS NULL) AS region_nulls,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS product_id_nulls,
    COUNT(*) FILTER (WHERE category IS NULL) AS category_nulls,
    COUNT(*) FILTER (WHERE sub_category IS NULL) AS sub_category_nulls,
    COUNT(*) FILTER (WHERE product_name IS NULL) AS product_name_nulls,
    COUNT(*) FILTER (WHERE sales IS NULL) AS sales_nulls,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS quantity_nulls,
    COUNT(*) FILTER (WHERE discount IS NULL) AS discount_nulls,
    COUNT(*) FILTER (WHERE profit IS NULL) AS profit_nulls
FROM superstore_raw;

-- 3. Check for duplicate order/product combinations
SELECT order_id, product_id, COUNT(*) AS count
FROM superstore_raw
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

-- 4. Distribution of Sales, Profit and Discount
SELECT
    MIN(sales) AS min_sales, MAX(sales) AS max_sales, ROUND(AVG(sales),2) AS avg_sales,
    MIN(profit) AS min_profit, MAX(profit) AS max_profit, ROUND(AVG(profit),2) AS avg_profit,
    MIN(discount) AS min_discount, MAX(discount) AS max_discount, ROUND(AVG(discount),2) AS avg_discount
FROM superstore_raw;

-- 5. Date range of orders
SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM superstore_raw;

-- 6. Distinct values in categorical columns
SELECT DISTINCT segment FROM superstore_raw ORDER BY segment;
SELECT DISTINCT region FROM superstore_raw ORDER BY region;
SELECT DISTINCT category FROM superstore_raw ORDER BY category;
SELECT DISTINCT ship_mode FROM superstore_raw ORDER BY ship_mode;