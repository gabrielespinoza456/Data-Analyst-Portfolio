# 🏡 US Housing Market Monitor (2000–2025)

![Dashboard Screenshot](link_to_your_dashboard_screenshot.png)

### [📂 Download Interactive Dashboard (.pbix) via Google Drive](https://drive.google.com/file/d/1Xw_J7vsRNeZNt8Ngcw3EkR4ELhZ2Csnk/view?usp=drive_link)

## 📄 Project Overview
**Goal:** To build a comprehensive **Housing Market Monitor** that tracks the US real estate landscape across geography, time, and economic conditions, specifically challenging the idea that "Home Price" is the sole indicator of affordability.

## 💾 Data Sources
* **Zillow Research Data:** [Zillow Home Value Index (ZHVI)](https://www.zillow.com/research/data/) - *Used for historical home value data across all US zip codes.*
* **Federal Reserve Economic Data (FRED):** [30-Year Fixed Rate Mortgage Average (MORTGAGE30)](https://fred.stlouisfed.org/series/MORTGAGE30) - *Used for historical interest rate data.*

## 🔍 Key Features & Capabilities
1.  **Geospatial Drill-Down:**
    * Interactive US Heat Map illustrating regional price disparities.
    * **Custom Tooltips:** Hovering over any state reveals a dynamic 25-year trendline of monthly payments for that specific region.
2.  **Current Cost Analysis:**
    * **Top 15 Ranking:** Automatically filters and ranks the most expensive US cities based on *current* monthly mortgage costs (2025).
    * **KPI Indicators:** Real-time tracking of National Average Home Price, Interest Rate, and Estimated Monthly Payment.
3.  **Macroeconomic Context:**
    * **Dual-Axis Analysis:** Visualizes the decoupling of Home Price vs. Monthly Cost to show the impact of recent interest rate hikes.
    * **Market Volatility Tracker:** A "Play Axis" scatter plot that animates the correlation between interest rates and market value over the last two decades.

## 📉 Key Insight: The Affordability Gap
* **The Decoupling:** Traditional analysis focuses on **Home Value**, which suggests the market cooled in 2023.
* **The Reality:** My dashboard tracks **Monthly Payment** (Principal + Interest), revealing that the **cost to enter the market** has risen dramatically in recent years. This proves that interest rates are now a stronger driver of affordability than listing prices.

## 🛠️ Tech Stack & Implementation

### 📉 Excel | *Data Preparation & Validation*
* **Pivot Table:** Created a Pivot Table from the Federal Reserve Economic Data (FRED) (`MORTGAGE30US.xlsx`) dataset to ensure date alignment before joining with the Zillow dataset.
* **Data Formatting:** Standardized date formats and column headers to ensure clean joins between the housing and economic datasets.

### 🐍 Python (Pandas & MySQL Connector) | *ETL & Data Engineering*
* **Data Transformation:** Used Pandas to **unpivot (melt)** the raw Zillow CSVs from a "Wide" format (one column per date) to a "Long" format (one row per date).
* **Database Ingestion:** Standard data import methods failed: the MySQL Import Wizard was unfeasibly slow for the 8M+ row dataset, and executing a SQL import script was blocked by client-side GUI permission restrictions.
    * **Solution:** I wrote a custom Python script using the `mysql-connector` library to establish a direct server connection. This allowed me to programmatically batch-insert the data, bypassing both the speed bottlenecks and the GUI's permission limits.

### 🗄️ SQL (MySQL) | *Business Logic*
* **Logic over Spreadsheets:** Instead of calculating mortgage costs in Excel, I created a **SQL View** (`housing_analysis_view.sql`) to handle the math automatically if the data were to be updated.
* **The Algorithm:** Implemented the **Standard Amortization Formula** directly within the SQL query to calculate the "True Monthly Payment" for every row based on the historical Federal Interest Rate joined by date.
    > *Formula Logic: `P * (r(1+r)^n) / ((1+r)^n - 1)`*
    > Note: This calculation assumes a standard 30-year mortgage.

### 📊 Power BI | *Visualization & DAX*
* **SQL Connection:** Retrieved `housing_analysis_view` by utilizing a local MySQL connection.
* **DAX Measures:** Wrote custom measures (e.g., `Current Monthly Payment`) to filter for the latest 2025 data in the rankings while keeping historical data available for trendlines.
* **UI/UX:** Designed "Report Page Tooltips" to provide a 25-year historical drill-down when hovering over any state on the map.

## 📂 Project Structure
> ⚠️ **Note on File Sizes:** Due to GitHub's file size limits (100MB), the raw Zillow CSVs, the unpivoted dataset, and the Power BI file are not hosted directly in this repository. Please use the **Google Drive link** above to view the dashboard, or the **Data Sources** links to access the raw data. You can run `Unpivoting_Zillow_Data.ipynb` to recreate the unpivoted Zillow data.

* `MORTGAGE30US.xlsx`: Excel sheet showing the Pivot Table creation.
* `us_mortgage_rates.csv`: The resulting CSV from the Pivot Table created from the FRED dataset.
* `Unpivoting_Zillow_Data.ipynb`: Jupyter Notebook for unpivoting the Zillow data and exporting the result to a CSV file.
* `mySQL import debugging.ipynb`: Jupyter Notebook for importing the unpivoted Zillow data to a local MySQL server.
* `Zillow_Rates_View.sql`: SQL View definition containing the mortgage calculation logic.
* `Housing_Portfolio_Project.pbix`: The interactive Power BI dashboard file.

---
*Created by [Gabriel Espinoza]*
