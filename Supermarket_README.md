# 🛒 Supermarket Sales Analysis (Python + SQL + Excel + Power BI)

## 📌 Project Overview
An end-to-end sales analysis project covering a full analyst tech stack. Raw supermarket transaction data is cleaned and enriched in **Python**, queried and validated in **SQL**, summarized in an **Excel** working sheet, and finally visualized in an interactive **Power BI** dashboard.

## 🎯 Objective
- Demonstrate a complete real-world analyst pipeline across 4 tools
- Analyze sales performance by branch, category, product, time, and payment mode
- Identify top-performing products, peak shopping hours, and profit drivers

## 🛠️ Tools & Technologies
- **Python** (pandas) — data cleaning and feature engineering
- **SQL** (SQLite) — business queries and aggregation
- **Excel** (openpyxl) — processed data + SUMIF-based summary calculations, feeding the Power BI model
- **Power BI** — final interactive dashboard with all visuals and charts

## 📂 Project Structure
```
├── data/
│   ├── supermarket_sales_raw.csv         → Original generated dataset (1,800 transactions)
│   └── supermarket_sales_processed.csv   → Cleaned + enriched data (used in Excel & Power BI)
├── python/
│   └── process_data.py                   → Cleaning & feature engineering script
├── sql/
│   ├── supermarket_sales.db              → SQLite database
│   └── sql_queries.sql                   → 10 business queries
├── excel/
│   └── Supermarket_Sales_Report.xlsx     → Processed Data sheet + Chart Data (SUMIF summary calculations)
├── powerbi/
│   └── supermarket_sales_analysis.pbix   → Interactive Power BI dashboard (KPI cards, branch/category/monthly/payment/product visuals)
└── README.md
```

## 🔄 Pipeline
```
Raw CSV → Python (clean + enrich) → SQL (query + validate) → Excel (processed data + summary calcs) → Power BI (interactive dashboard)
```

## 📊 Key Insights
| Metric | Value |
|---|---|
| Total Sales | ₹4,00,470.70 |
| Total Profit | ₹72,344.85 |
| Total Transactions | 1,800 |
| Average Transaction Value | ₹222.48 |
| Top Category | Grocery |
| Busiest Day | Saturday |

## 🧮 Python Processing (`python/process_data.py`)
- Quality checks (missing values, duplicates)
- Derived columns: `year`, `month`, `day_of_week`, `hour`, `profit_margin_pct`, `high_value_txn`

## 🗄️ SQL Analysis (`sql/sql_queries.sql`)
10 queries covering: overall KPIs, branch performance, category profit margins, top products, monthly trend, day-of-week analysis, payment mode split, member vs non-member comparison, peak hours, and high-value transactions.

## 📈 Excel Working File
`Supermarket_Sales_Report.xlsx` holds two sheets:
- **Processed Data** — the full cleaned & enriched dataset
- **Chart Data** — SUMIF-based summary tables (sales by branch, category, month, payment mode, top products) used as the calculation layer feeding the Power BI model

## 📊 Power BI Dashboard
`powerbi/supermarket_sales_analysis.pbix` is the final interactive dashboard, built on top of the processed data. It includes:
- KPI cards (total sales, profit, transactions, avg. transaction value)
- Sales by Branch (column chart)
- Sales by Category (donut/pie chart)
- Monthly Sales Trend (line chart)
- Payment Mode split
- Top Products (combo chart)

## 💡 Business Recommendations
- **Grocery** category drives the most revenue — ensure strong stock availability
- **Saturday** is the busiest day — plan staffing accordingly
- Promote high-margin categories more heavily in marketing
- Investigate low-performing branches for improvement opportunities

## 🚀 How to Reproduce
1. `python process_data.py` → generates `supermarket_sales_processed.csv`
2. Load the processed CSV into SQLite and run `sql_queries.sql`
3. Load `supermarket_sales_processed.csv` into `Supermarket_Sales_Report.xlsx` (Processed Data sheet); Chart Data sheet auto-calculates via SUMIF formulas
4. Open `supermarket_sales_analysis.pbix` in Power BI Desktop to view/refresh the dashboard

---
**Author:** [Your Name] | Data Analyst Portfolio Project
