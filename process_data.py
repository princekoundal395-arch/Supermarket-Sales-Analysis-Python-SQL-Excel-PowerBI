import pandas as pd

# ------------------------------------------------------------
# STEP 1: Load data
# ------------------------------------------------------------
df = pd.read_csv("data/supermarket_sales_raw.csv", parse_dates=['sale_date'])
print("Loaded:", df.shape)


# ------------------------------------------------------------
# STEP 2: Basic quality checks
# ------------------------------------------------------------
print("\nMissing values:\n", df.isnull().sum())
print("\nDuplicate rows:", df.duplicated().sum())


# ------------------------------------------------------------
# STEP 3: Add derived time-based columns
# (useful for Power BI date-hierarchy visuals later)
# ------------------------------------------------------------
df['year'] = df['sale_date'].dt.year
df['month'] = df['sale_date'].dt.month_name()
df['month_num'] = df['sale_date'].dt.month
df['day_of_week'] = df['sale_date'].dt.day_name()
df['hour'] = pd.to_datetime(df['sale_time'], format='%H:%M:%S').dt.hour


# ------------------------------------------------------------
# STEP 4: Add a profit_margin_pct column (profit / net_sales)
# ------------------------------------------------------------
df['profit_margin_pct'] = round((df['profit'] / df['net_sales']) * 100, 2)


# ------------------------------------------------------------
# STEP 5: Flag high-value transactions (useful for a KPI later)
# ------------------------------------------------------------
df['high_value_txn'] = df['net_sales'] > df['net_sales'].quantile(0.90)


# ------------------------------------------------------------
# STEP 6: Save processed file
# ------------------------------------------------------------
df.to_csv("supermarket_sales_processed.csv", index=False)
print("\nSaved supermarket_sales_processed.csv")
print("Final shape:", df.shape)
print(df.dtypes)
