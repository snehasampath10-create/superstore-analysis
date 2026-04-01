# superstore-analysis
An end-to-end data analytics project using PostgreSQL for data ingestion, exploration, and cleaning, and Power BI for business intelligence dashboards.


📌 Project Overview
This project analyses the Global Superstore dataset — a fictional retail business spanning multiple regions, product categories, and customer segments. The goal is to surface actionable business insights around profitability, discount strategy, and regional performance.
Key business questions answered:

Which regions and product categories drive the most profit?
Is discounting helping or hurting the business?
Which customer segments are most valuable?
Where are the biggest opportunities to improve margin?


🗂️ Repository Structure
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

🛠️ Tech Stack
ToolPurposePostgreSQLData storage, cleaning, and analysisSQLExploration, transformation, and analytical queriesPower BIInteractive dashboards and visualisationGit/GitHubVersion control

📊 Dataset

Source: Kaggle – Superstore Sales Dataset
Rows: ~10,000 orders
Key fields: Order ID, Order Date, Ship Date, Customer Segment, Region, Category, Sub-Category, Sales, Quantity, Discount, Profit


🔄 Project Workflow
1. Schema & Ingestion (01_schema.sql)

Define table schema with appropriate data types
Load raw CSV into PostgreSQL

2. Exploration (02_explore.sql)

Row counts, null checks, duplicate detection
Distribution of key numeric fields (Sales, Profit, Discount)
Date range validation

3. Cleaning (03_clean.sql)

Handle nulls and inconsistent categorical values
Remove duplicate rows
Standardise date formats
Flag and investigate negative profit records

4. Analysis (04_analyse.sql)

Profitability by region, category, and sub-category
Discount impact analysis
Customer segment performance
Year-over-year sales trends
SQL views created for Power BI consumption

5. Visualisation (Power BI)

Executive summary dashboard (KPIs: Total Sales, Total Profit, Profit Margin)
Regional performance map
Category/Sub-category profitability breakdown
Discount vs. Profit scatter analysis
Customer segment comparison


💡 Key Findings

To be updated upon project completion.


🚀 How to Run

Clone this repository
Download the dataset from Kaggle and place it in /data/
Set up a PostgreSQL database (v14+)
Run SQL scripts in order: 01 → 02 → 03 → 04
Open superstore_dashboard.pbix in Power BI Desktop and update the PostgreSQL connection string


👩‍💻 Author
Sneha — Data Analyst | MSc Business Analytics, University College Cork
LinkedIn · GitHub · Portfolio
