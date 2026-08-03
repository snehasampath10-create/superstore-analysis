# 🧱 Global Superstore — Databricks Medallion Pipeline

An end-to-end data pipeline built on the same Global Superstore dataset as the [main SQL/Power BI project](../README.md), using **Databricks** (Free Edition, Unity Catalog) and the **medallion architecture** pattern (Bronze → Silver → Gold), connected to **Power BI** for the final dashboard.

---

## 📌 Project Overview

This project ingests the raw Orders, People, and Returns CSVs and progresses them through three layers of increasing refinement, ending in three business-ready Gold tables consumed directly by a Power BI dashboard via a Databricks SQL Warehouse.

**Key business questions answered:**
- Which markets and regions drive the most sales?
- Which product sub-categories are profitable — and which are losing money?
- What's the return rate by category?

---

## 🗂️ Contents

```
databricks/
├── notebooks/
│   └── superstore_medallion_pipeline.ipynb   # Full Bronze → Silver → Gold code
├── docs/
│   └── Superstore_Gold_Layer_Summary.docx    # Detailed project write-up
├── powerbi/
│   └── superstore_gold_dashboard.pbix        # Power BI report file
├── screenshots/
│   └── dashboard_overview.png                # Dashboard preview
└── README.md
```

---

## 🏗️ Architecture

| Layer | Purpose | Key Details |
|-------|---------|-------------|
| **Bronze** | Raw ingestion | CSVs loaded as Delta tables, `inferSchema=false`, explicit quote/escape/multiLine parsing, column names standardized. A `bronze_rejected` table quarantines 300 rows with corrupted `Sales` values instead of silently dropping them. |
| **Silver** | Cleaning & typing | Reads from Bronze (not raw CSV). Uses SQL `try_cast` throughout instead of DataFrame `.cast()`, since Databricks Serverless throws hard errors on bad casts rather than nulling them. |
| **Gold** | Business-ready aggregates | Three tables purpose-built for BI consumption (see below). |

---

## 🥇 Gold Layer Tables

| Table | Grouping | Purpose |
|-------|----------|---------|
| `gold_sales_by_region` | Market, Region | Total sales, profit, and order count by geography, preserving the Market → Region drill-down hierarchy |
| `gold_profit_by_category` | Category, Sub_Category | Total sales, profit, order count, and profit margin % per product line |
| `gold_return_rates` | Category | Return rate % by category |

---

## 🔍 Data Quality Finding: Non-Unique Order_ID

While building `gold_return_rates`, a join between `silver_orders` and `silver_returns` surfaced a subtle bug: **`Order_ID` is not globally unique** in this dataset. 37 distinct Order_IDs span more than one `Market` — meaning two unrelated orders from different markets can share the same ID.

**Fix:** joined on the compound key of `Order_ID` + `Market` instead of `Order_ID` alone, verified as unique before proceeding. Without this fix, return status could have been silently misattributed between unrelated orders — a correctness bug that would never have thrown an error.

Full details are in [`docs/Superstore_Gold_Layer_Summary.docx`](docs/Superstore_Gold_Layer_Summary.docx).

---

## 📊 Power BI Dashboard

![Dashboard Preview](screenshots/dashboard_overview.png)

Connected via a Databricks SQL Warehouse (Server Hostname + HTTP Path + Personal Access Token, `BI Tools`/`sql` scope), Import mode, all three Gold tables loaded directly.

**Visuals:**
- **Total Sales by Region** — clustered bar chart, color-coded by Market
- **Profit Margin % by Sub-Category** — sorted ascending, clearly surfacing `Tables` as the sole loss-making sub-category (-8.46%)
- **Return Rate % by Category** — clustered column chart with data labels

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Databricks (Free Edition) | Medallion pipeline, Delta Lake, Unity Catalog |
| PySpark / Spark SQL | Data transformation |
| Databricks SQL Warehouse | Power BI connection point |
| Power BI | Dashboard and visualization |

---

## 👩‍💻 Author

**Sneha** — Data Analyst | MSc Business Analytics, University College Cork

[LinkedIn](https://linkedin.com/in/sneha-sampath-/)
