/* =====================================================
   SUPERMARKET SALES ANALYSIS - SQL QUERIES (STEP 2 of 4)
   Database: supermarket_sales.db (SQLite)
   Table: sales
   Pipeline: Python -> SQL (yeh file) -> Excel -> Power BI
   ===================================================== */


/* Q1: Total Net Sales, Profit, and Transaction Count */
SELECT
    ROUND(SUM(net_sales), 2) AS total_net_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) AS total_transactions
FROM sales;


/* Q2: Branch-wise Performance */
SELECT
    branch_name,
    city,
    ROUND(SUM(net_sales), 2) AS branch_sales,
    ROUND(SUM(profit), 2) AS branch_profit,
    COUNT(*) AS transactions
FROM sales
GROUP BY branch_name, city
ORDER BY branch_sales DESC;


/* Q3: Category-wise Sales and Profit Margin */
SELECT
    category,
    ROUND(SUM(net_sales), 2) AS category_sales,
    ROUND(SUM(profit), 2) AS category_profit,
    ROUND(AVG(profit_margin_pct), 2) AS avg_profit_margin_pct
FROM sales
GROUP BY category
ORDER BY category_sales DESC;


/* Q4: Top 10 Best-Selling Products (by quantity) */
SELECT
    product_name,
    category,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(net_sales), 2) AS total_sales
FROM sales
GROUP BY product_name, category
ORDER BY total_quantity_sold DESC
LIMIT 10;


/* Q5: Monthly Sales Trend */
SELECT
    year,
    month,
    month_num,
    ROUND(SUM(net_sales), 2) AS monthly_sales
FROM sales
GROUP BY year, month, month_num
ORDER BY month_num;


/* Q6: Sales by Day of Week (which days are busiest) */
SELECT
    day_of_week,
    COUNT(*) AS transactions,
    ROUND(SUM(net_sales), 2) AS total_sales
FROM sales
GROUP BY day_of_week
ORDER BY total_sales DESC;


/* Q7: Payment Mode Preference */
SELECT
    payment_mode,
    COUNT(*) AS transactions,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(net_sales) * 100.0 / (SELECT SUM(net_sales) FROM sales), 2) AS pct_of_total_sales
FROM sales
GROUP BY payment_mode
ORDER BY total_sales DESC;


/* Q8: Member vs Non-Member Comparison */
SELECT
    customer_type,
    COUNT(*) AS transactions,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(AVG(net_sales), 2) AS avg_transaction_value
FROM sales
GROUP BY customer_type;


/* Q9: Peak Shopping Hours */
SELECT
    hour,
    COUNT(*) AS transactions,
    ROUND(SUM(net_sales), 2) AS total_sales
FROM sales
GROUP BY hour
ORDER BY transactions DESC;


/* Q10: High-Value Transactions Summary (top 10% of sales) */
SELECT
    COUNT(*) AS high_value_txn_count,
    ROUND(SUM(net_sales), 2) AS high_value_total_sales,
    ROUND(AVG(net_sales), 2) AS avg_high_value_txn
FROM sales
WHERE high_value_txn = 1;
