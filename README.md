# Brazilian E-Commerce Data Analysis — Olist

## 📌 Project Overview

This project presents an end-to-end analysis of the Brazilian E-Commerce Public Dataset by Olist.

The project combines MySQL, Python, and Power BI to analyze:

- Sales performance
- Customer behavior
- Product performance
- Seller performance
- Payment behavior
- Delivery operations
- Customer experience

The objective was to transform raw e-commerce data into business insights and an interactive Power BI dashboard.

---

## 🎯 Business Objectives

The analysis aims to answer questions such as:

- How has revenue changed over time?
- Which product categories generate the most revenue?
- Which states contribute the most revenue?
- How do customers purchase and return to the platform?
- Which customer segments generate the most value?
- How concentrated is revenue among sellers?
- How does delivery performance relate to customer satisfaction?
- Which payment methods are most commonly used?

---

## 🛠️ Tools & Technologies

- MySQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Power BI
- DAX
- Jupyter Notebook
- GitHub

---

## 🔄 Project Workflow

Olist Dataset
→ MySQL
→ Data Validation & SQL Analysis
→ Python EDA & Advanced Analysis
→ Power BI
→ Interactive Dashboard
→ Business Insights

---

# 🗄️ SQL Analysis

SQL was used as the primary querying and business-analysis layer.

### Data Validation

- Row counts
- Missing values
- Duplicate checks
- Data consistency checks

### Sales Analysis

- Revenue trends
- Order trends
- Average Order Value
- Category performance
- Geographic performance

### Customer Analysis

- Customer purchase behavior
- Repeat customers
- Customer value
- Customer segmentation

### Product Analysis

- Category performance
- Product-level performance
- Revenue contribution

### Seller Analysis

- Seller revenue
- Seller order volume
- Seller performance
- Revenue concentration

### Payment Analysis

- Payment methods
- Payment behavior
- Installment analysis

### Delivery Analysis

- Delivery time
- Delivery delays
- Estimated vs actual delivery
- Seller processing time

### Customer Experience

- Review scores
- Delivery performance vs customer satisfaction

### Revenue Concentration

- Seller concentration
- Pareto analysis
- Contribution of top-performing sellers

---

# 🐍 Python Analysis

Python was used for exploratory analysis and advanced analysis after the SQL stage.

### Key Areas

- Data cleaning and validation
- Exploratory Data Analysis
- Revenue analysis
- Customer analysis
- RFM analysis
- Customer segmentation
- Seller analysis
- Pareto analysis
- Delivery analysis
- Correlation analysis
- Business insight generation

### RFM Analysis

Customers were analyzed using:

- **Recency** — how recently a customer purchased
- **Frequency** — how frequently a customer purchased
- **Monetary Value** — how much a customer spent

Customers were then grouped into segments such as:

- Champions
- Loyal Customers
- Potential Loyalists
- At Risk
- Lost Customers

---

# 📊 Power BI Dashboard

The final Power BI report contains five interactive pages.

## 1. Executive Overview

Provides a high-level view of business performance through:

- Revenue
- Orders
- Customers
- Average Order Value
- Average Review Score
- Delivery performance
- Revenue trends
- Category performance
- State-level revenue
- Review distribution

## 2. Sales & Product Performance

Includes:

- Revenue by category
- Orders by category
- Units sold
- Revenue trends
- Category performance
- Product/category delivery analysis

## 3. Customer Analysis

Includes:

- RFM customer segmentation
- Customer revenue distribution
- Order frequency distribution
- Average customer spend
- Median customer spend
- Repeat customer analysis

## 4. Seller Analytics

Includes:

- Seller revenue
- Seller order volume
- Top sellers
- Seller revenue distribution
- Seller rating vs revenue
- Revenue concentration
- Pareto analysis

## 5. Delivery & Customer Analysis

Includes:

- Average delivery time
- Seller processing time
- On-time delivery percentage
- Estimated vs actual delivery
- Delivery time distribution
- Delivery vs review score analysis
- Approval time vs delivery performance

---

# 🔎 Key Findings

Some major findings from the analysis include:

- The top 20% of sellers contributed approximately **82% of revenue**.
- The top 20% of sellers contributed approximately **78% of orders**.
- Approximately **93% of orders were delivered on time** based on the project's defined on-time metric.
- Customer purchasing behavior was highly skewed, with many customers making relatively few purchases.
- Revenue contribution varied significantly across product categories and geographic regions.
- Delivery performance varied across orders and product categories.
- Customer review scores were concentrated toward the higher end of the rating scale.

---

# 📸 Dashboard Preview

### Executive Overview

![Executive Overview](Dashboard_Screenshots/executive_overview.png)

### Sales & Product Performance

![Sales & Product Performance](Dashboard_Screenshots/sales_product.png)

### Customer Analysis

![Customer Analysis](Dashboard_Screenshots/customer_analysis.png)

### Seller Analytics

![Seller Analytics](Dashboard_Screenshots/seller_analytics.png)

### Delivery & Customer Analysis

![Delivery & Customer Analysis](Dashboard_Screenshots/delivery_customer.png)

---

# 📁 Repository Structure

```text
olist-ecommerce-data-analysis/
│
├── README.md
├── SQL/
├── Python/
├── PowerBI/
├── Dashboard_Screenshots/
├── requirements.txt
└── .gitignore

Then at the bottom:

```markdown
# 👨‍💻 Author

Nikhil Rajput

Aspiring Data Analyst | Python | SQL | Power BI | C++ | DSA
