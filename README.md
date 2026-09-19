# Brazilian E-Commerce Data Analysis — Olist

## 📌 Project Overview

This project presents an end-to-end analysis of the Brazilian E-Commerce Public Dataset by Olist.

The project combines **MySQL, Python, and Power BI** to analyze sales performance, customer behavior, product performance, seller performance, payments, delivery operations, and customer experience.

The objective was not only to explore the data, but to translate the analysis into actionable business insights and an interactive Power BI dashboard.

---

## 🎯 Business Objectives

The analysis focuses on answering questions such as:

- How has revenue changed over time?
- Which product categories generate the most revenue?
- Which states contribute the most to revenue?
- How do customers behave and how frequently do they purchase?
- Which customer segments generate the most value?
- How concentrated is revenue among sellers?
- How does delivery performance affect customer experience?
- What payment methods are most commonly used?
- Which factors are associated with customer review scores?

---

## 🛠️ Tools & Technologies

- **MySQL** — Data storage, data validation, joins, aggregations and business analysis
- **Python** — Exploratory data analysis, feature engineering and advanced analysis
- **Pandas & NumPy** — Data manipulation and analysis
- **Matplotlib & Seaborn** — Data visualization
- **Power BI** — Interactive dashboard and business intelligence
- **Jupyter Notebook** — Python analysis environment
- **GitHub** — Project documentation and version control

---

# 📊 Project Workflow

```text
Olist Dataset
      ↓
    MySQL
      ↓
Data Validation & SQL Analysis
      ↓
    Python
      ↓
EDA + Advanced Analysis
      ↓
   Power BI
      ↓
Interactive Business Dashboard
      ↓
Business Insights & Recommendations

text```

##🗄️ SQL Analysis

The SQL analysis covers multiple business areas:

#Data Validation
Row counts
Missing values
Duplicate checks
Data consistency checks
#Sales Analysis
Revenue trends
Order trends
Average order value
Category performance
Geographic performance
#Customer Analysis
Customer purchase behavior
Repeat customers
Customer value
Customer segmentation
#Product Analysis
Category performance
Product-level performance
Revenue contribution
#Seller Analysis
Seller revenue
Seller order volume
Seller performance
Revenue concentration
#Payment Analysis
Payment methods
Payment behavior
Installment analysis
#Delivery Analysis
Delivery time
Delivery delays
Estimated vs actual delivery
Seller processing time
Customer Experience
Review scores
Delivery performance vs customer satisfaction
Revenue Concentration
Seller concentration
#Pareto analysis
Contribution of top-performing sellers

##🐍 Python Analysis

Python was used to perform exploratory and advanced analysis after the SQL stage.

Key areas include:

Data cleaning and validation
Exploratory Data Analysis
Revenue analysis
Customer analysis
RFM analysis
Customer segmentation
Seller analysis
Pareto analysis
Delivery analysis
Correlation analysis
Business insight generation
RFM Analysis

Customers were analyzed using:

Recency
Frequency
Monetary Value

Customers were then grouped into meaningful segments such as:

Champions
Loyal Customers
Potential Loyalists
At Risk
Lost Customers

##📊 Power BI Dashboard

The final Power BI report contains five main pages.

#1. Executive Overview

Provides a high-level view of business performance through:

Revenue
Orders
Customers
Average Order Value
Average Review Score
Delivery performance
Revenue trends
Category performance
State-level revenue
Review distribution

#2. Sales & Product Performance

Includes:

Revenue by category
Orders by category
Units sold
Revenue trends
Category performance
Product/category delivery analysis
#3. Customer Analysis

Includes:

RFM customer segmentation
Customer revenue distribution
Order frequency distribution
Average customer spend
Median customer spend
Repeat customer analysis

#4. Seller Analytics

Includes:

Seller revenue
Seller order volume
Top sellers
Seller revenue distribution
Seller rating vs revenue
Revenue concentration
Pareto analysis

#5. Delivery & Customer Analysis

Includes:

Average delivery time
Seller processing time
On-time delivery percentage
Estimated vs actual delivery
Delivery time distribution
Delivery vs review score analysis
Approval time vs delivery performance
🔎 Key Findings

#Some of the major findings from the analysis include:

Revenue is concentrated among a relatively small group of sellers.
The top 20% of sellers contribute a substantial share of overall revenue.
Customer purchasing behavior is highly skewed, with a large proportion of customers making relatively few purchases.
Delivery performance varies considerably across orders and product categories.
Customer review scores are concentrated toward the higher end of the rating scale.
Revenue contribution varies significantly across product categories and geographic regions.
