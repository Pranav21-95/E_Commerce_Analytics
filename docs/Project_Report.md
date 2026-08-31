# E-Commerce Sales & Customer Analytics — Project Report

## 1. Project Overview

This project analyzes an e-commerce business using the Brazilian E-Commerce Public Dataset by Olist.

The objective is to transform raw transactional data into meaningful business insights using PostgreSQL, SQL, Python, and Power BI.

The analysis covers revenue performance, customer behavior, RFM segmentation, product performance, seller performance, delivery operations, payment behavior, and customer satisfaction.

---

## 2. Objectives

- Analyze overall e-commerce revenue and order performance.
- Understand customer purchasing behavior and customer segmentation.
- Identify high-performing product categories and products.
- Evaluate delivery performance and late-delivery patterns.
- Analyze the relationship between delivery performance and customer reviews.
- Evaluate seller revenue contribution and concentration.
- Build an interactive Power BI dashboard for business decision-making.
- Generate actionable recommendations from the analysis.

---

## 3. Dataset

The project uses the Brazilian E-Commerce Public Dataset by Olist.

The dataset contains interconnected tables covering:

- Customers
- Orders
- Order Items
- Order Payments
- Order Reviews
- Products
- Sellers
- Geolocation
- Product Category Translation

The tables are connected using identifiers such as customer ID, order ID, product ID, seller ID, and geographic information.

---

## 4. Tools & Technologies

| Technology | Purpose |
|---|---|
| PostgreSQL | Database storage and SQL analysis |
| SQL | Data querying, joins, aggregation, ranking, and business analysis |
| Python | Data cleaning and exploratory analysis |
| Pandas | Data manipulation |
| NumPy | Numerical analysis |
| Matplotlib | Data visualization |
| Seaborn | Exploratory visualization |
| Power BI | Interactive dashboard development |
| DAX | Business measures and calculated metrics |
| Git/GitHub | Version control and project documentation |

---

## 5. Project Workflow

