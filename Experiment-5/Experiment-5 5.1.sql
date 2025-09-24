CREATE TABLE transaction_data (
    id INT,
    value NUMERIC
);
-- Insert 1 million records for id = 1
INSERT INTO transaction_data (id, value)
SELECT 1, (random() * 100)::numeric
FROM generate_series(1, 1000000);

-- Insert 1 million records for id = 2
INSERT INTO transaction_data (id, value)
SELECT 2, (random() * 100)::numeric
FROM generate_series(1, 1000000);

CREATE OR REPLACE VIEW sales_summary AS
SELECT 
    id,
    COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
    SUM(value) AS total_quantity_sold
FROM transaction_data
GROUP BY id;

CREATE MATERIALIZED VIEW sales_summary_mv AS
SELECT 
    id,
    COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
    SUM(value) AS total_quantity_sold
FROM transaction_data
GROUP BY id;

EXPLAIN ANALYZE
SELECT * FROM sales_summary;

EXPLAIN ANALYZE
SELECT * FROM sales_summary_mv;

