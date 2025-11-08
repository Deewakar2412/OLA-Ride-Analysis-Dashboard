<div align="center">
  <h1 align="center">🚕 OLA-Ride-Hailing Performance Analysis 🚕</h1>
  <p align="center">
    An end-to-end analysis of 100,000 booking records, from data cleaning (Python) and analysis (SQL) to a final performance dashboard (Power BI).
  </p>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas"/>
  <img src="https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL"/>
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI"/>
  <img src="https://img.shields.io/badge/Google%20Colab-F9AB00?style=for-the-badge&logo=googlecolab&logoColor=black" alt="Google Colab"/>
</p>

---

## 📌 Table of Contents
- <a href="#overview">Overview</a>
- <a href="#business-problem">Business Problem</a>
- <a href="#dataset">Dataset</a>
- <a href="#tools--technologies">Tools & Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#project-workflow--data-pipeline">Project Workflow & Data Pipeline</a>
- <a href="#key-performance-indicators-kpis">Key Performance Indicators (KPIs)</a>
- <a href="#research-questions--key-findings">Research Questions & Key Findings</a>
- <a href="#key-visualizations-dashboard">Key Visualizations (Dashboard)</a>
- <a href="#how-to-run-this-project">How to Run This Project</a>
- <a href="#final-recommendations">Final Recommendations</a>
- <a href="#author--contact">Author & Contact</a>

---
<h2><a class="anchor" id="overview"></a>Overview</h2>

This project is an end-to-end analysis of a 100,000-row dataset from a ride-hailing company. The primary goal is to transform raw, messy data into a clean, queryable database and, ultimately, into an interactive Power BI dashboard. This dashboard provides actionable insights to help management optimize operations, refine marketing strategies, and improve overall service quality.

---
<h2><a class="anchor" id="business-problem"></a>Business Problem</h2>

The management lacked clear, data-driven answers to critical business questions. This project was designed to solve that by addressing the following:
- What is our true booking success rate, and why are rides failing?
- Who are our most valuable customers (and is our current definition correct)?
- Where is our revenue coming from in terms of vehicle types?
- Where are our high-demand "hotspots," and where are driver cancellations most common?

---
<h2><a class="anchor" id="dataset"></a>Dataset</h2>

- **Source:** `1. Data/Raw_Data/Bookings-100000-Rows.xlsx`
- **Rows:** 100,000
- **Key Fields:**
  - `Booking_ID`: Unique identifier for each booking.
  - `Booking_Status`: 'Success', 'Canceled by Driver', 'Driver Not Found', etc.
  - `Customer_ID`: Unique ID for each customer.
  - `Vehicle_Type`: 'Prime Sedan', 'Prime SUV', 'Bike', etc.
  - `Pickup_Location`: Starting point of the ride.
  - `Booking_Value`: The revenue generated from the ride.
  - `V_TAT`: Vehicle Turnaround Time (wait time).
  - `Driver_Ratings`: Rating given to the driver.

---
<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>

- **Google Colab:** For data cleaning and preparation.
- **Python:** The core language for data cleaning.
- **Pandas:** For data loading, cleaning, and manipulation.
- **SQL (PostgreSQL/MySQL):** For database creation, schema design, and analytical queries.
- **Power BI:** For building the final interactive dashboard.

---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
pizza-sales-analysis/
│
├── README.md
│
├── Data/                   
│   ├── pizza_sales (3).csv
│   ├── pizza_sales_excel_file (2).xlsx
│
├── Main Business Requirements Doc.pdf    
│   └── Pizza_Sales_EDA.ipynb
│
├── Pizza_Sales_EDA.ipy

