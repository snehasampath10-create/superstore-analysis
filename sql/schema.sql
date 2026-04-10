-- =============================================================
-- 01_schema.sql
-- Superstore Sales Analytics
-- Creates the raw table and loads data from CSV
-- =============================================================
SET datestyle = 'ISO, MDY';

-- Drop table if it already exists (useful for re-runs)
DROP TABLE IF EXISTS superstore_raw;

-- Create the raw table
CREATE TABLE superstore_raw (
    row_id          INTEGER,
    order_id        VARCHAR(20),
    order_date      DATE,
    ship_date       DATE,
    ship_mode       VARCHAR(50),
    customer_id     VARCHAR(20),
    customer_name   VARCHAR(100),
    segment         VARCHAR(50),
    country         VARCHAR(100),
    city            VARCHAR(100),
    state           VARCHAR(100),
    postal_code     VARCHAR(20),
    region          VARCHAR(50),
    product_id      VARCHAR(20),
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    product_name    VARCHAR(255),
    sales           NUMERIC(10, 2),
    quantity        INTEGER,
    discount        NUMERIC(5, 2),
    profit          NUMERIC(10, 2)
);

-- =============================================================
-- Load data from CSV
-- =============================================================

COPY superstore_raw (
    row_id, order_id, order_date, ship_date, ship_mode,
    customer_id, customer_name, segment, country, city,
    state, postal_code, region, product_id, category,
    sub_category, product_name, sales, quantity, discount, profit
)
FROM 'C:/temp/Superstore.csv'
DELIMITER ','
CSV HEADER
ENCODING 'LATIN1';

-- =============================================================
-- Quick sanity check after loading
-- =============================================================

-- Total row count 
SELECT COUNT(*) AS total_rows FROM superstore_raw;

-- Preview first 5 rows
SELECT * FROM superstore_raw LIMIT 5;
