-- 1. Create a clean table as a copy of the raw table
CREATE TABLE superstore_clean AS
SELECT * FROM superstore_raw;

-- 2. Remove duplicate order/product rows keeping the one with higher sales
DELETE FROM superstore_clean
WHERE row_id IN (
    SELECT row_id
    FROM (
        SELECT row_id,
               ROW_NUMBER() OVER (
                   PARTITION BY order_id, product_id
                   ORDER BY sales DESC
               ) AS rn
        FROM superstore_clean
    ) ranked
    WHERE rn > 1
);

-- 3. Verify row count after deduplication
SELECT COUNT(*) AS total_rows FROM superstore_clean;

-- 4. Investigate negative profit rows
SELECT COUNT(*) AS negative_profit_count,
       ROUND(AVG(discount), 2) AS avg_discount,
       ROUND(MIN(profit), 2) AS worst_loss
FROM superstore_clean
WHERE profit < 0;


-- 5. Check for leading/trailing whitespace in key text columns
SELECT COUNT(*) AS whitespace_issues
FROM superstore_clean
WHERE customer_name != TRIM(customer_name)
   OR product_name != TRIM(product_name)
   OR city != TRIM(city)
   OR state != TRIM(state);

-- 6. Trim whitespace from text columns
UPDATE superstore_clean
SET customer_name = TRIM(customer_name),
    product_name = TRIM(product_name),
    city = TRIM(city),
    state = TRIM(state);