```
---
<h2><a class="anchor" id="project-workflow--data-pipeline"></a>Project Workflow & Data Pipeline</h2>

This project followed a 4-step data pipeline:

1.  **Data Cleaning (Python):** The raw `.xlsx` file was loaded into a Python (Pandas) script in Google Colab.
    - Dropped unusable columns (`Incomplete_Rides_Reason`, `Canceled_Rides_by_Customer`).
    - Imputed missing numerical data (`Driver_Ratings`, `V_TAT`) with the **median**.
    - Imputed missing categorical data (`Payment_Method`) with the **mode**.
    - Exported the final `cleaned_bookings.csv`.

2.  **Data Modeling (SQL):** A SQL database schema (`CREATE TABLE ride_bookings`) was designed (see `2_Database_Schema.sql`) to store the cleaned data with appropriate data types.

3.  **Data Analysis (SQL):** A set of 13 comprehensive SQL queries (see `3_Business_Analysis_Queries.sql`) were written to answer all key business questions, such as Top 10 Customers, Daily Revenue Trends, and High Cancellation Locations.

4.  **Data Visualization (Power BI):** The SQL database was connected to Power BI. The SQL queries were used to create the final dashboard, visualizing all KPIs and findings.

---
<h2><a class="anchor" id="key-performance-indicators-kpis"></a>Key Performance Indicators (KPIs)</h2>

The dashboard immediately highlights the core business health metrics:
- **Total Bookings:** 100k
- **Booking Success Rate:** 62.08%
- **Driver Cancellation Rate:** 17.89%
- **Driver Not Found Rate:** 9.83%
- **Top Revenue Source:** Prime Sedan (8.8M)

---
<h2><a class="anchor" id="research-questions--key-findings"></a>Research Questions & Key Findings</h2>

1.  **What is our operational health?**
    * **Finding:** While 62.08% of rides are successful, the business is leaking significant revenue. The biggest problem is **'Canceled by Driver' (17.89%)**, which is almost double the 'Driver Not Found' rate (9.83%). This points to a driver-side issue, not just a supply issue.

2.  **Where does our revenue come from?**
    * **Finding:** The **'Prime Sedan'** category is the undisputed financial driver, responsible for **8.8M in revenue**. This is significantly more than the 'Prime SUV' (5.5M).

3.  **Who are our most valuable customers?**
    * **Finding:** The original metric (Booking Count) was **flawed** as it included canceled rides. By creating a new metric, **'Top Customers by Total Spending'** (on successful rides only), we identified the *true* high-value customers. The top customer (`CID995321`) alone contributed **77.3K** in revenue.

4.  **Where is demand highest?**
    * **Finding:** The top 3 pickup locations are **'Whitefield', 'Marathahalli', and 'Electronic City'**. This data is critical for operational focus and driver allocation.

---
<h2><a class="anchor" id="key-visualizations-dashboard"></a>Key Visualizations (Dashboard)</h2>

The full dashboard contains all insights. Below are some of the key charts that drove the final recommendations.

**Booking Status Overview**
*(This chart highlights the critical 17.89% Driver Cancellation rate.)*
`![Booking Status](3.%20Dashboard/Dashboard_Screenshots/Screenshot%202025-11-03%20193528.png)`

**Total Revenue by Vehicle Type**
*(This chart clearly shows 'Prime Sedan' as the main revenue driver.)*
`![Revenue by Vehicle](3.%20Dashboard/Dashboard_Screenshots/Screenshot%202025-11-03%20193546.png)`

**Top 5 Customers by Total Spending**
*(This chart identifies the "hero" customers for marketing, based on revenue.)*
`![Top 5 Customers](3.%20Dashboard/Dashboard_Screenshots/Screenshot%202025-11-03%20193512.png)`

---
<h2><a class="anchor" id="how-to-run-this-project"></a>How to Run This Project</h2>

This project involves three main components: Python, SQL, and Power BI.

1.  **Data Cleaning:**
    * Open `2. Scripts/1_Data_Cleaning.ipynb` in Google Colab or a local Jupyter environment.
    * Upload the `Bookings-100000-Rows.xlsx` file.
    * Run all cells to generate the `cleaned_bookings.csv` file.

2.  **Database Setup:**
    * In your SQL database (e.g., PostgreSQL, MySQL), run the `2. Scripts/2_Database_Schema.sql` script to create the `ride_bookings` table.
    * Import the `cleaned_bookings.csv` data into this table.

3.  **Analysis:**
    * Use the queries in `2. Scripts/3_Business_Analysis_Queries.sql` to analyze the data directly in your SQL client.

4.  **Dashboard:**
    * Open `3. Dashboard/Ride_Performance_Dashboard.pbix` in Power BI.
    * You may need to re-configure the data source to connect to *your* local SQL database.

---
<h2><a class="anchor" id="final-recommendations"></a>Final Recommendations</h2>

Based on the analysis, the following strategic recommendations were provided to management:

1.  **Operations: Investigate Driver Cancellations:** Immediately investigate the **17.89% driver cancellation rate**. Use SQL Query #12 (High Cancellation Locations) to see *where* this happens most. Survey drivers in those areas to find the root cause (e.g., traffic, payment issues, safety).
2.  **Marketing: High-Value Customer Loyalty:** Stop using "Booking Count" as a metric. Launch a loyalty program or offer targeted discounts to the **"Top Customers by Total Spending"** to ensure their retention.
3.  **Operations: Optimize Driver Allocation:** Increase driver supply and availability in **'Whitefield', 'Marathahalli', and 'Electronic City'** during peak hours to reduce the 'Driver Not Found' rate and capture more revenue.

---
<h2><a class="anchor" id="author--contact"></a>👤 Author & Contact</h2>

**[Aapka Naam Yahan Likhein]**
* 📧 Email: `[Aapka Email Yahan Likhein]`
* 📍 [Aapka Sheher, India]
* [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/[YOUR_LINKEDIN_PROFILE]/)
* [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/[YOUR_GITHUB_USERNAME])
