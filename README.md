# E-commerce Data Analysis with SQL

This project contains SQL scripts designed to perform a detailed Exploratory Data Analysis (EDA) on an e-commerce dataset. The purpose of this analysis is to extract insights about customer behavior, product sales, order processing times, and more.

## Project Structure

The SQL file `ecommerce_eda.sql` is divided into various sections to cover different aspects of the data. Each query is designed to answer specific business questions, from general statistics to complex RFM customer segmentation.

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
Basic statistics including:
- **Total number of customers**
- **Total number of products**
- **Total number of orders**

### Sales Analysis
- **Monthly Revenue Analysis**: Aggregates monthly revenue and average order value.
- **Top-Selling Products**: Lists the top 10 products by revenue.

### Customer Behavior Analysis
Analyzes customer activity:
- **Customer Purchase Frequency**: Includes customer purchase counts, average spending, first and last purchase dates, and customer lifetime in days.

### Product Category Analysis
Aggregates sales metrics by product categories, such as:
- **Total Revenue by Category**
- **Total Quantity Sold**
- **Average Unit Price**

### Customer Segmentation (RFM Analysis)
Segmentation based on Recency, Frequency, and Monetary (RFM) values:
- **VIP**: High frequency and spending.
- **Regular**: Moderate frequency and spending.
- **Occasional**: Lower frequency and spending.

### Order Processing Analysis
Evaluates the time between order placement and shipping, allowing insights into:
- **Average Order Processing Time**
- **Distribution of Processing Times**

### Geographic Analysis
Provides insights into sales by geographic region, detailing:
- **Sales by City and Region**
- **Total Revenue per Location**

### Time-based Analysis
Examines sales patterns based on time of day to identify peak ordering times:
- **Orders by Hour of Day**

### Product Association Analysis
Identifies products frequently bought together using association analysis:
- **Top Product Pairs**: Lists the top 10 pairs of products frequently bought together.

## Setup and Requirements

To run this analysis, you'll need:
- **SQL-compatible database** (e.g., MySQL, PostgreSQL)
- **Dataset tables**:
  - `customers`: Customer details with columns like `customer_id`, `city`, and `region`.
  - `products`: Product information with columns such as `product_id`, `product_name`, and `category_id`.
  - `orders`: Order data including `order_id`, `order_date`, `total_amount`, `shipping_date`, and `customer_id`.
  - `order_items`: Order item details, with fields like `order_id`, `product_id`, `quantity`, and `unit_price`.
  - `categories`: Product category details with fields like `category_id` and `category_name`.

Ensure that these tables are populated with data before running the queries.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/omkarb40/EDA.git
   cd ecommerce-data-analysis
2. Execute the ecommerce_eda.sql script in your SQL environment:
    SOURCE ecommerce_eda.sql;
3. Review query outputs to gain insights from each analysis section.

## Contributing
Contributions are welcome! If you'd like to improve this project, please:

1. Fork the repository.
2. Create a new feature branch (git checkout -b feature/your-feature).
3. Commit your changes (git commit -am 'Add new feature').
4. Push to the branch (git push origin feature/your-feature).
5. Open a pull request.