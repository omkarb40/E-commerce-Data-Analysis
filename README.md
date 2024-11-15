# E-commerce Data Analysis with SQL

This project contains SQL scripts designed to perform a detailed Exploratory Data Analysis (EDA) on an e-commerce dataset. The purpose of this analysis is to extract comprehensive insights into customer behavior, product sales, order processing times, geographic sales distribution, and other key metrics to aid business decision-making.

## Project Structure

The SQL file `ecommerce_eda.sql` is organized into sections covering different analytical aspects of the data. Each query addresses specific business questions, from general statistics to complex RFM (Recency, Frequency, Monetary) customer segmentation.

### Table of Contents
- [Overview Statistics](#overview-statistics)
- [Sales Analysis](#sales-analysis)
- [Customer Behavior Analysis](#customer-behavior-analysis)
- [Product Category Analysis](#product-category-analysis)
- [Customer Segmentation (RFM Analysis)](#customer-segmentation-rfm-analysis)
- [Order Processing Analysis](#order-processing-analysis)
- [Geographic Analysis](#geographic-analysis)
- [Time-based Analysis](#time-based-analysis)
- [Product Association Analysis](#product-association-analysis)
- [Setup and Requirements](#setup-and-requirements)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Analysis Sections

### Overview Statistics
Provides basic metrics, including:
- **Total number of unique customers**
- **Total number of unique products**
- **Total number of unique orders**
- **Total number of unique product categories**
- **Average number of items per order**

### Sales Analysis
Key metrics on sales trends and product performance:
- **Monthly Revenue Analysis**: Aggregates monthly revenue and average order value. Includes year-over-year breakdowns to identify growth trends.
- **Top-Selling Products with Discounted Revenue**: Lists the top 10 products by revenue, considering discounted prices (if available) to provide a realistic revenue estimate.

### Customer Behavior Analysis
Evaluates customer purchase activity:
- **Customer Purchase Frequency**: Summarizes purchase counts, average spending, first and last purchase dates, customer lifetime in days, and average purchase intervals (days between purchases).
- **Customer Recency**: Calculates the time since the last purchase for each customer.

### Product Category Analysis
Aggregates sales metrics by product categories:
- **Revenue by Category Over Time**: Analyzes revenue by category on a monthly basis, useful for identifying seasonal trends.
- **Unique Products per Category**: Counts the number of unique products in each category to understand category diversity.

### Customer Segmentation (RFM Analysis)
Segments customers based on Recency, Frequency, and Monetary (RFM) values, using a quartile-based approach for finer customer segmentation:
- **VIP**: High recency, frequency, and spending.
- **Regular**: Moderate recency, frequency, and spending.
- **Occasional**: Lower recency, frequency, and spending.

### Order Processing Analysis
Analyzes the distribution of order processing times to understand the efficiency of order fulfillment:
- **Processing Time Intervals**: Categorizes processing times into intervals (0-24 hours, 24-48 hours, etc.) to identify any potential bottlenecks.
- **Average Order Processing Time**: Provides a summary of average and median processing times.

### Geographic Analysis
Analyzes sales by geographic region to identify high-performing areas:
- **Sales by City and Region**: Includes total revenue and average order value for each city and region, helping to pinpoint locations with higher customer engagement and spending.

### Time-based Analysis
Analyzes ordering patterns based on time:
- **Orders by Day of the Week**: Helps identify whether certain days are more popular for orders, providing insight into weekday vs. weekend trends.
- **Orders by Hour of the Day**: Identifies peak order times throughout the day.

### Product Association Analysis
Performs association analysis to identify frequently bought-together product pairs:
- **Top Product Pairs**: Lists the top 10 pairs of products frequently bought together, filtered to include only pairs bought together more than 5 times, ensuring that results focus on significant associations.

## Setup and Requirements

To run this analysis, you will need:
- **SQL-compatible database** (e.g., MySQL, PostgreSQL)
- **Dataset tables**:
  - `customers`: Customer details, including columns like `customer_id`, `city`, and `region`.
  - `products`: Product information, with columns such as `product_id`, `product_name`, and `category_id`.
  - `orders`: Order data, including `order_id`, `order_date`, `total_amount`, `shipping_date`, and `customer_id`.
  - `order_items`: Order item details, with fields like `order_id`, `product_id`, `quantity`, `unit_price`, and (optional) `discount`.
  - `categories`: Product category details, with fields like `category_id` and `category_name`.

Ensure that these tables are populated with data before running the queries.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/omkarb40/E-commerce-Data-Analysis.git
   cd ecommerce-data-analysis
2. Execute the ecommerce_eda.sql script in your SQL environment:
    SOURCE ecommerce_eda.sql;
3. Review the query outputs to gain insights from each analysis section. The queries are organized in sections within ecommerce_eda.sql for easy navigation.