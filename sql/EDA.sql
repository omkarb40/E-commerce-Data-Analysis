-- Exploratory Data Analysis
-- 1. Overview Statistics
SELECT COUNT(DISTINCT customer_id) as total_customers
FROM customers;

-- Number of products
SELECT COUNT(DISTINCT product_id) as total_products
FROM products;

-- Number of orders
SELECT COUNT(DISTINCT order_id) as total_orders
FROM orders;

-- 2. Sales Analysis
-- Total revenue by month
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') as month,
    COUNT(DISTINCT order_id) as num_orders,
    SUM(total_amount) as total_revenue,
    AVG(total_amount) as avg_order_value
FROM orders
GROUP BY month
ORDER BY month;

-- Top selling products
SELECT 
    p.product_name,
    COUNT(oi.order_id) as times_ordered,
    SUM(oi.quantity) as total_quantity,
    SUM(oi.quantity * oi.unit_price) as total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- 3. Customer Behavior Analysis
-- Customer purchase frequency
SELECT 
    customer_id,
    COUNT(DISTINCT order_id) as num_orders,
    AVG(total_amount) as avg_order_value,
    MIN(order_date) as first_purchase,
    MAX(order_date) as last_purchase,
    DATEDIFF(MAX(order_date), MIN(order_date)) as customer_lifetime_days
FROM orders
GROUP BY customer_id;

-- 4. Product Category Analysis
-- Sales by category
SELECT 
    c.category_name,
    COUNT(DISTINCT oi.order_id) as num_orders,
    SUM(oi.quantity) as total_quantity,
    SUM(oi.quantity * oi.unit_price) as total_revenue,
    AVG(oi.unit_price) as avg_unit_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

-- 5. Customer Segmentation
-- RFM Analysis
WITH rfm_calc AS (
    SELECT 
        customer_id,
        DATEDIFF(MAX(order_date), MIN(order_date)) as recency,
        COUNT(DISTINCT order_id) as frequency,
        AVG(total_amount) as monetary
    FROM orders
    GROUP BY customer_id
)
SELECT 
    CASE 
        WHEN frequency > 10 AND monetary > 1000 THEN 'VIP'
        WHEN frequency > 5 AND monetary > 500 THEN 'Regular'
        ELSE 'Occasional'
    END as customer_segment,
    COUNT(*) as number_of_customers,
    AVG(monetary) as avg_spending
FROM rfm_calc
GROUP BY 
    CASE 
        WHEN frequency > 10 AND monetary > 1000 THEN 'VIP'
        WHEN frequency > 5 AND monetary > 500 THEN 'Regular'
        ELSE 'Occasional'
    END;

-- 6. Order Processing Analysis
-- Order processing times
SELECT 
    TIMESTAMPDIFF(HOUR, order_date, shipping_date) as processing_time_hours,
    COUNT(*) as num_orders
FROM orders
GROUP BY processing_time_hours
ORDER BY processing_time_hours;

-- 7. Geographic Analysis
-- Sales by region/city
SELECT 
    c.city,
    c.region,
    COUNT(DISTINCT o.order_id) as num_orders,
    SUM(o.total_amount) as total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city, c.region
ORDER BY total_revenue DESC;

-- 8. Time-based Analysis
-- Sales patterns by hour of day
SELECT 
    HOUR(order_date) as hour_of_day,
    COUNT(*) as num_orders,
    AVG(total_amount) as avg_order_value
FROM orders
GROUP BY HOUR(order_date)
ORDER BY hour_of_day;

-- 9. Product Association Analysis
-- Products frequently bought together
SELECT 
    p1.product_name as product1,
    p2.product_name as product2,
    COUNT(*) as times_bought_together
FROM order_items oi1
JOIN order_items oi2 ON oi1.order_id = oi2.order_id
JOIN products p1 ON oi1.product_id = p1.product_id
JOIN products p2 ON oi2.product_id = p2.product_id
WHERE oi1.product_id < oi2.product_id
GROUP BY p1.product_name, p2.product_name
ORDER BY times_bought_together DESC
LIMIT 10;