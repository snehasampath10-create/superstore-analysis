# 🛒 Superstore Sales Analytics

An end-to-end data analytics project using **PostgreSQL** for data ingestion, exploration, and cleaning, and **Power BI** for business intelligence dashboards.

---

## 📌 Project Overview

This project analyses the Global Superstore dataset — a fictional retail business spanning multiple regions, product categories, and customer segments. The goal is to surface actionable business insights around profitability, discount strategy, and regional performance.

**Key business questions answered:**
- Which regions and product categories drive the most profit?
- Is discounting helping or hurting the business?
- Which customer segments are most valuable?
- Where are the biggest opportunities to improve margin?

---

## 🗂️ Repository Structure

```
superstore-analytics/
├── data/
│   └── superstore_raw.csv        # Raw dataset (source: Kaggle)
├── sql/
│   ├── 01_schema.sql             # Table creation and data loading
│   ├── 02_explore.sql            # Exploratory queries (nulls, distributions, ranges)
│   ├── 03_clean.sql              # Data cleaning and transformation
│   └── 04_analyse.sql            # Analytical queries and views
├── powerbi/
│   └── superstore_dashboard.pbix # Power BI report file
├── screenshots/
│   └── dashboard_overview.png    # Dashboard preview for README
└── README.md
```

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| PostgreSQL | Data storage, cleaning, and analysis |
| SQL | Exploration, transformation, and analytical queries |
| Power BI | Interactive dashboards and visualisation |
| Git/GitHub | Version control |

---

## 📊 Dataset

- **Source:** [Kaggle – Superstore Sales Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Rows:** 9,986 (after cleaning)
- **Key fields:** Order ID, Order Date, Ship Date, Customer Segment, Region, Category, Sub-Category, Sales, Quantity, Discount, Profit
- **Date range:** January 2014 – December 2017

---

## 🔄 Project Workflow

### 1. Schema & Ingestion (`01_schema.sql`)
- Define table schema with appropriate data types
- Load raw CSV into PostgreSQL
- Handle encoding (LATIN1) and date format (MM/DD/YYYY) issues

### 2. Exploration (`02_explore.sql`)
- Row counts, null checks, duplicate detection
- Distribution of key numeric fields (Sales, Profit, Discount)
- Date range validation
- Distinct value checks on categorical columns

### 3. Cleaning (`03_clean.sql`)
- Created `superstore_clean` table preserving raw data
- Removed 8 duplicate order/product rows
- Fixed 16 whitespace issues in text columns
- Confirmed 1,870 negative profit rows as legitimate business losses

### 4. Analysis (`04_analyse.sql`)
- Overall business KPIs
- Profitability by region, category, and sub-category
- Discount impact analysis by discount bucket
- Year-over-year sales and profit trends
- Customer segment performance

### 5. Visualisation (Power BI)
- Executive summary dashboard (KPIs: Total Sales, Total Profit, Profit Margin)
- Regional performance map
- Category/Sub-category profitability breakdown
- Discount vs. Profit analysis
- Customer segment comparison
- Year-over-year trend lines

---

## 💡 Key Findings

- **Overall performance:** $2.3M in sales and $286K profit over 4 years at a 12.46% margin across 5,009 orders and 793 customers
- **Regional insight:** The West region leads with a 14.95% margin while Central significantly underperforms at just 7.92% despite generating $501K in sales
- **Category insight:** Technology and Office Supplies both achieve ~17% margins while Furniture is nearly breaking even at just 2.48%
- **Sub-category insight:** Tables are actively loss-making at -8.56% margin, losing $17K on $207K of sales — the single biggest drag on profitability
- **Discount tipping point:** Orders with discounts above 20% generate negative profit margins. 1,392 orders (14% of all orders) fall into this category, collectively losing $135K in profit
- **Growth trend:** Sales grew 51% from 2014 to 2017 with profit nearly doubling, though margin dipped slightly in 2017 — a trend worth monitoring
- **Best segment:** Home Office customers deliver the highest margin at 14.03% despite being the smallest segment by volume

---

## 🚀 How to Run

1. Clone this repository
2. Download the dataset from Kaggle and place it in `/data/`
3. Set up a PostgreSQL database (v14+)
4. Run SQL scripts in order: `01` → `02` → `03` → `04`
5. Open `superstore_dashboard.pbix` in Power BI Desktop and update the PostgreSQL connection string

---

## 👩‍💻 Author

**Sneha** — Data Analyst | MSc Business Analytics, University College Cork  
