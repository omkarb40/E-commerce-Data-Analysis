# E-commerce Data Analysis with SQL

This project showcases an end-to-end Exploratory Data Analysis (EDA) using SQL queries on an e-commerce dataset. The goal is to extract actionable insights about customer behavior, product performance, sales trends, and operational efficiency, helping businesses make data-driven decisions.

## Table of Contents

- [Introduction](#introduction)
- [Analysis Sections](#analysis-sections)
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

## Introduction

The SQL script performs various analyses on an e-commerce dataset stored in relational database tables. It addresses key business questions such as:
- Who are the most valuable customers?
- What are the top-selling products?
- What trends are visible in sales and orders over time?
- How efficient is the order processing pipeline?
- What are the strongest product associations?

## Analysis Sections

### Overview Statistics

Basic statistics providing a high-level overview of the dataset:
- Total unique customers
- Total unique products
- Total unique orders
- Average number of items per order

### Sales Analysis

Insights into revenue trends and product performance:
- Monthly revenue trends
- Top 10 best-selling products by revenue

### Customer Behavior Analysis

Understanding customer purchase patterns:
- Number of orders, average order value, and purchase recency for each customer
- Segmentation of customers into activity-based groups (e.g., Active, Churn Risk, Churned)

### Product Category Analysis

Revenue trends by product categories:
- Monthly revenue by product category (requires category information in the dataset)
- Count of unique products per category

### Customer Segmentation (RFM Analysis)

Segmentation of customers based on:
- **Recency**: Time since the last purchase
- **Frequency**: Total number of purchases
- **Monetary**: Total spending
Customers are segmented into groups like VIP, Regular, and Occasional based on their RFM scores.

### Order Processing Analysis

Analyzes order processing efficiency:
- Distribution of processing times (e.g., 0-24 hours, 24-48 hours)
- Average processing times (if shipping timestamps are available)

### Geographic Analysis

Regional sales performance:
- Revenue and average order value by country or region
- Identifying high-performing cities or regions

### Time-based Analysis

Trends based on time:
- Sales patterns by day of the week
- Sales patterns by hour of the day

### Product Association Analysis

Frequent product combinations:
- Top product pairs frequently bought together
- Association analysis for complementary products

## Setup and Requirements

### Prerequisites
- A SQL-compatible database (e.g., MySQL, PostgreSQL)
- Dataset tables:
  - `e_commerce_cleaned` or equivalent: Includes columns such as `InvoiceNo`, `StockCode`, `Description`, `Quantity`, `InvoiceDate`, `UnitPrice`, `CustomerID`, and `Country`.
  - Additional category or shipping information is optional but can enrich analysis.

### Data Preparation
Ensure the dataset is imported into your database. The script assumes the following key columns:
- **Order Details**: `InvoiceNo`, `InvoiceDate`
- **Product Details**: `Description`, `StockCode`, `Quantity`, `UnitPrice`
- **Customer Details**: `CustomerID`, `Country`

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/omkarb40/E-commerce-Data-Analysis.git
   cd ecommerce-sql-eda
2. Load your dataset into a SQL database.
3. Run the SQL script:
    SOURCE ecommerce_eda.sql;
4. Review the query results to explore insights.