```text
Raw E-Commerce Data
        ↓
Data Understanding
        ↓
Data Cleaning & Preparation
        ↓
PostgreSQL Database
        ↓
SQL Business Analysis
        ↓
Python Exploratory Analysis
        ↓
Business Metrics & Insights
        ↓
Power BI Data Model
        ↓
Interactive Dashboard
        ↓
Business Recommendations

## 6. Analysis Performed

### 6.1 Sales Performance

The sales analysis evaluates:

- Total revenue
- Total orders
- Average order value
- Monthly revenue trends
- Yearly performance
- Product-category revenue
- Payment-method revenue

### 6.2 Customer Analysis

The customer analysis evaluates:

- Total customers
- Customer distribution
- Repeat purchasing behavior
- Customer spending
- RFM segmentation
- Customer value by segment

RFM segmentation categorizes customers into groups including:

- Champions
- Loyal
- Needs Attention
- Low Value

### 6.3 Product & Seller Analysis

The analysis evaluates:

- Product-category performance
- Top products by revenue
- Seller revenue
- Top-performing sellers
- Seller revenue concentration

### 6.4 Delivery & Operations

The analysis evaluates:

- Average delivery time
- Late delivery rate
- Delivery performance by state
- Delivery status
- Low-rating rate by delivery status
- Relationship between delivery performance and customer reviews

### 6.5 Customer Satisfaction

The analysis evaluates:

- Average review score
- Low-rated orders
- Review performance by delivery status
- Relationship between delivery performance and customer satisfaction

### 6.6 Payment Analysis

The analysis evaluates:

- Payment methods
- Payment values
- Payment behavior
- Revenue contribution by payment method

---

## 7. Key Business Metrics

| Metric | Result |
|---|---:|
| Total Revenue | $16.01M |
| Total Customers | 96K |
| Total Orders | 99.441K |
| Delivered Orders | 96K |
| Average Order Value | $160.99 |
| Late Delivery Rate | 8.11% |
| Average Delivery Time | 12.56 days |
| Average Review Score | 4.09 |
| Average Customer Spend | 166.59 |
| Top 10 Seller Revenue Share | 13.15% |
| Top 50 Seller Revenue Share | 32.89% |
| Top 100 Seller Revenue Share | 45.06% |

---

## 8. Power BI Dashboard

The Power BI dashboard contains three analytical pages.

### Page 1 — Executive Overview

Provides a high-level view of overall business performance.

**Key components:**

- Total Revenue
- Total Customers
- Delivered Orders
- Total Orders
- Average Order Value
- Late Delivery Rate
- Average Review Score
- Monthly Revenue Trend
- Top 10 Product Categories by Revenue
- Revenue by Payment Method
- Customer Type Distribution
- Year filtering

### Page 2 — Customer & Product Intelligence

Focuses on customer segmentation, customer value, and product performance.

**Key components:**

- Average Customer Spend by RFM Segment
- Average Customer Spend
- Customer Spend by RFM Segment
- Average Order Value by RFM Segment
- Customers by RFM Segment
- Top 10 Products by Revenue
- RFM Score vs Customer Value
- Customer Segment filtering

### Page 3 — Operations & Seller Performance

Focuses on delivery operations, customer satisfaction, and seller performance.

**Key components:**

- Overall Low Rating Rate
- Average Delivery Time (Days)
- Late Delivery Rate by State
- Delivery Status vs Average Review Score
- Low Rating Rate by Delivery Status
- Top 10 Sellers by Revenue
- Top 10 Seller Revenue Share
- Top 50 Seller Revenue Share
- Top 100 Seller Revenue Share

---

## 9. Key Business Findings

### Revenue & Orders

- Total revenue is approximately **$16.01M**.
- The dataset contains approximately **99.44K orders**.
- Average order value is approximately **$160.99**.

### Customer Behavior

- The dataset contains approximately **96K customers**.
- RFM segmentation identifies customers with different purchasing behavior and value.
- Customer segmentation can support targeted retention and re-engagement strategies.

### Delivery & Customer Satisfaction

- Approximately **8.11%** of orders are classified as late.
- Average delivery time is approximately **12.56 days**.
- Late deliveries are associated with substantially lower customer review scores.
- Delivery performance is therefore an important component of customer satisfaction.

### Seller Performance

- The top 10 sellers contribute approximately **13.15%** of revenue.
- The top 50 sellers contribute approximately **32.89%** of revenue.
- The top 100 sellers contribute approximately **45.06%** of revenue.

---

## 10. Business Recommendations

### 1. Improve Delivery Performance

Prioritize regions and operational areas with higher late-delivery rates to improve delivery reliability and customer satisfaction.

### 2. Reduce Late Deliveries

Because late deliveries are associated with lower review scores, improving delivery reliability should be a key operational priority.

### 3. Retain High-Value Customers

Use RFM segmentation to identify Champions and Loyal customers and develop targeted retention strategies.

### 4. Re-engage At-Risk Customers

Develop targeted campaigns for Needs Attention customers to encourage repeat purchases and improve customer lifetime value.

### 5. Monitor Seller Concentration

Track revenue contribution from top sellers to identify important seller relationships and potential concentration risks.

### 6. Optimize Product Strategy

Use product and category revenue analysis to prioritize high-performing products and identify opportunities for weaker categories.

---

## 11. Conclusion

The E-Commerce Sales & Customer Analytics project demonstrates an end-to-end Data Analyst workflow, from raw transactional data through database analysis, SQL querying, exploratory analysis, business intelligence, and interactive dashboard development.

The project provides business visibility into revenue, customer behavior, product performance, delivery operations, customer satisfaction, payment methods, and seller contribution.

The resulting Power BI dashboard converts the analytical results into an interactive reporting solution that can support data-driven business decisions related to customer retention, operational improvement, product strategy, and seller management.

---

## 12. Project Deliverables

- PostgreSQL database and analysis
- SQL business analysis
- Python exploratory analysis
- RFM customer segmentation
- DAX business measures
- Interactive Power BI dashboard
- Business insights
- Business recommendations
- Project documentation

---

## 13. Project Status

**Completed**

- ✅ Data preparation
- ✅ PostgreSQL database analysis
- ✅ SQL business analysis
- ✅ Python exploratory analysis
- ✅ RFM customer segmentation
- ✅ Business KPI development
- ✅ Power BI dashboard
- ✅ Business insights
- ✅ Business recommendations
- ✅ Project documentation