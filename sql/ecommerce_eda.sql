-- Exploratory Data Analysis

-- 1. Overview Statistics
SELECT COUNT(DISTINCT CustomerID) AS total_customers FROM e_commerce_clone2;
SELECT COUNT(DISTINCT StockCode) AS total_products FROM e_commerce_clone2;
SELECT COUNT(DISTINCT InvoiceNo) AS total_orders FROM e_commerce_clone2;
SELECT AVG(items_per_order) AS avg_items_per_order
FROM (
    SELECT InvoiceNo, SUM(Quantity) AS items_per_order
    FROM e_commerce_clone2
    GROUP BY InvoiceNo
) AS order_item_counts;

-- 2. Sales Analysis
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS month, SUM(Quantity * UnitPrice) AS total_revenue
FROM e_commerce_clone2
GROUP BY month
ORDER BY month;

SELECT Description AS product_name, SUM(Quantity) AS total_quantity, SUM(Quantity * UnitPrice) AS total_revenue
FROM e_commerce_clone2
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- 3. Customer Behavior Analysis
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS num_orders, AVG(Quantity * UnitPrice) AS avg_order_value,
    MIN(InvoiceDate) AS first_purchase, MAX(InvoiceDate) AS last_purchase,
    DATEDIFF(CURDATE(), MAX(InvoiceDate)) AS recency_days
FROM e_commerce_clone2
GROUP BY CustomerID;

WITH customer_recency AS (
    SELECT CustomerID, DATEDIFF(CURDATE(), MAX(InvoiceDate)) AS recency_days
    FROM e_commerce_clone2
    GROUP BY CustomerID
)
SELECT CASE
        WHEN recency_days <= 30 THEN 'Active'
        WHEN recency_days <= 90 THEN 'Churn Risk'
        ELSE 'Churned'
    END AS customer_segment,
    COUNT(*) AS num_customers
FROM customer_recency
GROUP BY customer_segment;

-- 4. Product Category Analysis
-- Note: Adjust joins for actual table names and relationships.
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month, c.category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY month, c.category_name
ORDER BY month, total_revenue DESC;

SELECT c.category_name, COUNT(DISTINCT p.product_id) AS unique_products
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY unique_products DESC;

-- 5. Customer Segmentation (RFM Analysis)
-- Sales patterns by day of the week
SELECT DAYNAME(InvoiceDate) AS day_of_week, COUNT(*) AS num_orders, SUM(Quantity * UnitPrice) AS total_revenue
FROM e_commerce_clone2
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

SELECT HOUR(InvoiceDate) AS hour_of_day, COUNT(*) AS num_orders, SUM(Quantity * UnitPrice) AS total_revenue
FROM e_commerce_clone2
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- 6. Order Processing Analysis
SELECT CASE 
        WHEN TIMESTAMPDIFF(HOUR, InvoiceDate, ShippingDate) <= 24 THEN '0-24 hours'
        WHEN TIMESTAMPDIFF(HOUR, InvoiceDate, ShippingDate) <= 48 THEN '24-48 hours'
        WHEN TIMESTAMPDIFF(HOUR, InvoiceDate, ShippingDate) <= 72 THEN '48-72 hours'
        ELSE '72+ hours'
    END AS processing_time_interval,
    COUNT(*) AS num_orders
FROM e_commerce_clone2
GROUP BY processing_time_interval
ORDER BY processing_time_interval;

-- 7. Geographic Analysis
SELECT Country AS region, COUNT(DISTINCT InvoiceNo) AS num_orders, SUM(Quantity * UnitPrice) AS total_revenue,
    AVG(Quantity * UnitPrice) AS avg_order_value
FROM e_commerce_clone2
GROUP BY region
ORDER BY total_revenue DESC;

-- 8. Time-based Analysis
SELECT DAYNAME(InvoiceDate) AS day_of_week, COUNT(*) AS num_orders, SUM(Quantity * UnitPrice) AS total_revenue
FROM e_commerce_clone2
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

SELECT HOUR(InvoiceDate) AS hour_of_day, COUNT(*) AS num_orders, SUM(Quantity * UnitPrice) AS total_revenue
FROM e_commerce_clone2
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- 9. Product Association Analysis
SELECT p1.Description AS product1, p2.Description AS product2, COUNT(*) AS times_bought_together
FROM e_commerce_clone2 p1
JOIN e_commerce_clone2 p2 ON p1.InvoiceNo = p2.InvoiceNo AND p1.StockCode < p2.StockCode
GROUP BY p1.Description, p2.Description
HAVING times_bought_together > 5
ORDER BY times_bought_together DESC
LIMIT 10;
